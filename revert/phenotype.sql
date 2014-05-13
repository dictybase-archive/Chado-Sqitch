-- Revert chado module phenotype

BEGIN;


    DROP TABLE IF EXISTS phenotype CASCADE;
DROP TABLE IF EXISTS phenotype_cvterm CASCADE;
DROP TABLE IF EXISTS feature_phenotype CASCADE;
DROP TABLE IF EXISTS phenotypeprop CASCADE;



COMMIT;
