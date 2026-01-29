CREATE TABLE employee (
    id integer PRIMARY KEY,
    name text NOT NULL,
    anonymised_ts text             -- timestamp
);

CREATE TABLE project (
    id integer PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE reimbursement_category (
    id integer PRIMARY KEY,
    category_name TEXT NOT NULL,
    active_from_ts TEXT,         -- timestamp
    active_to_ts TEXT            -- timestamp
);

CREATE TABLE reimbursement_status (
    id integer PRIMARY KEY,
    status_name text NOT NULL
);

CREATE TABLE reimbursement (
    id integer PRIMARY KEY,
    submitted_by_id integer NOT NULL,
    project_id integer NOT NULL,
    category_id integer,
    purchase_ts text NOT NULL,   -- timestamp
    amount real NOT NULL,        -- Always DKK
    status_id integer,
    deleted_ts text,             -- timestamp
    note text NOT NULL
);

