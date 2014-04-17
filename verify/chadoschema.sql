-- Verify chadoschema

BEGIN;

SELECT pg_catalog.has_schema_privilege('chado', 'usage');

ROLLBACK;
