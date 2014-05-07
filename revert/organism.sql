-- Revert chado module organism

BEGIN;


    DROP TABLE IF EXISTS organism CASCADE;
DROP TABLE IF EXISTS organism_dbxref CASCADE;
DROP TABLE IF EXISTS organismprop CASCADE;



COMMIT;
