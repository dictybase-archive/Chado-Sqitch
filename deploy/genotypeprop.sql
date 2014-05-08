-- Deploy genotypeprop
-- requires: genetic

BEGIN;

 create table genotypeprop (
     genotypeprop_id serial not null,
     primary key (genotypeprop_id),
     genotype_id int not null,
     foreign key (genotype_id) references genotype (genotype_id) on delete cascade INITIALLY DEFERRED,
     type_id int not null,
     foreign key (type_id) references cvterm (cvterm_id) on delete cascade INITIALLY DEFERRED,
     value text null,
     rank int not null default 0,
     constraint genotypeprop_c1 unique (genotype_id,type_id,rank)
 );
 create index genotypeprop_idx1 on genotypeprop (genotype_id);
 create index genotypeprop_idx2 on genotypeprop (type_id);

COMMIT;
