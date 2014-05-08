-- Verify gentypeid

BEGIN;

SELECT pg_catalog.has_column_privilege('genotype', 'type_id', 'select');
SELECT 1/COUNT(*) FROM information_schema.table_constraints where table_name = 'genotype'
    AND constraint_name = 'genotype_type_id_fkey' AND constraint_type = 'FOREIGN KEY';

ROLLBACK;
