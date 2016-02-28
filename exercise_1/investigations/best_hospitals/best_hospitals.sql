#Creates a table of hospitals from readmissions tables with corresponding avg_scores
drop table readmissions_scores;
create table readmissions_scores as
select a.provider_id, a.hospital_name, avg(cast(a.score as int)) as avg_score
from readmissions a
where score is not null and denominator is not null and cast (denominator as int) > 100
group by provider_id, hospital_name;

#Create table of states with average score for effective_care
drop table effective_care_scores;
create table effective_care_scores as
select a.provider_id, a.hospital_name, avg(cast(a.score as int)) as avg_score
from readmissions a
where a.score is not null and a.sample is not null and cast (a.sample as int) > 100
group by provider_id, hospital_name;

#Join the tables, which have already been filtered for "sufficient" sample size (>100)--
drop table scores;
create table scores as
select a.provider_id, a.hospital_name, a.avg_score as crdscore, b.avg_score as tecscore, (a.avg_score * b.avg_score) as total_score
from readmissions_scores a
inner join effective_care_scores b
on (a.provider_id = b.provider_id);

#Select top 10 hospitals in readmissions score--
select hospital_name, crdscore
from scores
order by crdscore desc
limit 1;

#Select top 10 hospitals in effective_care_scoresc
select hospital_name, tecscore
from scores
order by tecscore desc
limit 1;

#Select top 10 hospitals in total score--
select hospital_name, total_score
from scores
order by total_score desc
limit 10;
