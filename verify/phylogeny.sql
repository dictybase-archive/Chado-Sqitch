-- Verify chado module phylogeny


    SELECT pg_catalog.has_table_privilege('phylotree','select');
SELECT pg_catalog.has_column_privilege('phylotree', 'phylotree_id', 'select');
SELECT pg_catalog.has_column_privilege('phylotree', 'dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('phylotree', 'name', 'select');
SELECT pg_catalog.has_column_privilege('phylotree', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('phylotree', 'analysis_id', 'select');
SELECT pg_catalog.has_column_privilege('phylotree', 'comment', 'select');
SELECT pg_catalog.has_table_privilege('phylotree_pub','select');
SELECT pg_catalog.has_column_privilege('phylotree_pub', 'phylotree_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('phylotree_pub', 'phylotree_id', 'select');
SELECT pg_catalog.has_column_privilege('phylotree_pub', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('phylonode','select');
SELECT pg_catalog.has_column_privilege('phylonode', 'phylonode_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonode', 'phylotree_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonode', 'parent_phylonode_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonode', 'left_idx', 'select');
SELECT pg_catalog.has_column_privilege('phylonode', 'right_idx', 'select');
SELECT pg_catalog.has_column_privilege('phylonode', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonode', 'feature_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonode', 'label', 'select');
SELECT pg_catalog.has_column_privilege('phylonode', 'distance', 'select');
SELECT pg_catalog.has_table_privilege('phylonode_dbxref','select');
SELECT pg_catalog.has_column_privilege('phylonode_dbxref', 'phylonode_dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonode_dbxref', 'phylonode_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonode_dbxref', 'dbxref_id', 'select');
SELECT pg_catalog.has_table_privilege('phylonode_pub','select');
SELECT pg_catalog.has_column_privilege('phylonode_pub', 'phylonode_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonode_pub', 'phylonode_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonode_pub', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('phylonode_organism','select');
SELECT pg_catalog.has_column_privilege('phylonode_organism', 'phylonode_organism_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonode_organism', 'phylonode_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonode_organism', 'organism_id', 'select');
SELECT pg_catalog.has_table_privilege('phylonodeprop','select');
SELECT pg_catalog.has_column_privilege('phylonodeprop', 'phylonodeprop_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonodeprop', 'phylonode_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonodeprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonodeprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('phylonodeprop', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('phylonode_relationship','select');
SELECT pg_catalog.has_column_privilege('phylonode_relationship', 'phylonode_relationship_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonode_relationship', 'subject_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonode_relationship', 'object_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonode_relationship', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('phylonode_relationship', 'rank', 'select');
SELECT pg_catalog.has_column_privilege('phylonode_relationship', 'phylotree_id', 'select');



