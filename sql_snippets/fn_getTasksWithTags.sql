CREATE OR REPLACE FUNCTION getTasksWithTags (input_owner_id uuid)
    RETURNS TABLE (
        task_id int8,
        title text,
        description text,
        priority text,
        due_by timestamptz,
        is_completed bool,
        created_at timestamptz,
        tag_ids int8[],
        tag_titles text[]
    )
    AS $$
BEGIN
    RETURN query
    SELECT
        tasks.id,
        tasks.title,
        tasks.description,
        tasks.priority,
        tasks.due_by,
        tasks.is_completed,
        tasks.created_at,
        array_agg(tags_to_tasks.tag_id),
        array_agg(tags.title)
    FROM
        tasks
    LEFT JOIN tags_to_tasks ON tasks.id = tags_to_tasks.task_id
    LEFT JOIN tags ON tags_to_tasks.tag_id = tags.id
WHERE
    tasks.owner_id = input_owner_id
GROUP BY
    tasks.id;
END;
$$
LANGUAGE plpgsql;

