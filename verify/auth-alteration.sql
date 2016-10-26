-- Verify dictybase:auth-alteration on pg

BEGIN;

SELECT 1/COUNT(*) FROM information_schema.table_constraints WHERE table_name = 'auth_user_role' and constraint_name = 'auth_user_role_pkey';

ROLLBACK;
