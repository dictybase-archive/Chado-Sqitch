-- Verify dictybase:stock-order-alteration on pg

BEGIN;

SELECT 1/COUNT(*) FROM pg_enum WHERE enumlabel IN ('FedEx', 'DHL', 'UPS');
SELECT 1/COUNT(*) FROM pg_enum WHERE enumlabel IN ('Credit card', 'Purchase order', 'Wire transfer');

SELECT pg_catalog.has_column_privilege('stock_order', 'courier', 'select');
SELECT pg_catalog.has_column_privilege('stock_order', 'courier_account', 'select');
SELECT pg_catalog.has_column_privilege('stock_order', 'payment', 'select');
SELECT pg_catalog.has_column_privilege('stock_order', 'comments', 'select');
SELECT pg_catalog.has_column_privilege('stock_order', 'purchase_order_id', 'select');
SELECT pg_catalog.has_column_privilege('stock_order', 'status', 'select');

ROLLBACK;
