-- Verify dictybase:auth on pg

BEGIN;
SELECT 1/COUNT(*) FROM pg_extension where extname = 'citext';

SELECT pg_catalog.has_table_privilege('auth_permission', 'select');
SELECT pg_catalog.has_table_privilege('auth_permission', 'insert');
SELECT pg_catalog.has_any_column_privilege('auth_permission', 'select');
SELECT pg_catalog.has_table_privilege('auth_role', 'select');
SELECT pg_catalog.has_table_privilege('auth_role', 'insert');
SELECT pg_catalog.has_any_column_privilege('auth_role', 'select');
SELECT pg_catalog.has_table_privilege('auth_role_permission', 'select');
SELECT pg_catalog.has_table_privilege('auth_role_permission', 'insert');
SELECT pg_catalog.has_any_column_privilege('auth_role_permission', 'select');
SELECT pg_catalog.has_table_privilege('auth_user', 'insert');
SELECT pg_catalog.has_table_privilege('auth_user', 'select');
SELECT pg_catalog.has_any_column_privilege('auth_user', 'select');
SELECT pg_catalog.has_table_privilege('auth_user_info', 'insert');
SELECT pg_catalog.has_table_privilege('auth_user_info', 'select');
SELECT pg_catalog.has_any_column_privilege('auth_user_info', 'select');
SELECT pg_catalog.has_table_privilege('auth_user_role', 'insert');
SELECT pg_catalog.has_table_privilege('auth_user_role', 'select');
SELECT pg_catalog.has_any_column_privilege('auth_user_role', 'select');

ROLLBACK;
