-- Revert gentypeid

BEGIN;

ALTER TABLE DROP COLUMN IF EXISTS type_id CASCADE;

COMMIT;