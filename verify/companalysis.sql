-- Verify chado module companalysis

BEGIN;

    SELECT pg_catalog.has_table_privilege('analysis','select');
SELECT pg_catalog.has_column_privilege('analysis', 'analysis_id', 'select');
SELECT pg_catalog.has_column_privilege('analysis', 'name', 'select');
SELECT pg_catalog.has_column_privilege('analysis', 'description', 'select');
SELECT pg_catalog.has_column_privilege('analysis', 'program', 'select');
SELECT pg_catalog.has_column_privilege('analysis', 'programversion', 'select');
SELECT pg_catalog.has_column_privilege('analysis', 'algorithm', 'select');
SELECT pg_catalog.has_column_privilege('analysis', 'sourcename', 'select');
SELECT pg_catalog.has_column_privilege('analysis', 'sourceversion', 'select');
SELECT pg_catalog.has_column_privilege('analysis', 'sourceuri', 'select');
SELECT pg_catalog.has_column_privilege('analysis', 'timeexecuted', 'select');
SELECT pg_catalog.has_table_privilege('analysisprop','select');
SELECT pg_catalog.has_column_privilege('analysisprop', 'analysisprop_id', 'select');
SELECT pg_catalog.has_column_privilege('analysisprop', 'analysis_id', 'select');
SELECT pg_catalog.has_column_privilege('analysisprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('analysisprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('analysisprop', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('analysisfeature','select');
SELECT pg_catalog.has_column_privilege('analysisfeature', 'analysisfeature_id', 'select');
SELECT pg_catalog.has_column_privilege('analysisfeature', 'feature_id', 'select');
SELECT pg_catalog.has_column_privilege('analysisfeature', 'analysis_id', 'select');
SELECT pg_catalog.has_column_privilege('analysisfeature', 'rawscore', 'select');
SELECT pg_catalog.has_column_privilege('analysisfeature', 'normscore', 'select');
SELECT pg_catalog.has_column_privilege('analysisfeature', 'significance', 'select');
SELECT pg_catalog.has_column_privilege('analysisfeature', 'identity', 'select');
SELECT pg_catalog.has_table_privilege('analysisfeatureprop','select');
SELECT pg_catalog.has_column_privilege('analysisfeatureprop', 'analysisfeatureprop_id', 'select');
SELECT pg_catalog.has_column_privilege('analysisfeatureprop', 'analysisfeature_id', 'select');
SELECT pg_catalog.has_column_privilege('analysisfeatureprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('analysisfeatureprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('analysisfeatureprop', 'rank', 'select');


ROLLBACK;
