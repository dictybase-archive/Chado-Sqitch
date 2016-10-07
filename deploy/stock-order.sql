-- Deploy dictybase:stock-order to pg
-- requires: user-relation
-- requires: stock

BEGIN;

create table stock_order (
    stock_order_id serial not null,
    user_id int not null,
    created_at timestamp with time zone default now(),
    updated_at timestamp with time zone default now(),
    primary key(stock_order_id),
    foreign key(user_id) references auth_user(auth_user_id) on delete cascade INITIALLY DEFERRED
);

COMMENT ON TABLE stock_order IS 'Table to store dicty stock center order';

COMMENT ON COLUMN stock_order.user_id IS 'The user who created the order, links with auth_user table';


create table stock_item_order (
    stock_item_order_id serial not null,
    item_id int not null,
    order_id int not null,
    quantity int not null default 1,
    primary key(stock_item_order_id),
    foreign key(item_id) references stock(stock_id) on delete cascade INITIALLY DEFERRED,
    foreign key(order_id) references stock_order(stock_order_id) on delete cascade INITIALLY DEFERRED,
    constraint stock_item_order_c1 unique(item_id, order_id)
);

COMMENT ON TABLE stock_item_order IS 'Table to track items(stocks) that are ordered';

COMMENT ON COLUMN stock_item_order.item_id IS 'The item in order, linked to stock table';

COMMENT ON COLUMN stock_item_order.order_id IS 'The order in which the item belongs to';

COMMENT ON COLUMN stock_item_order.quantity IS 'The no of items that are ordered';

COMMIT;
