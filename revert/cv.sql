-- Revert chado module cv

BEGIN;


    DROP TABLE IF EXISTS cv CASCADE;
DROP TABLE IF EXISTS cvterm CASCADE;
DROP TABLE IF EXISTS cvterm_relationship CASCADE;
DROP TABLE IF EXISTS cvtermpath CASCADE;
DROP TABLE IF EXISTS cvtermsynonym CASCADE;
DROP TABLE IF EXISTS cvterm_dbxref CASCADE;
DROP TABLE IF EXISTS cvtermprop CASCADE;
DROP TABLE IF EXISTS dbxrefprop CASCADE;



COMMIT;
