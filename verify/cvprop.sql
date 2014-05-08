-- Verify cvprop

BEGIN;

SELECT pg_catalog.has_table_privilege('cvprop','select');
SELECT pg_catalog.has_column_privilege('cvprop', 'cvprop_id', 'select');
SELECT pg_catalog.has_column_privilege('cvprop', 'cv_id', 'select');
SELECT pg_catalog.has_column_privilege('cvprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('cvprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('cvprop', 'rank', 'select');

ROLLBACK;
