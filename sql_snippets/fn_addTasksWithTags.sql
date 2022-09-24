create or replace function addTaskWithTags(input_owner_id uuid, input_title text, input_description text default null, input_priority text default null, input_due_by timestamp default null, input_tag_ids int[] default null) returns setof tasks as $$
  declare
    new_task_id int;
    input_tag_id int;
  begin
    insert into tasks(owner_id, title, description, priority, due_by)
    values(input_owner_id, input_title, input_description, input_priority, input_due_by)
    returning id into new_task_id;

    if input_tag_ids is not null then
      foreach input_tag_id in array input_tag_ids
      loop
        insert into tags_to_tasks(task_id, tag_id)
        values(new_task_id, input_tag_id);
      end loop;
    end if;

    return query select * from tasks
    where tasks.id = new_task_id;
  end;
$$ language plpgsql;