-- Revert chado module mage

BEGIN;


    DROP TABLE IF EXISTS mageml CASCADE;
DROP TABLE IF EXISTS magedocumentation CASCADE;
DROP TABLE IF EXISTS protocol CASCADE;
DROP TABLE IF EXISTS protocolparam CASCADE;
DROP TABLE IF EXISTS channel CASCADE;
DROP TABLE IF EXISTS arraydesign CASCADE;
DROP TABLE IF EXISTS arraydesignprop CASCADE;
DROP TABLE IF EXISTS assay CASCADE;
DROP TABLE IF EXISTS assayprop CASCADE;
DROP TABLE IF EXISTS assay_project CASCADE;
DROP TABLE IF EXISTS biomaterial CASCADE;
DROP TABLE IF EXISTS biomaterial_relationship CASCADE;
DROP TABLE IF EXISTS biomaterialprop CASCADE;
DROP TABLE IF EXISTS biomaterial_dbxref CASCADE;
DROP TABLE IF EXISTS treatment CASCADE;
DROP TABLE IF EXISTS biomaterial_treatment CASCADE;
DROP TABLE IF EXISTS assay_biomaterial CASCADE;
DROP TABLE IF EXISTS acquisition CASCADE;
DROP TABLE IF EXISTS acquisitionprop CASCADE;
DROP TABLE IF EXISTS acquisition_relationship CASCADE;
DROP TABLE IF EXISTS quantification CASCADE;
DROP TABLE IF EXISTS quantificationprop CASCADE;
DROP TABLE IF EXISTS quantification_relationship CASCADE;
DROP TABLE IF EXISTS control CASCADE;
DROP TABLE IF EXISTS element CASCADE;
DROP TABLE IF EXISTS elementresult CASCADE;
DROP TABLE IF EXISTS element_relationship CASCADE;
DROP TABLE IF EXISTS elementresult_relationship CASCADE;
DROP TABLE IF EXISTS study CASCADE;
DROP TABLE IF EXISTS study_assay CASCADE;
DROP TABLE IF EXISTS studydesign CASCADE;
DROP TABLE IF EXISTS studydesignprop CASCADE;
DROP TABLE IF EXISTS studyfactor CASCADE;
DROP TABLE IF EXISTS studyfactorvalue CASCADE;
DROP TABLE IF EXISTS studyprop CASCADE;
DROP TABLE IF EXISTS studyprop_feature CASCADE;



COMMIT;
