-- Verify chado module cv


    SELECT pg_catalog.has_table_privilege('cv','select');
SELECT pg_catalog.has_column_privilege('cv', 'cv_id', 'select');
SELECT pg_catalog.has_column_privilege('cv', 'name', 'select');
SELECT pg_catalog.has_column_privilege('cv', 'definition', 'select');
SELECT pg_catalog.has_table_privilege('cvterm','select');
SELECT pg_catalog.has_column_privilege('cvterm', 'cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('cvterm', 'cv_id', 'select');
SELECT pg_catalog.has_column_privilege('cvterm', 'name', 'select');
SELECT pg_catalog.has_column_privilege('cvterm', 'definition', 'select');
SELECT pg_catalog.has_column_privilege('cvterm', 'dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('cvterm', 'is_obsolete', 'select');
SELECT pg_catalog.has_column_privilege('cvterm', 'is_relationshiptype', 'select');
SELECT pg_catalog.has_table_privilege('cvterm_relationship','select');
SELECT pg_catalog.has_column_privilege('cvterm_relationship', 'cvterm_relationship_id', 'select');
SELECT pg_catalog.has_column_privilege('cvterm_relationship', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('cvterm_relationship', 'subject_id', 'select');
SELECT pg_catalog.has_column_privilege('cvterm_relationship', 'object_id', 'select');
SELECT pg_catalog.has_table_privilege('cvtermpath','select');
SELECT pg_catalog.has_column_privilege('cvtermpath', 'cvtermpath_id', 'select');
SELECT pg_catalog.has_column_privilege('cvtermpath', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('cvtermpath', 'subject_id', 'select');
SELECT pg_catalog.has_column_privilege('cvtermpath', 'object_id', 'select');
SELECT pg_catalog.has_column_privilege('cvtermpath', 'cv_id', 'select');
SELECT pg_catalog.has_column_privilege('cvtermpath', 'pathdistance', 'select');
SELECT pg_catalog.has_table_privilege('cvtermsynonym','select');
SELECT pg_catalog.has_column_privilege('cvtermsynonym', 'cvtermsynonym_id', 'select');
SELECT pg_catalog.has_column_privilege('cvtermsynonym', 'cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('cvtermsynonym', 'synonym', 'select');
SELECT pg_catalog.has_column_privilege('cvtermsynonym', 'type_id', 'select');
SELECT pg_catalog.has_table_privilege('cvterm_dbxref','select');
SELECT pg_catalog.has_column_privilege('cvterm_dbxref', 'cvterm_dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('cvterm_dbxref', 'cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('cvterm_dbxref', 'dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('cvterm_dbxref', 'is_for_definition', 'select');
SELECT pg_catalog.has_table_privilege('cvtermprop','select');
SELECT pg_catalog.has_column_privilege('cvtermprop', 'cvtermprop_id', 'select');
SELECT pg_catalog.has_column_privilege('cvtermprop', 'cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('cvtermprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('cvtermprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('cvtermprop', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('dbxrefprop','select');
SELECT pg_catalog.has_column_privilege('dbxrefprop', 'dbxrefprop_id', 'select');
SELECT pg_catalog.has_column_privilege('dbxrefprop', 'dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('dbxrefprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('dbxrefprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('dbxrefprop', 'rank', 'select');



