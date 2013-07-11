-- Revert chado_1.2

BEGIN;

-- XXX Add DDLs here.

DROP TABLE cvprop CASCADE;
DROP TABLE chadoprop CASCADE;

ALTER TABLE genetic_code.gencode_startcodon DROP CONSTRAINT IF EXISTS gencode_startcodon_unique;
ALTER TABLE phenotype DROP COLUMN IF EXISTS name;
ALTER TABLE genotype DROP COLUMN IF EXISTS type_id;
ALTER TABLE genotype DROP CONSTRAINT IF EXISTS genotype_type_id_fkey;

DROP TABLE genotypeprop CASCADE;
DROP TABLE projectprop CASCADE;
DROP TABLE project_relationship CASCADE;
DROP TABLE project_pub CASCADE;
DROP TABLE project_contact CASCADE;

ALTER TABLE stock ALTER organism_id SET NOT NULL;
COMMENT ON COLUMN stock.organism_id IS NULL;

DROP TABLE stock_relationship_cvterm CASCADE;

ALTER TABLE stock_cvterm DROP COLUMN IF EXISTS is_not;
ALTER TABLE stock_cvterm DROP COLUMN IF EXISTS rank;
ALTER TABLE stock_cvterm DROP CONSTRAINT IF EXISTS stock_cvterm_c1;

DROP TABLE stock_cvtermprop CASCADE;
DROP TABLE stock_dbxrefprop CASCADE;

DROP VIEW gffatts CASCADE;
DROP VIEW gff3atts;

DROP TABLE nd_geolocation CASCADE;
DROP TABLE nd_experiment CASCADE;
DROP TABLE nd_experiment_project CASCADE;
DROP TABLE nd_experimentprop CASCADE;
DROP TABLE nd_experiment_pub CASCADE;
DROP TABLE nd_geolocationprop CASCADE;
DROP TABLE nd_protocol CASCADE;
DROP TABLE nd_reagent CASCADE;
DROP TABLE nd_protocol_reagent CASCADE;
DROP TABLE nd_protocolprop CASCADE;
DROP TABLE nd_experiment_stock CASCADE;
DROP TABLE nd_experiment_protocol CASCADE;
DROP TABLE nd_experiment_phenotype CASCADE;
DROP TABLE nd_experiment_genotype CASCADE;
DROP TABLE nd_reagent_relationship CASCADE;
DROP TABLE nd_reagentprop CASCADE;
DROP TABLE nd_experiment_stockprop CASCADE;
DROP TABLE nd_experiment_stock_dbxref CASCADE;
DROP TABLE nd_experiment_dbxref CASCADE;
DROP TABLE nd_experiment_contact CASCADE;

COMMIT;
