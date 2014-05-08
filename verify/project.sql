-- Verify chado module project


    BEGIN;
SELECT pg_catalog.has_table_privilege('projectprop','select');
SELECT pg_catalog.has_column_privilege('projectprop', 'projectprop_id', 'select');
SELECT pg_catalog.has_column_privilege('projectprop', 'project_id', 'select');
SELECT pg_catalog.has_column_privilege('projectprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('projectprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('projectprop', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('project_relationship','select');
SELECT pg_catalog.has_column_privilege('project_relationship', 'project_relationship_id', 'select');
SELECT pg_catalog.has_column_privilege('project_relationship', 'subject_project_id', 'select');
SELECT pg_catalog.has_column_privilege('project_relationship', 'object_project_id', 'select');
SELECT pg_catalog.has_column_privilege('project_relationship', 'type_id', 'select');
SELECT pg_catalog.has_table_privilege('project_pub','select');
SELECT pg_catalog.has_column_privilege('project_pub', 'project_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('project_pub', 'project_id', 'select');
SELECT pg_catalog.has_column_privilege('project_pub', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('project_contact','select');
SELECT pg_catalog.has_column_privilege('project_contact', 'project_contact_id', 'select');
SELECT pg_catalog.has_column_privilege('project_contact', 'project_id', 'select');
SELECT pg_catalog.has_column_privilege('project_contact', 'contact_id', 'select');

    ROLLBACK;


