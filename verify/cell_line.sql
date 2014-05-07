-- Verify chado module cell_line


    SELECT pg_catalog.has_table_privilege('cell_line','select');
SELECT pg_catalog.has_column_privilege('cell_line', 'cell_line_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line', 'name', 'select');
SELECT pg_catalog.has_column_privilege('cell_line', 'uniquename', 'select');
SELECT pg_catalog.has_column_privilege('cell_line', 'organism_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line', 'timeaccessioned', 'select');
SELECT pg_catalog.has_column_privilege('cell_line', 'timelastmodified', 'select');
SELECT pg_catalog.has_table_privilege('cell_line_relationship','select');
SELECT pg_catalog.has_column_privilege('cell_line_relationship', 'cell_line_relationship_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_relationship', 'subject_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_relationship', 'object_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_relationship', 'type_id', 'select');
SELECT pg_catalog.has_table_privilege('cell_line_synonym','select');
SELECT pg_catalog.has_column_privilege('cell_line_synonym', 'cell_line_synonym_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_synonym', 'cell_line_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_synonym', 'synonym_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_synonym', 'pub_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_synonym', 'is_current', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_synonym', 'is_internal', 'select');
SELECT pg_catalog.has_table_privilege('cell_line_cvterm','select');
SELECT pg_catalog.has_column_privilege('cell_line_cvterm', 'cell_line_cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_cvterm', 'cell_line_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_cvterm', 'cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_cvterm', 'pub_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_cvterm', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('cell_line_dbxref','select');
SELECT pg_catalog.has_column_privilege('cell_line_dbxref', 'cell_line_dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_dbxref', 'cell_line_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_dbxref', 'dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_dbxref', 'is_current', 'select');
SELECT pg_catalog.has_table_privilege('cell_lineprop','select');
SELECT pg_catalog.has_column_privilege('cell_lineprop', 'cell_lineprop_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_lineprop', 'cell_line_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_lineprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_lineprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('cell_lineprop', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('cell_lineprop_pub','select');
SELECT pg_catalog.has_column_privilege('cell_lineprop_pub', 'cell_lineprop_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_lineprop_pub', 'cell_lineprop_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_lineprop_pub', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('cell_line_feature','select');
SELECT pg_catalog.has_column_privilege('cell_line_feature', 'cell_line_feature_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_feature', 'cell_line_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_feature', 'feature_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_feature', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('cell_line_cvtermprop','select');
SELECT pg_catalog.has_column_privilege('cell_line_cvtermprop', 'cell_line_cvtermprop_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_cvtermprop', 'cell_line_cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_cvtermprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_cvtermprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_cvtermprop', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('cell_line_pub','select');
SELECT pg_catalog.has_column_privilege('cell_line_pub', 'cell_line_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_pub', 'cell_line_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_pub', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('cell_line_library','select');
SELECT pg_catalog.has_column_privilege('cell_line_library', 'cell_line_library_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_library', 'cell_line_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_library', 'library_id', 'select');
SELECT pg_catalog.has_column_privilege('cell_line_library', 'pub_id', 'select');



