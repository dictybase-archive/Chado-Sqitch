-- Revert genotypeprop

BEGIN;

DROP TABLE IF EXISTS genotypeprop CASCADE;

COMMIT;
