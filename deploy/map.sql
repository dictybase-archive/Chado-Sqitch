-- Deploy chado module map

    -- requires general
    -- requires cv
    -- requires organism
    -- requires pub
    -- requires sequence


BEGIN;


    -- $Id: map.sql,v 1.14 2007-03-23 15:18:02 scottcain Exp $
-- ==========================================
-- Chado map module
--
-- =================================================================
-- Dependencies:
--
-- :import feature from sequence
-- :import cvterm from cv
-- :import pub from pub
-- =================================================================

-- ================================================
-- TABLE: featuremap
-- ================================================

create table featuremap (
    featuremap_id serial not null,
    primary key (featuremap_id),
    name varchar(255),
    description text,
    unittype_id int null,
    foreign key (unittype_id) references cvterm (cvterm_id) on delete set null INITIALLY DEFERRED,
    constraint featuremap_c1 unique (name)
);

-- ================================================
-- TABLE: featurerange
-- ================================================

create table featurerange (
    featurerange_id serial not null,
    primary key (featurerange_id),
    featuremap_id int not null,
    foreign key (featuremap_id) references featuremap (featuremap_id) on delete cascade INITIALLY DEFERRED,
    feature_id int not null,
    foreign key (feature_id) references feature (feature_id) on delete cascade INITIALLY DEFERRED,
    leftstartf_id int not null,
    foreign key (leftstartf_id) references feature (feature_id) on delete cascade INITIALLY DEFERRED,
    leftendf_id int,
    foreign key (leftendf_id) references feature (feature_id) on delete set null INITIALLY DEFERRED,
    rightstartf_id int,
    foreign key (rightstartf_id) references feature (feature_id) on delete set null INITIALLY DEFERRED,
    rightendf_id int not null,
    foreign key (rightendf_id) references feature (feature_id) on delete cascade INITIALLY DEFERRED,
    rangestr varchar(255)
);
create index featurerange_idx1 on featurerange (featuremap_id);
create index featurerange_idx2 on featurerange (feature_id);
create index featurerange_idx3 on featurerange (leftstartf_id);
create index featurerange_idx4 on featurerange (leftendf_id);
create index featurerange_idx5 on featurerange (rightstartf_id);
create index featurerange_idx6 on featurerange (rightendf_id);

COMMENT ON TABLE featurerange IS 'In cases where the start and end of a mapped feature is a range, leftendf and rightstartf are populated. leftstartf_id, leftendf_id, rightstartf_id, rightendf_id are the ids of features with respect to which the feature is being mapped. These may be cytological bands.';
COMMENT ON COLUMN featurerange.featuremap_id IS 'featuremap_id is the id of the feature being mapped.';


-- ================================================
-- TABLE: featurepos
-- ================================================

create table featurepos (
    featurepos_id serial not null,
    primary key (featurepos_id),
    featuremap_id serial not null,
    foreign key (featuremap_id) references featuremap (featuremap_id) on delete cascade INITIALLY DEFERRED,
    feature_id int not null,
    foreign key (feature_id) references feature (feature_id) on delete cascade INITIALLY DEFERRED,
    map_feature_id int not null,
    foreign key (map_feature_id) references feature (feature_id) on delete cascade INITIALLY DEFERRED,
    mappos float not null
);
create index featurepos_idx1 on featurepos (featuremap_id);
create index featurepos_idx2 on featurepos (feature_id);
create index featurepos_idx3 on featurepos (map_feature_id);

COMMENT ON COLUMN featurepos.map_feature_id IS 'map_feature_id
links to the feature (map) upon which the feature is being localized.';


-- ================================================
-- TABLE: featuremap_pub
-- ================================================

create table featuremap_pub (
    featuremap_pub_id serial not null,
    primary key (featuremap_pub_id),
    featuremap_id int not null,
    foreign key (featuremap_id) references featuremap (featuremap_id) on delete cascade INITIALLY DEFERRED,
    pub_id int not null,
    foreign key (pub_id) references pub (pub_id) on delete cascade INITIALLY DEFERRED
);
create index featuremap_pub_idx1 on featuremap_pub (featuremap_id);
create index featuremap_pub_idx2 on featuremap_pub (pub_id);



COMMIT;
