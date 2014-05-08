-- Verify phentext

BEGIN;

SELECT pg_catalog.has_column_privilege('phenotype', 'name', 'select');

ROLLBACK;
