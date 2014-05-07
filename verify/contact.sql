-- Verify chado module contact


    SELECT pg_catalog.has_table_privilege('contact','select');
SELECT pg_catalog.has_column_privilege('contact', 'contact_id', 'select');
SELECT pg_catalog.has_column_privilege('contact', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('contact', 'name', 'select');
SELECT pg_catalog.has_column_privilege('contact', 'description', 'select');
SELECT pg_catalog.has_table_privilege('contact_relationship','select');
SELECT pg_catalog.has_column_privilege('contact_relationship', 'contact_relationship_id', 'select');
SELECT pg_catalog.has_column_privilege('contact_relationship', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('contact_relationship', 'subject_id', 'select');
SELECT pg_catalog.has_column_privilege('contact_relationship', 'object_id', 'select');



