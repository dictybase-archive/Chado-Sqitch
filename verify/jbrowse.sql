-- Verify dictybase:jbrowse on pg

BEGIN;

SELECT pg_catalog.has_table_privilege('jbrowse', 'select');
SELECT pg_catalog.has_table_privilege('jbrowse', 'insert');
SELECT pg_catalog.has_any_column_privilege('jbrowse', 'select');
SELECT pg_catalog.has_table_privilege('jbrowse_organism', 'select');
SELECT pg_catalog.has_table_privilege('jbrowse_organism', 'insert');
SELECT pg_catalog.has_any_column_privilege('jbrowse_organism', 'select');
SELECT pg_catalog.has_table_privilege('jbrowse_track', 'select');
SELECT pg_catalog.has_table_privilege('jbrowse_track', 'insert');
SELECT pg_catalog.has_any_column_privilege('jbrowse_track', 'select');

ROLLBACK;
