CREATE OR REPLACE FUNCTION add_task_with_tags (input_owner_id uuid, input_title text, input_description text DEFAULT NULL, input_priority text DEFAULT NULL, input_due_by timestamp DEFAULT NULL, input_tag_ids int[] DEFAULT NULL)
    RETURNS SETOF tasks
    AS $$
DECLARE
    new_task_id int;
    input_tag_id int;
BEGIN
    INSERT INTO tasks (owner_id, title, description, priority, due_by)
        VALUES (input_owner_id, input_title, input_description, input_priority, input_due_by)
    RETURNING
        id INTO new_task_id;
    IF input_tag_ids IS NOT NULL THEN
        foreach input_tag_id IN ARRAY input_tag_ids LOOP
            INSERT INTO tags_to_tasks (task_id, tag_id)
                VALUES (new_task_id, input_tag_id);
        END LOOP;
    END IF;
    RETURN query
    SELECT
        *
    FROM
        tasks
    WHERE
        tasks.id = new_task_id;
END;
$$
LANGUAGE plpgsql;

