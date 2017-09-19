-- Revert dictybase:stock-annotation from pg

BEGIN;

    DROP TABLE IF EXISTS stock_user_annotation CASCADE;

COMMIT;
