-- Revert dictybase:stock-order from pg

BEGIN;

DROP TABLE stock_order, stock_item_order;

COMMIT;
