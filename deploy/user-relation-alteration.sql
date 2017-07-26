-- Deploy dictybase:user-relation-alteration to pg
-- requires: user-relation

BEGIN;
    ALTER TABLE user_relationship
        DROP CONSTRAINT user_relationship_object_id_fkey,
        DROP CONSTRAINT user_relationship_subject_id_fkey,
        ADD CONSTRAINT user_relationship_object_id_fkey
            FOREIGN KEY(object_id) REFERENCES auth_user(auth_user_id)
            ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED,
        ADD CONSTRAINT user_relationship_subject_id_fkey
            FOREIGN KEY(subject_id) REFERENCES auth_user(auth_user_id)
            ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED;
COMMIT;
