-- Revert chado module project

BEGIN;


DROP TABLE IF EXISTS projectprop CASCADE;
DROP TABLE IF EXISTS project_relationship CASCADE;
DROP TABLE IF EXISTS project_pub CASCADE;
DROP TABLE IF EXISTS project_contact CASCADE;



COMMIT;
