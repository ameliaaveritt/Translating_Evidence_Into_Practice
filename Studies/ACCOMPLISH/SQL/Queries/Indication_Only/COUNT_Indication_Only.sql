﻿SELECT 'N=', COUNT(subject_id), Null, Null, Null, Null, Null, Null, Null 
FROM @target_database_schema.@target_cohort_table WHERE cohort_definition_id=1

