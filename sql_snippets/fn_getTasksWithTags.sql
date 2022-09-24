create or replace function getTasksWithTags(input_owner_id uuid) returns table(task_id int8, title text, description text, priority text, due_by timestamptz, is_completed bool, created_at timestamptz, tag_ids int8[], tag_titles text[]) as $$
begin
  return query select tasks.id, tasks.title, tasks.description, tasks.priority, tasks.due_by, tasks.is_completed, tasks.created_at, array_agg(tags_to_tasks.tag_id), array_agg(tags.title) from tasks
  left join tags_to_tasks on tasks.id = tags_to_tasks.task_id
  left join tags on tags_to_tasks.tag_id = tags.id
  where tasks.owner_id = input_owner_id
  group by tasks.id;
end;
$$ language plpgsql;