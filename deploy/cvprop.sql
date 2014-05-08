-- Deploy cvprop
-- requires: cv

BEGIN;

 create table cvprop (
     cvprop_id serial not null,
     primary key (cvprop_id),
     cv_id int not null,
     foreign key (cv_id) references cv (cv_id) INITIALLY DEFERRED,
     type_id int not null,
     foreign key (type_id) references cvterm (cvterm_id) INITIALLY DEFERRED,
     value text,
     rank int not null default 0,
     constraint cvprop_c1 unique (cv_id,type_id,rank)
 );
 
 COMMENT ON TABLE cvprop IS 'Additional extensible properties can be attached to a cv using this table.  A notable example would be the cv version';
 
 COMMENT ON COLUMN cvprop.type_id IS 'The name of the property or slot is a cvterm. The meaning of the property is defined in that cvterm.';
 COMMENT ON COLUMN cvprop.value IS 'The value of the property, represented as text. Numeric values are converted to their text representation.';
 
 COMMENT ON COLUMN cvprop.rank IS 'Property-Value ordering. Any
 cv can have multiple values for any particular property type -
 these are ordered in a list using rank, counting from zero. For
 properties that are single-valued rather than multi-valued, the
 default 0 value should be used.';

COMMIT;
