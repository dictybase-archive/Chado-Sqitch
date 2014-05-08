-- Deploy chadoprop
-- requires: cv

BEGIN;


 create table chadoprop (
     chadoprop_id serial not null,
     primary key (chadoprop_id),
     type_id int not null,
     foreign key (type_id) references cvterm (cvterm_id) INITIALLY DEFERRED,
     value text,
     rank int not null default 0,
     constraint chadoprop_c1 unique (type_id,rank)
 );
 
 COMMENT ON TABLE chadoprop IS 'This table is different from other prop tables in the database, as it is for storing information about the database itself, like schema version';
 
 COMMENT ON COLUMN chadoprop.type_id IS 'The name of the property or slot is a cvterm. The meaning of the property is defined in that cvterm.';
 COMMENT ON COLUMN chadoprop.value IS 'The value of the property, represented as text. Numeric values are converted to their text representation.';
 
 COMMENT ON COLUMN chadoprop.rank IS 'Property-Value ordering. Any
 cv can have multiple values for any particular property type -
 these are ordered in a list using rank, counting from zero. For
 properties that are single-valued rather than multi-valued, the
 default 0 value should be used.';

COMMIT;
