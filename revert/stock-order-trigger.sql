-- Revert dictybase:stock-order-trigger from pg

BEGIN;
    DROP TRIGGER validate_purchase_order ON stock_order;
    DROP FUNCTION validate_purchase_order();
    ALTER TABLE stock_order ADD CONSTRAINT stock_order_c1 CHECK (payment = 'Purchase order' AND purchase_order_id IS NOT NULL);
COMMIT;
