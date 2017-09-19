-- Deploy dictybase:stock-annotation to pg
-- requires: user-info-alteration
-- requires: stock

BEGIN;

create table stock_user_annotation (
    stock_user_annotation_id serial not null,
    stock_id int not null,
    created_user_id int not null,
    modified_user_id int not null,
    created_at timestamp with time zone default now(),
    updated_at timestamp with time zone default now(),
    primary key (stock_user_annotation_id),
    foreign key(created_user_id) references auth_user(auth_user_id) on delete cascade INITIALLY DEFERRED,
    foreign key(modified_user_id) references auth_user(auth_user_id) on delete cascade INITIALLY DEFERRED,
    foreign key(stock_id) references stock(stock_id) on delete cascade INITIALLY DEFERRED,
    constraint stock_user_annotation_c1 unique(stock_id, created_user_id, modified_user_id)
);

COMMENT ON TABLE stock_user_annotation IS 'Table to track users who annotated the stocks';

COMMENT ON COLUMN stock_user_annotation.created_user_id IS 'User who first annotated a particular stock';

COMMENT ON COLUMN stock_user_annotation.modified_user_id  IS 'User who modified an existing annotation';


COMMIT;
