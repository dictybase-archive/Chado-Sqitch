-- Verify chado module stock

BEGIN;

    SELECT pg_catalog.has_table_privilege('stock','select');
SELECT pg_catalog.has_column_privilege('stock', 'stock_id', 'select');
SELECT pg_catalog.has_column_privilege('stock', 'dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('stock', 'organism_id', 'select');
SELECT pg_catalog.has_column_privilege('stock', 'name', 'select');
SELECT pg_catalog.has_column_privilege('stock', 'uniquename', 'select');
SELECT pg_catalog.has_column_privilege('stock', 'description', 'select');
SELECT pg_catalog.has_column_privilege('stock', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('stock', 'is_obsolete', 'select');
SELECT pg_catalog.has_table_privilege('stock_pub','select');
SELECT pg_catalog.has_column_privilege('stock_pub', 'stock_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('stock_pub', 'stock_id', 'select');
SELECT pg_catalog.has_column_privilege('stock_pub', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('stockprop','select');
SELECT pg_catalog.has_column_privilege('stockprop', 'stockprop_id', 'select');
SELECT pg_catalog.has_column_privilege('stockprop', 'stock_id', 'select');
SELECT pg_catalog.has_column_privilege('stockprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('stockprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('stockprop', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('stockprop_pub','select');
SELECT pg_catalog.has_column_privilege('stockprop_pub', 'stockprop_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('stockprop_pub', 'stockprop_id', 'select');
SELECT pg_catalog.has_column_privilege('stockprop_pub', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('stock_relationship','select');
SELECT pg_catalog.has_column_privilege('stock_relationship', 'stock_relationship_id', 'select');
SELECT pg_catalog.has_column_privilege('stock_relationship', 'subject_id', 'select');
SELECT pg_catalog.has_column_privilege('stock_relationship', 'object_id', 'select');
SELECT pg_catalog.has_column_privilege('stock_relationship', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('stock_relationship', 'value', 'select');
SELECT pg_catalog.has_column_privilege('stock_relationship', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('stock_relationship_pub','select');
SELECT pg_catalog.has_column_privilege('stock_relationship_pub', 'stock_relationship_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('stock_relationship_pub', 'stock_relationship_id', 'select');
SELECT pg_catalog.has_column_privilege('stock_relationship_pub', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('stock_dbxref','select');
SELECT pg_catalog.has_column_privilege('stock_dbxref', 'stock_dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('stock_dbxref', 'stock_id', 'select');
SELECT pg_catalog.has_column_privilege('stock_dbxref', 'dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('stock_dbxref', 'is_current', 'select');
SELECT pg_catalog.has_table_privilege('stock_cvterm','select');
SELECT pg_catalog.has_column_privilege('stock_cvterm', 'stock_cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('stock_cvterm', 'stock_id', 'select');
SELECT pg_catalog.has_column_privilege('stock_cvterm', 'cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('stock_cvterm', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('stock_genotype','select');
SELECT pg_catalog.has_column_privilege('stock_genotype', 'stock_genotype_id', 'select');
SELECT pg_catalog.has_column_privilege('stock_genotype', 'stock_id', 'select');
SELECT pg_catalog.has_column_privilege('stock_genotype', 'genotype_id', 'select');
SELECT pg_catalog.has_table_privilege('stockcollection','select');
SELECT pg_catalog.has_column_privilege('stockcollection', 'stockcollection_id', 'select');
SELECT pg_catalog.has_column_privilege('stockcollection', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('stockcollection', 'contact_id', 'select');
SELECT pg_catalog.has_column_privilege('stockcollection', 'name', 'select');
SELECT pg_catalog.has_column_privilege('stockcollection', 'uniquename', 'select');
SELECT pg_catalog.has_table_privilege('stockcollectionprop','select');
SELECT pg_catalog.has_column_privilege('stockcollectionprop', 'stockcollectionprop_id', 'select');
SELECT pg_catalog.has_column_privilege('stockcollectionprop', 'stockcollection_id', 'select');
SELECT pg_catalog.has_column_privilege('stockcollectionprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('stockcollectionprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('stockcollectionprop', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('stockcollection_stock','select');
SELECT pg_catalog.has_column_privilege('stockcollection_stock', 'stockcollection_stock_id', 'select');
SELECT pg_catalog.has_column_privilege('stockcollection_stock', 'stockcollection_id', 'select');
SELECT pg_catalog.has_column_privilege('stockcollection_stock', 'stock_id', 'select');

ROLLBACK;