-- Deploy dictybase:auth-provider to pg
-- requires: @dictychado-1.23.3

BEGIN;

create table auth_provider (
    auth_provider_id serial not null,
    name text not null,
    primary key(auth_provider_id)
);

COMMENT ON TABLE auth_provider IS 'The table to keep track of third party(like google, facebook etc.) authorization provider';

COMMENT ON COLUMN auth_provider.name IS 'Canonical name of the provider';

COMMIT;

create table auth_user_provider (
    auth_user_provider_id serial not null,
    name text not null,
    email citext not null,
    auth_provider_id int not null,
    primary key(auth_user_provider_id),
    foreign key (auth_provider_id) references auth_provider(auth_provider_id) on delete cascade INITIALLY DEFERRED,
    created_at timestamp with time zone default now(),
    updated_at timestamp with time zone default now()
);

COMMENT ON TABLE auth_user_provider IS 'The table to link user and authentication provider. 
It allows an individual user to authenticate with multiple providers';

COMMENT ON COLUMN auth_user_provider.email IS 'Email of the user that is provided to the third party provider';

COMMENT ON COLUMN auth_user_provider.name IS 'Name of the user that is provided to the third party provider.';
