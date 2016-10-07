-- Verify dictybase:auth-provider on pg

BEGIN;

SELECT 1/COUNT(*) FROM pg_extension where extname = 'citext';

SELECT pg_catalog.has_table_privilege('auth_user_provider', 'select');
SELECT pg_catalog.has_table_privilege('auth_user_provider', 'insert');
SELECT pg_catalog.has_any_column_privilege('auth_user_provider', 'select');
SELECT pg_catalog.has_table_privilege('auth_user_provider', 'select');
SELECT pg_catalog.has_table_privilege('auth_user_provider', 'insert');
SELECT pg_catalog.has_any_column_privilege('auth_user_provider', 'select');

ROLLBACK;
