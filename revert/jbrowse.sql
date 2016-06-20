-- Revert dictybase:jbrowse from pg

BEGIN;

DROP TABLE IF EXISTS jbrowse_track CASCADE;
DROP TABLE IF EXISTS jbrowse_organism CASCADE;
DROP TABLE IF EXISTS jbrowse CASCADE;

COMMIT;
