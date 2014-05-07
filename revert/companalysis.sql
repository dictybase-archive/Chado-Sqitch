-- Revert chado module companalysis

BEGIN;


    DROP TABLE IF EXISTS analysis CASCADE;
DROP TABLE IF EXISTS analysisprop CASCADE;
DROP TABLE IF EXISTS analysisfeature CASCADE;
DROP TABLE IF EXISTS analysisfeatureprop CASCADE;



COMMIT;
