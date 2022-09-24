create table if not exists tasks (
  id bigserial primary key,
  owner_id uuid references auth.users on delete cascade not null,
  title text not null,
  description text,
  priority text,
  due_by timestamptz,
  is_completed bool default false,
  created_at timestamptz default now()
);
alter table tasks enable row level security;

create table if not exists tags (
  id bigserial primary key,
  owner_id uuid references auth.users on delete cascade not null,
  title text not null,
  created_at timestamptz default now()
);
alter table tags enable row level security;

create table if not exists tags_to_tasks (
  id bigserial primary key,
  tag_id int8 references tags on delete cascade not null,
  task_id int8 references tasks on delete cascade not null
);
alter table tags_to_tasks enable row level security;