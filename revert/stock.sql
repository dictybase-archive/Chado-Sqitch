-- Revert chado module stock

BEGIN;


    DROP TABLE IF EXISTS stock CASCADE;
DROP TABLE IF EXISTS stock_pub CASCADE;
DROP TABLE IF EXISTS stockprop CASCADE;
DROP TABLE IF EXISTS stockprop_pub CASCADE;
DROP TABLE IF EXISTS stock_relationship CASCADE;
DROP TABLE IF EXISTS stock_relationship_cvterm CASCADE;
DROP TABLE IF EXISTS stock_relationship_pub CASCADE;
DROP TABLE IF EXISTS stock_dbxref CASCADE;
DROP TABLE IF EXISTS stock_cvterm CASCADE;
DROP TABLE IF EXISTS stock_cvtermprop CASCADE;
DROP TABLE IF EXISTS stock_genotype CASCADE;
DROP TABLE IF EXISTS stockcollection CASCADE;
DROP TABLE IF EXISTS stockcollectionprop CASCADE;
DROP TABLE IF EXISTS stockcollection_stock CASCADE;
DROP TABLE IF EXISTS stock_dbxrefprop CASCADE;



COMMIT;
