-- Verify chado module sequence


    SELECT pg_catalog.has_table_privilege('feature','select');
SELECT pg_catalog.has_column_privilege('feature', 'feature_id', 'select');
SELECT pg_catalog.has_column_privilege('feature', 'dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('feature', 'organism_id', 'select');
SELECT pg_catalog.has_column_privilege('feature', 'name', 'select');
SELECT pg_catalog.has_column_privilege('feature', 'uniquename', 'select');
SELECT pg_catalog.has_column_privilege('feature', 'residues', 'select');
SELECT pg_catalog.has_column_privilege('feature', 'seqlen', 'select');
SELECT pg_catalog.has_column_privilege('feature', 'md5checksum', 'select');
SELECT pg_catalog.has_column_privilege('feature', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('feature', 'is_analysis', 'select');
SELECT pg_catalog.has_column_privilege('feature', 'is_obsolete', 'select');
SELECT pg_catalog.has_column_privilege('feature', 'timeaccessioned', 'select');
SELECT pg_catalog.has_column_privilege('feature', 'timelastmodified', 'select');
SELECT pg_catalog.has_table_privilege('featureloc','select');
SELECT pg_catalog.has_column_privilege('featureloc', 'featureloc_id', 'select');
SELECT pg_catalog.has_column_privilege('featureloc', 'feature_id', 'select');
SELECT pg_catalog.has_column_privilege('featureloc', 'srcfeature_id', 'select');
SELECT pg_catalog.has_column_privilege('featureloc', 'fmin', 'select');
SELECT pg_catalog.has_column_privilege('featureloc', 'is_fmin_partial', 'select');
SELECT pg_catalog.has_column_privilege('featureloc', 'fmax', 'select');
SELECT pg_catalog.has_column_privilege('featureloc', 'is_fmax_partial', 'select');
SELECT pg_catalog.has_column_privilege('featureloc', 'strand', 'select');
SELECT pg_catalog.has_column_privilege('featureloc', 'phase', 'select');
SELECT pg_catalog.has_column_privilege('featureloc', 'residue_info', 'select');
SELECT pg_catalog.has_column_privilege('featureloc', 'locgroup', 'select');
SELECT pg_catalog.has_column_privilege('featureloc', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('featureloc_pub','select');
SELECT pg_catalog.has_column_privilege('featureloc_pub', 'featureloc_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('featureloc_pub', 'featureloc_id', 'select');
SELECT pg_catalog.has_column_privilege('featureloc_pub', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('feature_pub','select');
SELECT pg_catalog.has_column_privilege('feature_pub', 'feature_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_pub', 'feature_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_pub', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('feature_pubprop','select');
SELECT pg_catalog.has_column_privilege('feature_pubprop', 'feature_pubprop_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_pubprop', 'feature_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_pubprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_pubprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('feature_pubprop', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('featureprop','select');
SELECT pg_catalog.has_column_privilege('featureprop', 'featureprop_id', 'select');
SELECT pg_catalog.has_column_privilege('featureprop', 'feature_id', 'select');
SELECT pg_catalog.has_column_privilege('featureprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('featureprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('featureprop', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('featureprop_pub','select');
SELECT pg_catalog.has_column_privilege('featureprop_pub', 'featureprop_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('featureprop_pub', 'featureprop_id', 'select');
SELECT pg_catalog.has_column_privilege('featureprop_pub', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('feature_dbxref','select');
SELECT pg_catalog.has_column_privilege('feature_dbxref', 'feature_dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_dbxref', 'feature_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_dbxref', 'dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_dbxref', 'is_current', 'select');
SELECT pg_catalog.has_table_privilege('feature_relationship','select');
SELECT pg_catalog.has_column_privilege('feature_relationship', 'feature_relationship_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_relationship', 'subject_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_relationship', 'object_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_relationship', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_relationship', 'value', 'select');
SELECT pg_catalog.has_column_privilege('feature_relationship', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('feature_relationship_pub','select');
SELECT pg_catalog.has_column_privilege('feature_relationship_pub', 'feature_relationship_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_relationship_pub', 'feature_relationship_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_relationship_pub', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('feature_relationshipprop','select');
SELECT pg_catalog.has_column_privilege('feature_relationshipprop', 'feature_relationshipprop_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_relationshipprop', 'feature_relationship_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_relationshipprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_relationshipprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('feature_relationshipprop', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('feature_relationshipprop_pub','select');
SELECT pg_catalog.has_column_privilege('feature_relationshipprop_pub', 'feature_relationshipprop_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_relationshipprop_pub', 'feature_relationshipprop_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_relationshipprop_pub', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('feature_cvterm','select');
SELECT pg_catalog.has_column_privilege('feature_cvterm', 'feature_cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_cvterm', 'feature_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_cvterm', 'cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_cvterm', 'pub_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_cvterm', 'is_not', 'select');
SELECT pg_catalog.has_column_privilege('feature_cvterm', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('feature_cvtermprop','select');
SELECT pg_catalog.has_column_privilege('feature_cvtermprop', 'feature_cvtermprop_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_cvtermprop', 'feature_cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_cvtermprop', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_cvtermprop', 'value', 'select');
SELECT pg_catalog.has_column_privilege('feature_cvtermprop', 'rank', 'select');
SELECT pg_catalog.has_table_privilege('feature_cvterm_dbxref','select');
SELECT pg_catalog.has_column_privilege('feature_cvterm_dbxref', 'feature_cvterm_dbxref_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_cvterm_dbxref', 'feature_cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_cvterm_dbxref', 'dbxref_id', 'select');
SELECT pg_catalog.has_table_privilege('feature_cvterm_pub','select');
SELECT pg_catalog.has_column_privilege('feature_cvterm_pub', 'feature_cvterm_pub_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_cvterm_pub', 'feature_cvterm_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_cvterm_pub', 'pub_id', 'select');
SELECT pg_catalog.has_table_privilege('synonym','select');
SELECT pg_catalog.has_column_privilege('synonym', 'synonym_id', 'select');
SELECT pg_catalog.has_column_privilege('synonym', 'name', 'select');
SELECT pg_catalog.has_column_privilege('synonym', 'type_id', 'select');
SELECT pg_catalog.has_column_privilege('synonym', 'synonym_sgml', 'select');
SELECT pg_catalog.has_table_privilege('feature_synonym','select');
SELECT pg_catalog.has_column_privilege('feature_synonym', 'feature_synonym_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_synonym', 'synonym_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_synonym', 'feature_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_synonym', 'pub_id', 'select');
SELECT pg_catalog.has_column_privilege('feature_synonym', 'is_current', 'select');
SELECT pg_catalog.has_column_privilege('feature_synonym', 'is_internal', 'select');



