-- Revert dictybase:stock-order-alteration from pg

BEGIN;

ALTER TABLE stock_order
    DROP COLUMN courier,
    DROP COLUMN courier_account,
    DROP COLUMN payment,
    DROP COLUMN comments,
    DROP COLUMN purchase_order_id,
    DROP COLUMN status;

DROP TYPE courier_name, payment_method;


COMMIT;
