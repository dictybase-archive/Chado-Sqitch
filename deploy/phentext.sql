-- Deploy phentext
-- requires: phenotype

BEGIN;

ALTER TABLE phenotype ADD COLUMN name TEXT default null;

COMMIT;
