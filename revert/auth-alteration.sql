-- Revert dictybase:auth-alteration from pg

BEGIN;

ALTER TABLE auth_user_role drop constraint auth_user_role_pkey;

COMMIT;
