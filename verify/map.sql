-- Verify chado module map


    SELECT pg_catalog.has_table_privilege('featuremap','select');
SELECT pg_catalog.has_column_privilege('featuremap', 'featuremap_id', 'select');
SELECT pg_catalog.has_column_privilege('featuremap', 'name', 'select');
SELECT pg_catalog.has_column_privilege('featuremap', 'description', 'select');
SELECT pg_catalog.has_column_privilege('featuremap', 'unittype_id', 'select');
SELECT pg_catalog.has_table_privilege('featurerange','select');
SELECT pg_catalog.has_column_privilege('featurerange', 'featurerange_id', 'select');
SELECT pg_catalog.has_column_privilege('featurerange', 'featuremap_id', 'select');
SELECT pg_catalog.has_column_privilege('featurerange', 'feature_id', 'select');
SELECT pg_catalog.has_column_privilege('featurerange', 'leftstartf_id', 'select');
SELECT pg_catalog.has_column_privilege('featurerange', 'leftendf_id', 'select');
SELECT pg_catalog.has_column_privilege('featurerange', 'rightstartf_id', 'select');
SELECT pg_catalog.has_column_privilege('featurerange', 'rightendf_id', 'select');
SELECT pg_catalog.has_column_privilege('featurerange', 'rangestr', 'select');
SELECT pg_catalog.has_table_privilege('featurepos','select');
SELECT pg_catalog.has_column_privilege('featurepos', 'featurepos_id', 'select');
SELECT pg_catalog.has_column_privilege('featurepos', 'featuremap_id', 'select');
SELECT pg_catalog.has_column_privilege('featurepos', 'feature_id', 'select');
SELECT pg_catalog.has_column_privilege('featurepos', 'map_feature_id', 'select');
SELECT pg_catalog.has_column_privilege('featurepos', 'mappos', 'select');
SELECT pg_catalog.has_table_privilege('featuremap_pub','select');
SELECT pg_catalog.has_column_privilege('featuremap_pub', 'featuremap_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('featuremap_pub', 'featuremap_id', 'select');
SELECT pg_catalog.has_column_privilege('featuremap_pub', 'pub_id', 'select');



