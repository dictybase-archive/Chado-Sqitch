-- Deploy dictybase:stock-order-alteration to pg
-- requires: stock-order

BEGIN;

CREATE TYPE courier_name AS ENUM ('FedEx', 'DHL', 'UPS');
CREATE TYPE payment_method AS ENUM ('Credit card', 'Purchase order', 'Wire transfer');
ALTER TABLE stock_order
    ADD COLUMN courier courier_name,
    ADD COLUMN courier_account int,
    ADD COLUMN comments text,
    ADD COLUMN payment payment_method,
    ADD COLUMN purchase_order_id int,
    ADD COLUMN status varchar(25),
    ADD CONSTRAINT stock_order_c1 CHECK (payment = 'Purchase order' AND purchase_order_id IS NOT NULL);

COMMIT;
