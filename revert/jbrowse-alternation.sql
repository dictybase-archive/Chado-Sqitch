-- Revert dictybase:jbrowse-alternation from pg

BEGIN;

ALTER TABLE jbrowse_organism DROP CONSTRAINT jbrowse_organism_dataset;
ALTER TABLE jbrowse_organism DROP COLUMN dataset;
ALTER TABLE jbrowse_track ALTER COLUMN type_id SET NOT NULL; 
ALTER TABLE jbrowse_track DROP CONSTRAINT jbrowse_track_exist_label;
ALTER TABLE jbrowse_track DROP CONSTRAINT jbrowse_track_rest_baseurl;
DROP INDEX jbrowse_track_unique_label;

COMMIT;
