#To investigate procedures' variance across hospitals, we first create a table mapping procedures to variability, filtering scores
drop table procedure_variability;
create table procedure_variability as
select measure_id, measure_name, variance(cast(score as int)) as measure_var
from hospital_survey
where score is not null and (sample is not null and cast (sample as int) > 50) or (denominator is not null and cast(denominator as int) > 50)
group by measure_id, measure_name;

# Top 10 variable procedures in hospitals
select *
from procedure_variability
order by measure_var desc
limit 10;
