-- Verify chado module expression


    SELECT pg_catalog.has_table_privilege('expression','select');
SELECT pg_catalog.has_column_privilege('expression', 'expression_id', 'select');
SELECT pg_catalog.has_column_privilege('expression', 'uniquename', 'select');
SELECT pg_catalog.has_column_privilege('expression', 'md5checksum', 'select');
SELECT pg_catalog.has_column_privilege('expression', 'description', 'select');
SELECT pg_catalog.has_table_privilege('expression_cvterm','select');
SELECT pg_catalog.has_column_privilege('expression_cvterm', 'expression_cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('expression_cvterm', 'expression_id', 'select');
SELECT pg_catalog.has_column_privilege('expression_cvterm', 'cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('expression_cvterm', 'rank', 'select');
SELECT pg_catalog.has_column_privilege('expression_cvterm', 'cvterm_type_id', 'select');
SELECT pg_catalog.has_table_privilege('expression_cvtermprop','select');
SELECT pg_catalog.has_column_privilege('expression_cvtermprop', 'expression_cvtermprop_id', 'select');
SELECT pg_catalog.has_column_privilege('expression_cvtermprop', 'expression_cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('expression_cvtermprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('expression_cvtermprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('expression_cvtermprop', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('expressionprop','select');
SELECT pg_catalog.has_column_privilege('expressionprop', 'expressionprop_id', 'select');
SELECT pg_catalog.has_column_privilege('expressionprop', 'expression_id', 'select');
SELECT pg_catalog.has_column_privilege('expressionprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('expressionprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('expressionprop', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('expression_pub','select');
SELECT pg_catalog.has_column_privilege('expression_pub', 'expression_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('expression_pub', 'expression_id', 'select');
SELECT pg_catalog.has_column_privilege('expression_pub', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('feature_expression','select');
SELECT pg_catalog.has_column_privilege('feature_expression', 'feature_expression_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_expression', 'expression_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_expression', 'feature_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_expression', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('feature_expressionprop','select');
SELECT pg_catalog.has_column_privilege('feature_expressionprop', 'feature_expressionprop_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_expressionprop', 'feature_expression_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_expressionprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_expressionprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('feature_expressionprop', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('eimage','select');
SELECT pg_catalog.has_column_privilege('eimage', 'eimage_id', 'select');
SELECT pg_catalog.has_column_privilege('eimage', 'eimage_data', 'select');
SELECT pg_catalog.has_column_privilege('eimage', 'eimage_type', 'select');
SELECT pg_catalog.has_column_privilege('eimage', 'image_uri', 'select');
SELECT pg_catalog.has_table_privilege('expression_image','select');
SELECT pg_catalog.has_column_privilege('expression_image', 'expression_image_id', 'select');
SELECT pg_catalog.has_column_privilege('expression_image', 'expression_id', 'select');
SELECT pg_catalog.has_column_privilege('expression_image', 'eimage_id', 'select');



