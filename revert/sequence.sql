-- Revert chado module sequence

BEGIN;


    DROP TABLE IF EXISTS feature CASCADE;
DROP SEQUENCE IF EXISTS feature_uniquename_seq;
DROP TABLE IF EXISTS featureloc CASCADE;
DROP TABLE IF EXISTS featureloc_pub CASCADE;
DROP TABLE IF EXISTS feature_pub CASCADE;
DROP TABLE IF EXISTS feature_pubprop CASCADE;
DROP TABLE IF EXISTS featureprop CASCADE;
DROP TABLE IF EXISTS featureprop_pub CASCADE;
DROP TABLE IF EXISTS feature_dbxref CASCADE;
DROP TABLE IF EXISTS feature_relationship CASCADE;
DROP TABLE IF EXISTS feature_relationship_pub CASCADE;
DROP TABLE IF EXISTS feature_relationshipprop CASCADE;
DROP TABLE IF EXISTS feature_relationshipprop_pub CASCADE;
DROP TABLE IF EXISTS feature_cvterm CASCADE;
DROP TABLE IF EXISTS feature_cvtermprop CASCADE;
DROP TABLE IF EXISTS feature_cvterm_dbxref CASCADE;
DROP TABLE IF EXISTS feature_cvterm_pub CASCADE;
DROP TABLE IF EXISTS synonym CASCADE;
DROP TABLE IF EXISTS feature_synonym CASCADE;



COMMIT;
