-- Verify dictybase:stock-order on pg

BEGIN;

SELECT pg_catalog.has_table_privilege('stock_order', 'select');
SELECT pg_catalog.has_table_privilege('stock_order', 'insert');
SELECT pg_catalog.has_any_column_privilege('stock_order', 'select');
SELECT pg_catalog.has_table_privilege('stock_item_order', 'select');
SELECT pg_catalog.has_table_privilege('stock_item_order', 'insert');
SELECT pg_catalog.has_any_column_privilege('stock_item_order', 'select');

ROLLBACK;
