CREATE TABLE IF NOT EXISTS tasks (
    id bigserial PRIMARY KEY,
    owner_id uuid REFERENCES auth.users ON DELETE CASCADE NOT NULL,
    title text NOT NULL,
    description text,
    priority text,
    due_by timestamptz,
    is_completed bool DEFAULT false,
    created_at timestamptz DEFAULT NOW()
);

ALTER TABLE
    tasks enable ROW LEVEL SECURITY;

CREATE TABLE IF NOT EXISTS tags (
    id bigserial PRIMARY KEY,
    owner_id uuid REFERENCES auth.users ON DELETE CASCADE NOT NULL,
    title text NOT NULL,
    created_at timestamptz DEFAULT NOW()
);

ALTER TABLE
    tags enable ROW LEVEL SECURITY;

CREATE TABLE IF NOT EXISTS tags_to_tasks (
    id bigserial PRIMARY KEY,
    tag_id int8 REFERENCES tags ON DELETE CASCADE NOT NULL,
    task_id int8 REFERENCES tasks ON DELETE CASCADE NOT NULL
);

ALTER TABLE
    tags_to_tasks enable ROW LEVEL SECURITY;