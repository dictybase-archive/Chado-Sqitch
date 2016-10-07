-- Revert dictybase:user-relation from pg

BEGIN;

DROP TABLE user_relationship;

COMMIT;
