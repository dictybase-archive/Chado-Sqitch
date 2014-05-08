-- Verify chado module pub

BEGIN;


    SELECT pg_catalog.has_table_privilege('pub','select');
SELECT pg_catalog.has_column_privilege('pub', 'pub_id', 'select');
SELECT pg_catalog.has_column_privilege('pub', 'title', 'select');
SELECT pg_catalog.has_column_privilege('pub', 'volumetitle', 'select');
SELECT pg_catalog.has_column_privilege('pub', 'volume', 'select');
SELECT pg_catalog.has_column_privilege('pub', 'series_name', 'select');
SELECT pg_catalog.has_column_privilege('pub', 'issue', 'select');
SELECT pg_catalog.has_column_privilege('pub', 'pyear', 'select');
SELECT pg_catalog.has_column_privilege('pub', 'pages', 'select');
SELECT pg_catalog.has_column_privilege('pub', 'miniref', 'select');
SELECT pg_catalog.has_column_privilege('pub', 'uniquename', 'select');
SELECT pg_catalog.has_column_privilege('pub', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('pub', 'is_obsolete', 'select');
SELECT pg_catalog.has_column_privilege('pub', 'publisher', 'select');
SELECT pg_catalog.has_column_privilege('pub', 'pubplace', 'select');
SELECT pg_catalog.has_table_privilege('pub_relationship','select');
SELECT pg_catalog.has_column_privilege('pub_relationship', 'pub_relationship_id', 'select');
SELECT pg_catalog.has_column_privilege('pub_relationship', 'subject_id', 'select');
SELECT pg_catalog.has_column_privilege('pub_relationship', 'object_id', 'select');
SELECT pg_catalog.has_column_privilege('pub_relationship', 'type_id', 'select');
SELECT pg_catalog.has_table_privilege('pub_dbxref','select');
SELECT pg_catalog.has_column_privilege('pub_dbxref', 'pub_dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('pub_dbxref', 'pub_id', 'select');
SELECT pg_catalog.has_column_privilege('pub_dbxref', 'dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('pub_dbxref', 'is_current', 'select');
SELECT pg_catalog.has_table_privilege('pubauthor','select');
SELECT pg_catalog.has_column_privilege('pubauthor', 'pubauthor_id', 'select');
SELECT pg_catalog.has_column_privilege('pubauthor', 'pub_id', 'select');
SELECT pg_catalog.has_column_privilege('pubauthor', 'rank', 'select');
SELECT pg_catalog.has_column_privilege('pubauthor', 'editor', 'select');
SELECT pg_catalog.has_column_privilege('pubauthor', 'surname', 'select');
SELECT pg_catalog.has_column_privilege('pubauthor', 'givennames', 'select');
SELECT pg_catalog.has_column_privilege('pubauthor', 'suffix', 'select');
SELECT pg_catalog.has_table_privilege('pubprop','select');
SELECT pg_catalog.has_column_privilege('pubprop', 'pubprop_id', 'select');
SELECT pg_catalog.has_column_privilege('pubprop', 'pub_id', 'select');
SELECT pg_catalog.has_column_privilege('pubprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('pubprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('pubprop', 'rank', 'select');


ROLLBACK;
