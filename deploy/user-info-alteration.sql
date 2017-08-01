-- Deploy dictybase:user-info-alteration to pg
-- requires: auth

BEGIN;
    ALTER TABLE auth_user_info
        ALTER COLUMN city TYPE text,
        ALTER COLUMN state TYPE text,
        ALTER COLUMN zipcode TYPE text,
        ALTER COLUMN country TYPE text,
        ALTER COLUMN phone TYPE text;
COMMIT;
