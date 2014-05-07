-- Verify chado module organism


    SELECT pg_catalog.has_table_privilege('organism','select');
SELECT pg_catalog.has_column_privilege('organism', 'organism_id', 'select');
SELECT pg_catalog.has_column_privilege('organism', 'abbreviation', 'select');
SELECT pg_catalog.has_column_privilege('organism', 'genus', 'select');
SELECT pg_catalog.has_column_privilege('organism', 'species', 'select');
SELECT pg_catalog.has_column_privilege('organism', 'common_name', 'select');
SELECT pg_catalog.has_column_privilege('organism', 'comment', 'select');
SELECT pg_catalog.has_table_privilege('organism_dbxref','select');
SELECT pg_catalog.has_column_privilege('organism_dbxref', 'organism_dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('organism_dbxref', 'organism_id', 'select');
SELECT pg_catalog.has_column_privilege('organism_dbxref', 'dbxref_id', 'select');
SELECT pg_catalog.has_table_privilege('organismprop','select');
SELECT pg_catalog.has_column_privilege('organismprop', 'organismprop_id', 'select');
SELECT pg_catalog.has_column_privilege('organismprop', 'organism_id', 'select');
SELECT pg_catalog.has_column_privilege('organismprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('organismprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('organismprop', 'rank', 'select');



