-- Verify dictybase:jbrowse-alternation on pg

BEGIN;

SELECT pg_catalog.has_any_column_privilege('jbrowse_organism', 'dataset' 'select');
SELECT pg_catalog.has_any_column_privilege('jbrowse_organism', 'dataset' 'insert');

ROLLBACK;
