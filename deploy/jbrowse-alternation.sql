-- Deploy dictybase:jbrowse-alternation to pg
-- requires: jbrowse

BEGIN;

ALTER TABLE jbrowse_organism ADD COLUMN dataset varchar(255) NOT null; 
ALTER TABLE jbrowse_organism ADD CONSTRAINT jbrowse_organism_dataset unique (dataset, jbrowse_id);
ALTER TABLE jbrowse_track ALTER COLUMN type_id DROP NOT NULL; 
ALTER TABLE jbrowse_track ADD CONSTRAINT jbrowse_track_exist_label CHECK ((configuration ? 'label'));
ALTER TABLE jbrowse_track ADD CONSTRAINT jbrowse_track_rest_baseurl
    CHECK ((configuration->>'storeClass') ~~ 'REST' AND (configuration ? 'baseUrl'));
CREATE UNIQUE INDEX jbrowse_track_unique_label ON
    jbrowse_track(jbrowse_organism_id, (configuration->>'label'));

COMMIT;
