CREATE policy "Users can insert into tags_to_tasks if they own the tag and task" ON tags_to_tasks FOR
INSERT
    WITH CHECK(
        auth.uid() IN (
            SELECT
                owner_id
            FROM
                tasks
            WHERE
                id = task_id
        )
        AND auth.uid() IN (
            SELECT
                owner_id
            FROM
                tags
            WHERE
                id = tag_id
        )
    );

CREATE policy "Users can select from tags_to_tasks where they own the tag and task" ON tags_to_tasks FOR
SELECT
    USING(
        auth.uid() IN (
            SELECT
                owner_id
            FROM
                tasks
            WHERE
                id = task_id
        )
        AND auth.uid() IN (
            SELECT
                owner_id
            FROM
                tags
            WHERE
                id = tag_id
        )
    );

CREATE policy "Users can select from tasks where they own the task" ON tasks FOR
SELECT
    USING(auth.uid() = owner_id);

CREATE policy "Users can insert into tasks as owner of the task" ON tasks FOR
INSERT
    WITH CHECK(auth.uid() = owner_id);

CREATE policy "Users can select from tags where they own the tag" ON tags FOR
SELECT
    USING(auth.uid() = owner_id);

CREATE policy "Users can insert into tags as owner of the tag" ON tags FOR
INSERT
    WITH CHECK(auth.uid() = owner_id);