-- Revert chado module genetic

BEGIN;


    DROP TABLE IF EXISTS genotype CASCADE;
DROP TABLE IF EXISTS feature_genotype CASCADE;
DROP TABLE IF EXISTS environment CASCADE;
DROP TABLE IF EXISTS environment_cvterm CASCADE;
DROP TABLE IF EXISTS phenstatement CASCADE;
DROP TABLE IF EXISTS phendesc CASCADE;
DROP TABLE IF EXISTS phenotype_comparison CASCADE;
DROP TABLE IF EXISTS phenotype_comparison_cvterm CASCADE;



COMMIT;
