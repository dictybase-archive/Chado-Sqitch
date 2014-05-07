-- Verify chado module library


    SELECT pg_catalog.has_table_privilege('library','select');
SELECT pg_catalog.has_column_privilege('library', 'library_id', 'select');
SELECT pg_catalog.has_column_privilege('library', 'organism_id', 'select');
SELECT pg_catalog.has_column_privilege('library', 'name', 'select');
SELECT pg_catalog.has_column_privilege('library', 'uniquename', 'select');
SELECT pg_catalog.has_column_privilege('library', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('library', 'is_obsolete', 'select');
SELECT pg_catalog.has_column_privilege('library', 'timeaccessioned', 'select');
SELECT pg_catalog.has_column_privilege('library', 'timelastmodified', 'select');
SELECT pg_catalog.has_table_privilege('library_synonym','select');
SELECT pg_catalog.has_column_privilege('library_synonym', 'library_synonym_id', 'select');
SELECT pg_catalog.has_column_privilege('library_synonym', 'synonym_id', 'select');
SELECT pg_catalog.has_column_privilege('library_synonym', 'library_id', 'select');
SELECT pg_catalog.has_column_privilege('library_synonym', 'pub_id', 'select');
SELECT pg_catalog.has_column_privilege('library_synonym', 'is_current', 'select');
SELECT pg_catalog.has_column_privilege('library_synonym', 'is_internal', 'select');
SELECT pg_catalog.has_table_privilege('library_pub','select');
SELECT pg_catalog.has_column_privilege('library_pub', 'library_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('library_pub', 'library_id', 'select');
SELECT pg_catalog.has_column_privilege('library_pub', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('libraryprop','select');
SELECT pg_catalog.has_column_privilege('libraryprop', 'libraryprop_id', 'select');
SELECT pg_catalog.has_column_privilege('libraryprop', 'library_id', 'select');
SELECT pg_catalog.has_column_privilege('libraryprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('libraryprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('libraryprop', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('libraryprop_pub','select');
SELECT pg_catalog.has_column_privilege('libraryprop_pub', 'libraryprop_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('libraryprop_pub', 'libraryprop_id', 'select');
SELECT pg_catalog.has_column_privilege('libraryprop_pub', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('library_cvterm','select');
SELECT pg_catalog.has_column_privilege('library_cvterm', 'library_cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('library_cvterm', 'library_id', 'select');
SELECT pg_catalog.has_column_privilege('library_cvterm', 'cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('library_cvterm', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('library_feature','select');
SELECT pg_catalog.has_column_privilege('library_feature', 'library_feature_id', 'select');
SELECT pg_catalog.has_column_privilege('library_feature', 'library_id', 'select');
SELECT pg_catalog.has_column_privilege('library_feature', 'feature_id', 'select');
SELECT pg_catalog.has_table_privilege('library_dbxref','select');
SELECT pg_catalog.has_column_privilege('library_dbxref', 'library_dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('library_dbxref', 'library_id', 'select');
SELECT pg_catalog.has_column_privilege('library_dbxref', 'dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('library_dbxref', 'is_current', 'select');



