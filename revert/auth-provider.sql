-- Revert dictybase:auth-provider from pg

BEGIN;

DROP TABLE auth_provider, auth_user_provider;

COMMIT;
