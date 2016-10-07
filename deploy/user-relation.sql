-- Deploy dictybase:user-relation to pg
-- requires: auth
-- requires: cv

BEGIN;

create table user_relationship (
    user_relationship_id serial not null,
    type_id int not null,
    subject_id int not null,
    object_id int not null,
    is_active boolean not null default 'true',  
    primary key (user_relationship_id),
    foreign key (type_id) references cvterm (cvterm_id) on delete cascade INITIALLY DEFERRED,
    foreign key (object_id) references cvterm (cvterm_id) on delete cascade INITIALLY DEFERRED,
    foreign key (subject_id) references cvterm (cvterm_id) on delete cascade INITIALLY DEFERRED,
    constraint user_relationship_c1 unique(object_id, subject_id, type_id, is_active)
);

COMMIT;
