SELECT 'HbA1c percent 1yr prior', Null, MIN(D.hba1c_indiv_mean), percentile_disc(0.25) WITHIN GROUP (ORDER BY D.hba1c_indiv_mean), percentile_disc(0.5) WITHIN GROUP (ORDER BY D.hba1c_indiv_mean), 
percentile_disc(0.75) WITHIN GROUP (ORDER BY D.hba1c_indiv_mean), MAX(D.hba1c_indiv_mean), AVG(D.hba1c_indiv_mean), STDDEV(D.hba1c_indiv_mean) FROM (


		SELECT A.person_id, AVG(A.value_as_number) AS hba1c_indiv_mean 
		FROM (
			SELECT * FROM @target_database_schema.@target_cohort_table LEFT JOIN @cdm_database_schema.measurement ON (@target_cohort_table.subject_id = measurement.person_id)
			JOIN @cdm_database_schema.concept_ancestor ON (measurement.measurement_concept_id = concept_ancestor.descendant_concept_id)
			WHERE concept_ancestor.ancestor_concept_id = 40789263 AND @target_cohort_table.cohort_definition_id=0
		     ) A 
		WHERE A.cohort_start_date - A.measurement_date <= 365
		GROUP BY A.person_id
) D
