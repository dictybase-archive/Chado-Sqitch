-- Deploy dictybase:auth to pg
-- requires: @dictychado-1.23

BEGIN;

create table auth_permission (
    auth_permission_id serial not null,
    permission varchar(255) not null
    description text,
    primary key(auth_permission_id),
    constraint auth_permission_c1 unique(permission),
    created_at timestamp with time zone default now(),
    updated_at timestamp with time zone default now()
)

COMMENT ON TABLE auth_permission IS 'Permission defines what an user can do in the system, create-user, delete-user, 
create-gene-model etc. It defined a granular level of actions for the user';

COMMENT ON COLUMN auth_permission.permission IS 'The name of the permission, the name is arbitary but unique';

COMMENT ON COLUMN auth_permission.description IS 'A human readable detail textual description of the permission';

create table auth_role (
    auth_role_id serial not null,
    role varchar(255) not null,
    description text,
    primary key(auth_role_id)
    created_at timestamp with time zone default now(),
    updated_at timestamp with time zone default now()
)

COMMENT ON TABLE auth_role IS 'An auth role is a set of activities. It defines a set of permission an user can perform';

COMMENT ON COLUMN role IS 'The name of the role, could be arbitrary';

create table auth_role_permission (
    auth_role_permission_id serial not null,
    auth_role_id int not null, 
    auth_permission_id int not null,
    primary key(auth_role_permission_id),
    foreign key (auth_role_id) references auth_role(auth_role_id) on delete cascade INITIALLY DEFERRED;
    foreign key (auth_permission_id) references auth_permission(auth_permission_id) on delete cascade INITIALLY DEFERRED;
    created_at timestamp with time zone default now(),
    updated_at timestamp with time zone default now(),
    constraint auth_role_permission_c1 unique (auth_role_id, auth_permission_id)
)

COMMENT ON TABLE auth_role_permission IS 'The linking table between auth_permission and auth_role. 
Allows to define roles with activities and the same permission spreads accross multiple roles.';

create table auth_user (
    auth_user_id serial not null,
    first_name text not null,
    last_name text not null,
    email citext not null,
    is_active boolean not null default true,
    primary key(auth_user_id),
    constraint auth_user_c1 unique (email),
    created_at timestamp with time zone default now(),
    updated_at timestamp with time zone default now()
);

COMMENT ON TABLE auth_user IS 'The primary table for the user information, it only stores email and name only.';

COMMENT ON COLUMN auth_user.email IS 'Store emails of every user, the value has to be unique.
Email is treated case-insensitive and citext provides a case-insensitive data type';

COMMENT ON COLUMN auth.is_active IS 'Column for active or inactive user';

create table auth_user_info (
    auth_user_info_id serial not null,
    organization varchar(255),
    group_name text,
    first_address text,
    second_address text,
    city varchar(255),
    state varchar(50),
    zipcode varchar(30),
    country varchar(20),
    phone varchar(30),
    auth_user_id int not null,
    primary key(auth_user_info_id),
    foreign key(auth_user_id) references auth_user(auth_user_id)  on delete cascade INITIALLY DEFERRED;
);

COMMENT ON TABLE auth_user_info IS 'A table to store optional user information.';

create table auth_user_role (
    auth_user_role_id serial not null,
    auth_user_id int not null,
    auth_role_id int not null,
    foreign key (auth_user_id) references auth_user(auth_user_id) on delete cascade INITIALLY DEFERRED;
    foreign key (auth_role_id) references auth_role(auth_role_id) on delete cascade INITIALLY DEFERRED;
);

COMMENT ON TABLE auth_user_role IS 'Linking table between user and role';

COMMIT;
