INSERT INTO reimbursement_category (id, category_name, active_from_ts, active_to_ts) VALUES (
    1,
    'Transport',
    datetime('2024-01-24'),
    NULL
), (
    2,
    'Kontorartikler',
    datetime('2024-05-24'),
    NULL
), (
    3,
    'Software',
    datetime('2024-05-24'),
    NULL
), (
    4,
    'Repraesentation før 2025',
    datetime('2024-02-24'),
    datetime('2025-12-31')
), (
    5,
    'Repraesentation f.o.m. 2025',
    datetime('2026-01-01'),
    NULL
);


INSERT INTO reimbursement_status (id, status_name) VALUES (
    1,
    'Klade'
), (
    2,
    'Afventer godkendelse'
), (
    3,
    -- The reimbursement request was approved, but the employee has not received the money.
    'Godkendt'
), (
    4,
    'Afvist'
), (
    5,
    'Udbetalt'
);


INSERT INTO project (id, name) VALUES (
    1,
    'Jørgens IT bridge'
), (
    2,
    'Vibecodersaurus'
), (
    3,
    'Billy-phone - budget telefoner'
);

INSERT INTO employee (id, name, anonymised_ts) VALUES (
    1,
    'Tidligere ansat 1',
    datetime('2024-03-01')
), (
    2,
    'Tidligere ansat 2',
    datetime('2025-07-01')
), (
    3,
    'Alice A.',
    NULL
), (
    4,
    'Bobby B.',
    NULL
), (
    5,
    'Tommy T.',
    NULL
);

INSERT INTO reimbursement (
    id,
    submitted_by_id,
    project_id,
    category_id,
    purchase_ts,
    amount,
    status_id,
    deleted_ts,
    note
) VALUES (
    1,
    (SELECT id FROM employee WHERE name = 'Tidligere ansat 1'),
    (SELECT id FROM project  WHERE name = 'Jørgens IT bridge'),
    (SELECT id FROM reimbursement_category WHERE category_name = 'Transport'),
    datetime('2024-01-05 08:30'),
    47.0,
    (SELECT id FROM reimbursement_status WHERE status_name = 'Udbetalt'),
    NULL,
    'Kaffe på farten til morgenmøde'
), (
    2,
    (SELECT id FROM employee WHERE name = 'Tidligere ansat 1'),
    (SELECT id FROM project  WHERE name = 'Jørgens IT bridge'),
    (SELECT id FROM reimbursement_category WHERE category_name = 'Transport'),
    datetime('2024-01-07 11:15'),
    512.0,
    (SELECT id FROM reimbursement_status WHERE status_name = 'Afvist'),
    NULL,
    'Tankning.'
), (
    3,
    (SELECT id FROM employee WHERE name = 'Tidligere ansat 1'),
    (SELECT id FROM project  WHERE name = 'Vibecodersaurus'),
    (SELECT id FROM reimbursement_category WHERE category_name = 'Software'),
    datetime('2024-01-09 10:45'),
    50.0,
    (SELECT id FROM reimbursement_status WHERE status_name = 'Udbetalt'),
    NULL,
    'SnagIt.'
), (
    4,
    (SELECT id FROM employee WHERE name = 'Tidligere ansat 1'),
    (SELECT id FROM project  WHERE name = 'Vibecodersaurus'),
    (SELECT id FROM reimbursement_category WHERE category_name = 'Software'),
    datetime('2024-01-15 10:45'),
    50.0,
    (SELECT id FROM reimbursement_status WHERE status_name = 'Udbetalt'),
    datetime('2024-02-05 15:00'),
    'SnagIt.'
), (
    5,
    (SELECT id FROM employee WHERE name = 'Tidligere ansat 2'),
    (SELECT id FROM project  WHERE name = 'Vibecodersaurus'),
    (SELECT id FROM reimbursement_category WHERE category_name = 'Transport'),
    datetime('2024-02-22 15:12'),
    -250.0,
    (SELECT id FROM reimbursement_status WHERE status_name = 'Godkendt'),
    NULL,
    'P-bøde'
), (
    6,
    (SELECT id FROM employee WHERE name = 'Alice A.'),
    (SELECT id FROM project  WHERE name = 'Billy-phone - budget telefoner'),
    (SELECT id FROM reimbursement_category WHERE category_name = 'Kontorartikler'),
    datetime('2024-02-22 15:12'),
    50.0,
    (SELECT id FROM reimbursement_status WHERE status_name = 'Udbetalt'),
    NULL,
    'Frimærker'
), (
    7,
    (SELECT id FROM employee WHERE name = 'Alice A.'),
    (SELECT id FROM project  WHERE name = 'Billy-phone - budget telefoner'),
    NULL,
    datetime('2024-02-29 11:12'),
    75.0,
    (SELECT id FROM reimbursement_status WHERE status_name = 'Klade'),
    NULL,
    'Skriveblokke (linjeret og ternet)'
), (
    8,
    (SELECT id FROM employee WHERE name = 'Alice A.'),
    (SELECT id FROM project  WHERE name = 'Billy-phone - budget telefoner'),
    (SELECT id FROM reimbursement_category WHERE category_name = 'Kontorartkiler'),
    datetime('2024-03-01 11:12'),
    125.0,
    (SELECT id FROM reimbursement_status WHERE status_name = 'Udbetalt'),
    NULL,
    'Skriveblokke (linjeret og ternet) plus post-its'
),  (
    9,
    (SELECT id FROM employee WHERE name = 'Alice A.'),
    (SELECT id FROM project  WHERE name = 'Billy-phone - budget telefoner'),
    (SELECT id FROM reimbursement_category WHERE category_name = 'Kontorartikler'),
    datetime('2024-04-05 11:12'),
    55.0,
    (SELECT id FROM reimbursement_status WHERE status_name = 'Godkendt'),
    NULL,
    'Kuglepenne og post-its'
), (
    10,
    (SELECT id FROM employee WHERE name = 'Tommy T.'),
    (SELECT id FROM project  WHERE name = 'Billy-phone - budget telefoner'),
    (SELECT id FROM reimbursement_category WHERE category_name = 'Repraesentation før 2025'),
    datetime('2024-12-11 18:33'),
    53123.0,
    (SELECT id FROM reimbursement_status WHERE status_name = 'Godkendt'),
    NULL,
    'Team Julefrokost'
), (
    11,
    (SELECT id FROM employee WHERE name = 'Tommy T.'),
    (SELECT id FROM project  WHERE name = 'Billy-phone - budget telefoner'),
    (SELECT id FROM reimbursement_category WHERE category_name = 'Repraesentation før 2025'),
    datetime('2025-01-15 18:33'),
    12732.0,
    (SELECT id FROM reimbursement_status WHERE status_name = 'Udbetalt'),
    NULL,
    'Team building - Bowling'
), (
    12,
    (SELECT id FROM employee WHERE name = 'Tommy T.'),
    (SELECT id FROM project  WHERE name = 'Billy-phone - budget telefoner'),
    (SELECT id FROM reimbursement_category WHERE category_name = 'Repraesentation før 2025'),
    datetime('2025-02-14 21:33'),
    8717.0,
    (SELECT id FROM reimbursement_status WHERE status_name = 'Udbetalt'),
    NULL,
    'Fredagsbar'
), (
    13,
    (SELECT id FROM employee WHERE name = 'Tommy T.'),
    (SELECT id FROM project  WHERE name = 'Billy-phone - budget telefoner'),
    (SELECT id FROM reimbursement_category WHERE category_name = 'Repraesentation f.o.m. 2025'),
    datetime('2025-02-14 21:33'),
    5317.0,
    (SELECT id FROM reimbursement_status WHERE status_name = 'Afvist'),
    NULL,
    'Fredagsbar'
), (
    14,
    (SELECT id FROM employee WHERE name = 'Tommy T.'),
    (SELECT id FROM project  WHERE name = 'Billy-phone - budget telefoner'),
    (SELECT id FROM reimbursement_category WHERE category_name = 'Repraesentation f.o.m. 2025'),
    datetime('2025-02-14 22:45'),
    5317.0,
    (SELECT id FROM reimbursement_status WHERE status_name = 'Afventer godkendelse'),
    NULL,
    'Fredagsbar'
), (
    15,
    (SELECT id FROM employee WHERE name = 'Alice A.'),
    (SELECT id FROM project  WHERE name = 'Jørgens IT bridge'),
    (SELECT id FROM reimbursement_category WHERE category_name = 'Transport'),
    datetime('2025-03-25 22:45'),
    75.0,
    (SELECT id FROM reimbursement_status WHERE status_name = 'Afventer godkendelse'),
    NULL,
    'Offentlig transport til kunden. Aftalt med Chefen'
);
