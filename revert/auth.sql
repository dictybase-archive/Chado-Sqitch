-- Revert dictybase:auth from pg

BEGIN;

DROP TABLE auth_permission, auth_role, auth_role_permission,
    auth_user, auth_user_info, auth_user_role; 

COMMIT;
