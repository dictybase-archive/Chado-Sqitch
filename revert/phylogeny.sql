-- Revert chado module phylogeny

BEGIN;


    DROP TABLE IF EXISTS phylotree CASCADE;
DROP TABLE IF EXISTS phylotree_pub CASCADE;
DROP TABLE IF EXISTS phylonode CASCADE;
DROP TABLE IF EXISTS phylonode_dbxref CASCADE;
DROP TABLE IF EXISTS phylonode_pub CASCADE;
DROP TABLE IF EXISTS phylonode_organism CASCADE;
DROP TABLE IF EXISTS phylonodeprop CASCADE;
DROP TABLE IF EXISTS phylonode_relationship CASCADE;



COMMIT;
