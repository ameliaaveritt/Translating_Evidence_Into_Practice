SELECT 'Fasting Plasma Glucose (1yr prior)', Null, MIN(D.fpg_indiv_mean), percentile_disc(0.25) WITHIN GROUP (ORDER BY D.fpg_indiv_mean), percentile_disc(0.5) WITHIN GROUP (ORDER BY D.fpg_indiv_mean), 
percentile_disc(0.75) WITHIN GROUP (ORDER BY D.fpg_indiv_mean), MAX(D.fpg_indiv_mean), AVG(D.fpg_indiv_mean), STDDEV(D.fpg_indiv_mean) FROM (


		SELECT A.person_id, AVG(A.value_as_number) AS fpg_indiv_mean 
		FROM (
			SELECT * FROM @target_database_schema.@target_cohort_table LEFT JOIN @cdm_database_schema.measurement ON (@target_cohort_table.subject_id = measurement.person_id)
			JOIN @cdm_database_schema.concept_ancestor ON (measurement.measurement_concept_id = concept_ancestor.descendant_concept_id)
			WHERE concept_ancestor.ancestor_concept_id = 3037110 AND @target_cohort_table.cohort_definition_id=0
		     ) A 
		GROUP BY A.person_id
) D
