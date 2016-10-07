-- Verify dictybase:user-relation on pg

BEGIN;

SELECT pg_catalog.has_table_privilege('user_relationship', 'select');
SELECT pg_catalog.has_table_privilege('user_relationship', 'insert');
SELECT pg_catalog.has_any_column_privilege('user_relationship', 'select');


ROLLBACK;
