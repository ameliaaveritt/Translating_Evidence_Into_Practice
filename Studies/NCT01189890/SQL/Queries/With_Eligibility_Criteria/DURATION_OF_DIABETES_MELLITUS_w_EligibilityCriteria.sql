SELECT 'Years Since Diabetes Mellitus', Null, MIN(D.years_dm_dx), percentile_disc(0.25) WITHIN GROUP (ORDER BY D.years_dm_dx), 
percentile_disc(0.5) WITHIN GROUP (ORDER BY D.years_dm_dx), percentile_disc(0.75) WITHIN GROUP (ORDER BY D.years_dm_dx), 
MAX(D.years_dm_dx), AVG(D.years_dm_dx), STDDEV(D.years_dm_dx)FROM (
	SELECT C.person_id, (C.cohort_start_date - MIN(C.condition_start_date))/365.0 AS years_dm_dx
	FROM (
		SELECT * 
			FROM (
			SELECT A.person_id, A.cohort_start_date, A.condition_start_date, A.condition_concept_id, 
			concept_ancestor.ancestor_concept_id, concept_ancestor.descendant_concept_id 
				FROM(
					SELECT * FROM @target_database_schema.@target_cohort_table LEFT JOIN @cdm_database_schema.condition_occurrence ON (@target_cohort_table.subject_id = condition_occurrence.person_id)
				    ) A
			LEFT JOIN @cdm_database_schema.concept_ancestor ON (condition_concept_id=concept_ancestor.descendant_concept_id) WHERE cohort_definition_id=0  
			) B
		WHERE B.condition_start_date <= B.cohort_start_date AND B.ancestor_concept_id = 35502089
	) C 
	GROUP BY C.person_id, C.cohort_start_date
) D
