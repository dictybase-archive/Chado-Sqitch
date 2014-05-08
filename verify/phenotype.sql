-- Verify chado module phenotype

BEGIN;

    SELECT pg_catalog.has_table_privilege('phenotype','select');
SELECT pg_catalog.has_column_privilege('phenotype', 'phenotype_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype', 'uniquename', 'select');
SELECT pg_catalog.has_column_privilege('phenotype', 'observable_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype', 'attr_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype', 'value', 'select');
SELECT pg_catalog.has_column_privilege('phenotype', 'cvalue_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype', 'assay_id', 'select');
SELECT pg_catalog.has_table_privilege('phenotype_cvterm','select');
SELECT pg_catalog.has_column_privilege('phenotype_cvterm', 'phenotype_cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype_cvterm', 'phenotype_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype_cvterm', 'cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('phenotype_cvterm', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('feature_phenotype','select');
SELECT pg_catalog.has_column_privilege('feature_phenotype', 'feature_phenotype_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_phenotype', 'feature_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_phenotype', 'phenotype_id', 'select');


ROLLBACK;
