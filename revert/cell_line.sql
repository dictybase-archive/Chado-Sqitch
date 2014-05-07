-- Revert chado module cell_line

BEGIN;


    DROP TABLE IF EXISTS cell_line CASCADE;
DROP TABLE IF EXISTS cell_line_relationship CASCADE;
DROP TABLE IF EXISTS cell_line_synonym CASCADE;
DROP TABLE IF EXISTS cell_line_cvterm CASCADE;
DROP TABLE IF EXISTS cell_line_dbxref CASCADE;
DROP TABLE IF EXISTS cell_lineprop CASCADE;
DROP TABLE IF EXISTS cell_lineprop_pub CASCADE;
DROP TABLE IF EXISTS cell_line_feature CASCADE;
DROP TABLE IF EXISTS cell_line_cvtermprop CASCADE;
DROP TABLE IF EXISTS cell_line_pub CASCADE;
DROP TABLE IF EXISTS cell_line_library CASCADE;



COMMIT;
