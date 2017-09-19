-- Verify dictybase:stock-annotation on pg

BEGIN;

    SELECT pg_catalog.has_table_privilege('stock_user_annotation','select');
    SELECT pg_catalog.has_column_privilege('stock_user_annotation', 'stock_user_annotation_id', 'select');
    SELECT pg_catalog.has_column_privilege('stock_user_annotation', 'created_user_id', 'select');
    SELECT pg_catalog.has_column_privilege('stock_user_annotation', 'modified_user_id', 'select');
    SELECT pg_catalog.has_column_privilege('stock_user_annotation', 'stock_id', 'select');

ROLLBACK;
