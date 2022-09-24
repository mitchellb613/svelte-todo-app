create policy "Users can insert into tags_to_tasks if they own the tag and task"
  on tags_to_tasks
  for insert with check(
    auth.uid() in (
      select owner_id from tasks
      where id = task_id
    )
    and
    auth.uid() in (
      select owner_id from tags
      where id = tag_id
    )
  );

create policy "Users can select from tags_to_tasks where they own the tag and task"
  on tags_to_tasks
  for select using(
    auth.uid() in (
      select owner_id from tasks
      where id = task_id
    )
    and
    auth.uid() in (
      select owner_id from tags
      where id = tag_id
    )
  );

  create policy "Users can select from tasks where they own the task"
    on tasks
    for select using(
      auth.uid() = owner_id
    );

  create policy "Users can insert into tasks as owner of the task"
    on tasks
    for insert with check(
      auth.uid() = owner_id
    );

  create policy "Users can select from tags where they own the tag"
    on tags
    for select using(
      auth.uid() = owner_id
    );

  create policy "Users can insert into tags as owner of the tag"
    on tags
    for insert with check(
      auth.uid() = owner_id
    );