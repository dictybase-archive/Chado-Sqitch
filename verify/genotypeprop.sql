-- Verify genotypeprop

BEGIN;


SELECT pg_catalog.has_table_privilege('genotypeprop','select');
SELECT pg_catalog.has_column_privilege('genotypeprop', 'genotypeprop_id', 'select');
SELECT pg_catalog.has_column_privilege('genotypeprop', 'genotype_id', 'select');
SELECT pg_catalog.has_column_privilege('genotypeprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('genotypeprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('genotypeprop', 'rank', 'select');

ROLLBACK;
