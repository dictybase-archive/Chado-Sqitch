-- Revert dictybase:user-info-alteration from pg

BEGIN;
    ALTER TABLE auth_user_info
        ALTER COLUMN city TYPE varchar(255),
        ALTER COLUMN state TYPE varchar(50),
        ALTER COLUMN zipcode TYPE varchar(30),
        ALTER COLUMN country TYPE varchar(20),
        ALTER COLUMN phone TYPE varchar(30);
COMMIT;
