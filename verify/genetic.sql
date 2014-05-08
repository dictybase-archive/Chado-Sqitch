-- Verify chado module genetic

BEGIN;


    SELECT pg_catalog.has_table_privilege('genotype','select');
SELECT pg_catalog.has_column_privilege('genotype', 'genotype_id', 'select');
SELECT pg_catalog.has_column_privilege('genotype', 'name', 'select');
SELECT pg_catalog.has_column_privilege('genotype', 'uniquename', 'select');
SELECT pg_catalog.has_column_privilege('genotype', 'description', 'select');
SELECT pg_catalog.has_table_privilege('feature_genotype','select');
SELECT pg_catalog.has_column_privilege('feature_genotype', 'feature_genotype_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_genotype', 'feature_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_genotype', 'genotype_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_genotype', 'chromosome_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_genotype', 'rank', 'select');
SELECT pg_catalog.has_column_privilege('feature_genotype', 'cgroup', 'select');
SELECT pg_catalog.has_column_privilege('feature_genotype', 'cvterm_id', 'select');
SELECT pg_catalog.has_table_privilege('environment','select');
SELECT pg_catalog.has_column_privilege('environment', 'environment_id', 'select');
SELECT pg_catalog.has_column_privilege('environment', 'uniquename', 'select');
SELECT pg_catalog.has_column_privilege('environment', 'description', 'select');
SELECT pg_catalog.has_table_privilege('environment_cvterm','select');
SELECT pg_catalog.has_column_privilege('environment_cvterm', 'environment_cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('environment_cvterm', 'environment_id', 'select');
SELECT pg_catalog.has_column_privilege('environment_cvterm', 'cvterm_id', 'select');
SELECT pg_catalog.has_table_privilege('phenstatement','select');
SELECT pg_catalog.has_column_privilege('phenstatement', 'phenstatement_id', 'select');
SELECT pg_catalog.has_column_privilege('phenstatement', 'genotype_id', 'select');
SELECT pg_catalog.has_column_privilege('phenstatement', 'environment_id', 'select');
SELECT pg_catalog.has_column_privilege('phenstatement', 'phenotype_id', 'select');
SELECT pg_catalog.has_column_privilege('phenstatement', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('phenstatement', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('phendesc','select');
SELECT pg_catalog.has_column_privilege('phendesc', 'phendesc_id', 'select');
SELECT pg_catalog.has_column_privilege('phendesc', 'genotype_id', 'select');
SELECT pg_catalog.has_column_privilege('phendesc', 'environment_id', 'select');
SELECT pg_catalog.has_column_privilege('phendesc', 'description', 'select');
SELECT pg_catalog.has_column_privilege('phendesc', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('phendesc', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('phenotype_comparison','select');
SELECT pg_catalog.has_column_privilege('phenotype_comparison', 'phenotype_comparison_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype_comparison', 'genotype1_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype_comparison', 'environment1_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype_comparison', 'genotype2_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype_comparison', 'environment2_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype_comparison', 'phenotype1_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype_comparison', 'phenotype2_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype_comparison', 'pub_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype_comparison', 'organism_id', 'select');
SELECT pg_catalog.has_table_privilege('phenotype_comparison_cvterm','select');
SELECT pg_catalog.has_column_privilege('phenotype_comparison_cvterm', 'phenotype_comparison_cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype_comparison_cvterm', 'phenotype_comparison_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype_comparison_cvterm', 'cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype_comparison_cvterm', 'pub_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype_comparison_cvterm', 'rank', 'select');


ROLLBACK;
