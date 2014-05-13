-- Verify chado module general


    SELECT pg_catalog.has_table_privilege('tableinfo','select');
SELECT pg_catalog.has_column_privilege('tableinfo', 'tableinfo_id', 'select');
SELECT pg_catalog.has_column_privilege('tableinfo', 'name', 'select');
SELECT pg_catalog.has_column_privilege('tableinfo', 'primary_key_column', 'select');
SELECT pg_catalog.has_column_privilege('tableinfo', 'is_view', 'select');
SELECT pg_catalog.has_column_privilege('tableinfo', 'view_on_table_id', 'select');
SELECT pg_catalog.has_column_privilege('tableinfo', 'superclass_table_id', 'select');
SELECT pg_catalog.has_column_privilege('tableinfo', 'is_updateable', 'select');
SELECT pg_catalog.has_column_privilege('tableinfo', 'modification_date', 'select');
SELECT pg_catalog.has_table_privilege('db','select');
SELECT pg_catalog.has_column_privilege('db', 'db_id', 'select');
SELECT pg_catalog.has_column_privilege('db', 'name', 'select');
SELECT pg_catalog.has_column_privilege('db', 'description', 'select');
SELECT pg_catalog.has_column_privilege('db', 'urlprefix', 'select');
SELECT pg_catalog.has_column_privilege('db', 'url', 'select');
SELECT pg_catalog.has_table_privilege('dbxref','select');
SELECT pg_catalog.has_column_privilege('dbxref', 'dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('dbxref', 'db_id', 'select');
SELECT pg_catalog.has_column_privilege('dbxref', 'accession', 'select');
SELECT pg_catalog.has_column_privilege('dbxref', 'version', 'select');
SELECT pg_catalog.has_column_privilege('dbxref', 'description', 'select');



