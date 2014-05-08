-- Deploy gentypeid
-- requires: genetic

BEGIN;

ALTER TABLE genotype ADD COLUMN type_id INT NOT NULL;
ALTER TABLE genotype ADD CONSTRAINT genotype_type_id_fkey FOREIGN KEY (type_id) REFERENCES cvterm (cvterm_id) ON DELETE CASCADE;

COMMIT;
