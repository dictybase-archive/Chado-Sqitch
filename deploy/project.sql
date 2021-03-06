-- Deploy chado module project

    -- requires general
    -- requires cv
    -- requires pub
    -- requires contact


BEGIN;


    -- ==========================================
-- Chado project module. Used primarily by other Chado modules to
-- group experiments, stocks, and so forth that are associated with
-- eachother administratively or organizationally.
--
-- =================================================================
-- Dependencies:
--
-- :import cvterm from cv
-- :import pub from pub
-- :import contact from contact
-- =================================================================


-- ================================================
-- TABLE: project
-- ================================================

-- The project table is moved from general, so the table exists, its just under grouped under different name.

-- create table project (
    -- project_id serial not null,
    -- primary key (project_id),
    -- name varchar(255) not null,
    -- description varchar(255) not null,
    -- constraint project_c1 unique (name)
-- );

-- COMMENT ON TABLE project IS
-- 'A project is some kind of planned endeavor.  Used primarily by other
-- Chado modules to group experiments, stocks, and so forth that are
-- associated with eachother administratively or organizationally.';

-- ================================================
-- TABLE: projectprop
-- ================================================

CREATE TABLE projectprop (
	projectprop_id serial NOT NULL,
	PRIMARY KEY (projectprop_id),
	project_id integer NOT NULL,
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	type_id integer NOT NULL,
	FOREIGN KEY (type_id) REFERENCES cvterm (cvterm_id) ON DELETE CASCADE,
	value text,
	rank integer not null default 0,
	CONSTRAINT projectprop_c1 UNIQUE (project_id, type_id, rank)
);
COMMENT ON TABLE project IS
'Standard Chado flexible property table for projects.';

-- ================================================
-- TABLE: project_relationship
-- ================================================

CREATE TABLE project_relationship (
	project_relationship_id serial NOT NULL,
	PRIMARY KEY (project_relationship_id),
	subject_project_id integer NOT NULL,
	FOREIGN KEY (subject_project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	object_project_id integer NOT NULL,
	FOREIGN KEY (object_project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	type_id integer NOT NULL,
	FOREIGN KEY (type_id) REFERENCES cvterm (cvterm_id) ON DELETE RESTRICT,
	CONSTRAINT project_relationship_c1 UNIQUE (subject_project_id, object_project_id, type_id)
);

COMMENT ON TABLE project_relationship IS
'Linking table for relating projects to each other.  For example, a
given project could be composed of several smaller subprojects';

COMMENT ON COLUMN project_relationship.type_id IS
'The cvterm type of the relationship being stated, such as "part of".';

create table project_pub (
       project_pub_id serial not null,
       primary key (project_pub_id),
       project_id int not null,
       foreign key (project_id) references project (project_id) on delete cascade INITIALLY DEFERRED,
       pub_id int not null,
       foreign key (pub_id) references pub (pub_id) on delete cascade INITIALLY DEFERRED,
       constraint project_pub_c1 unique (project_id,pub_id)
);
create index project_pub_idx1 on project_pub (project_id);
create index project_pub_idx2 on project_pub (pub_id);

COMMENT ON TABLE project_pub IS 'Linking table for associating projects and publications.';


create table project_contact (
       project_contact_id serial not null,
       primary key (project_contact_id),
       project_id int not null,
       foreign key (project_id) references project (project_id) on delete cascade INITIALLY DEFERRED,
       contact_id int not null,
       foreign key (contact_id) references contact (contact_id) on delete cascade INITIALLY DEFERRED,
       constraint project_contact_c1 unique (project_id,contact_id)
);
create index project_contact_idx1 on project_contact (project_id);
create index project_contact_idx2 on project_contact (contact_id);

COMMENT ON TABLE project_contact IS 'Linking table for associating projects and contacts.';



COMMIT;
