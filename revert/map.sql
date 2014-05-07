-- Revert chado module map

BEGIN;


    DROP TABLE IF EXISTS featuremap CASCADE;
DROP TABLE IF EXISTS featurerange CASCADE;
DROP TABLE IF EXISTS featurepos CASCADE;
DROP TABLE IF EXISTS featuremap_pub CASCADE;



COMMIT;
