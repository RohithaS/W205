#Test whether there is a correlation between hospital scores and survey results

--------------------------------------------------------------------------------------------------------------------------------------
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
from effective_care a
where a.score is not null and a.sample is not null and cast (a.sample as int) > 100
group by provider_id, hospital_name;
#Join the tables
drop table scores;
create table scores as
select a.provider_id, a.hospital_name, a.avg_score as crdscore, b.avg_score as tecscore, (a.avg_score * b.avg_score) as total_score
from readmissions_scores a
inner join effective_care_scores b
on (a.provider_id = b.provider_id);
--------------------------------------------------------------------------------------------------------------------------------------

#Combining hospital scores and survey scores
drop table survey_scores;
create table survey_scores as
select a.*, cast (substring(b.overall_achieve, 1, 1) as int) as overall_achieve, cast (b.hcahps_base_score as int) as base_score, cast(b.hcahps_consistency_score as int) as consistency_score
from scores a
inner join survey_responses b
on (a.provider_id = b.provider_id);


#Correlation between total_score and survey measures
select corr(total_score, overall_achieve), corr(total_score, base_score), corr(total_score, consistency_score)
from survey_scores;

#Correlation between average timely and effective care scores, and survey measures
select corr(tecscore, overall_achieve), corr(tecscore, base_score), corr(tecscore, consistency_score)
from survey_scores;
