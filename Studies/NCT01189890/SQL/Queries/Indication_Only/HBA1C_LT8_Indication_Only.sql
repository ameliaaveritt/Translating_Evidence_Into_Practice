
SELECT 'HbA1c LT 8 percent', COUNT(*), Null, Null, Null, Null, Null, Null, Null FROM ( 
	SELECT A.person_id, AVG(A.value_as_number) AS hba1c_indiv_mean 
	FROM (
		SELECT * FROM @target_database_schema.@target_cohort_table 
		LEFT JOIN @cdm_database_schema.measurement ON (@target_cohort_table.subject_id = measurement.person_id)
		JOIN @cdm_database_schema.concept_ancestor ON (measurement.measurement_concept_id = concept_ancestor.descendant_concept_id)
		WHERE concept_ancestor.ancestor_concept_id = 40789263 AND @target_cohort_table.cohort_definition_id=1
	) A 
	GROUP BY A.person_id
) D WHERE D.hba1c_indiv_mean < 8.0
