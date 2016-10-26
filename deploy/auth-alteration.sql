-- Deploy dictybase:auth-alteration to pg
-- requires: auth

BEGIN;

ALTER TABLE auth_user_role ADD PRIMARY KEY(auth_user_role_id);

COMMIT;
