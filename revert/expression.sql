-- Revert chado module expression

BEGIN;


    DROP TABLE IF EXISTS expression CASCADE;
DROP TABLE IF EXISTS expression_cvterm CASCADE;
DROP TABLE IF EXISTS expression_cvtermprop CASCADE;
DROP TABLE IF EXISTS expressionprop CASCADE;
DROP TABLE IF EXISTS expression_pub CASCADE;
DROP TABLE IF EXISTS feature_expression CASCADE;
DROP TABLE IF EXISTS feature_expressionprop CASCADE;
DROP TABLE IF EXISTS eimage CASCADE;
DROP TABLE IF EXISTS expression_image CASCADE;



COMMIT;
