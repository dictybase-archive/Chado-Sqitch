-- Deploy dictybase:stock-order-trigger to pg
-- requires: stock-order-alteration

BEGIN;

    ALTER TABLE stock_order DROP CONSTRAINT stock_order_c1;

    CREATE OR REPLACE FUNCTION validate_purchase_order() RETURNS TRIGGER AS $$
    BEGIN
        IF NEW.purchase_order_id IS NULL 
            THEN
                RAISE 'need a purchase order id for payment %', NEW.payment
                    USING HINT = 'supply a value for column purchase_order_id';
        END IF;
    END;
    $$ LANGUAGE plpgsql;

    CREATE TRIGGER validate_purchase_order 
        BEFORE INSERT 
        ON stock_order
        FOR EACH ROW 
        WHEN (NEW.payment = 'Purchase order')
        EXECUTE PROCEDURE validate_purchase_order();

COMMIT;
