-- Revert cvprop

BEGIN;

DROP TABLE IF EXISTS cvprop CASCADE;

COMMIT;
