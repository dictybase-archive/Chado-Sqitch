-- Revert chado module general

BEGIN;


    DROP TABLE IF EXISTS tableinfo CASCADE;
DROP TABLE IF EXISTS db CASCADE;
DROP TABLE IF EXISTS dbxref CASCADE;
DROP TABLE IF EXISTS project CASCADE;



COMMIT;