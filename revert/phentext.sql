-- Revert phentext

BEGIN;

ALTER TABLE phenotype DROP COLUMN IF EXISTS name;

COMMIT;
