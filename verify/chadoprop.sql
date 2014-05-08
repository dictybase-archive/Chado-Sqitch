-- Verify chadoprop

BEGIN;

SELECT pg_catalog.has_table_privilege('chadoprop','select');
SELECT pg_catalog.has_column_privilege('chadoprop', 'chadoprop_id', 'select');
SELECT pg_catalog.has_column_privilege('chadoprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('chadoprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('chadoprop', 'rank', 'select');

ROLLBACK;
