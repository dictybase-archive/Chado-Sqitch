-- Revert chado module natural-diversity

BEGIN;


    DROP TABLE IF EXISTS nd_geolocation CASCADE;
DROP TABLE IF EXISTS nd_experiment CASCADE;
DROP TABLE IF EXISTS nd_experiment_project CASCADE;
DROP TABLE IF EXISTS nd_experimentprop CASCADE;
DROP TABLE IF EXISTS nd_experiment_pub CASCADE;
DROP TABLE IF EXISTS nd_geolocationprop CASCADE;
DROP TABLE IF EXISTS nd_protocol CASCADE;
DROP TABLE IF EXISTS nd_reagent CASCADE;
DROP TABLE IF EXISTS nd_protocol_reagent CASCADE;
DROP TABLE IF EXISTS nd_protocolprop CASCADE;
DROP TABLE IF EXISTS nd_experiment_stock CASCADE;
DROP TABLE IF EXISTS nd_experiment_protocol CASCADE;
DROP TABLE IF EXISTS nd_experiment_phenotype CASCADE;
DROP TABLE IF EXISTS nd_experiment_genotype CASCADE;
DROP TABLE IF EXISTS nd_reagent_relationship CASCADE;
DROP TABLE IF EXISTS nd_reagentprop CASCADE;
DROP TABLE IF EXISTS nd_experiment_stockprop CASCADE;
DROP TABLE IF EXISTS nd_experiment_stock_dbxref CASCADE;
DROP TABLE IF EXISTS nd_experiment_dbxref CASCADE;
DROP TABLE IF EXISTS nd_experiment_contact CASCADE;



COMMIT;
