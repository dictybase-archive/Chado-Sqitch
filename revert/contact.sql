-- Revert chado module contact

BEGIN;


    DROP TABLE IF EXISTS contact CASCADE;
DROP TABLE IF EXISTS contact_relationship CASCADE;



COMMIT;
