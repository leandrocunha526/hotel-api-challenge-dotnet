-- 1. Limpar dados (exclui tudo)
DELETE FROM Reservations;
DELETE FROM Persons;
DELETE FROM Suites;
-- Resetar auto incremento no SQLite
DELETE FROM sqlite_sequence
WHERE name = 'Reservations';
DELETE FROM sqlite_sequence
WHERE name = 'Persons';
DELETE FROM sqlite_sequence
WHERE name = 'Suites';
-- 2. Inserir 50 Suites com CreatedAt e UpdatedAt usando CURRENT_TIMESTAMP
INSERT INTO Suites (
        Type,
        Capacidade,
        PriceByDay,
        CreatedAt,
        UpdatedAt
    )
VALUES (
        'Standard',
        2,
        150.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Deluxe',
        4,
        300.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Master',
        6,
        500.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Single',
        1,
        100.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Family',
        5,
        400.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Standard',
        2,
        160.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Deluxe',
        4,
        310.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Master',
        6,
        520.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Single',
        1,
        110.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Family',
        5,
        410.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Standard',
        2,
        155.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Deluxe',
        4,
        305.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Master',
        6,
        510.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Single',
        1,
        105.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Family',
        5,
        405.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Standard',
        2,
        165.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Deluxe',
        4,
        315.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Master',
        6,
        530.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Single',
        1,
        115.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Family',
        5,
        415.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Standard',
        2,
        170.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Deluxe',
        4,
        320.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Master',
        6,
        540.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Single',
        1,
        120.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Family',
        5,
        420.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Standard',
        2,
        175.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Deluxe',
        4,
        325.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Master',
        6,
        550.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Single',
        1,
        125.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Family',
        5,
        430.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Standard',
        2,
        180.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Deluxe',
        4,
        330.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Master',
        6,
        560.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Single',
        1,
        130.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Family',
        5,
        440.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Standard',
        2,
        185.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Deluxe',
        4,
        335.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Master',
        6,
        570.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Single',
        1,
        135.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Family',
        5,
        450.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Standard',
        2,
        190.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Deluxe',
        4,
        340.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Master',
        6,
        580.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Single',
        1,
        140.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Family',
        5,
        460.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Standard',
        2,
        195.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Deluxe',
        4,
        345.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Master',
        6,
        590.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Single',
        1,
        145.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Family',
        5,
        470.00,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );
-- 3. Inserir 50 Pessoas (com datas e telefones simples)
INSERT INTO Persons (
        FullName,
        Email,
        BirthDate,
        Phone,
        CreatedAt,
        UpdatedAt
    )
VALUES (
        'Pessoa 1',
        'pessoa1@email.com',
        '1990-01-01',
        '11990000001',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 2',
        'pessoa2@email.com',
        '1991-02-02',
        '11990000002',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 3',
        'pessoa3@email.com',
        '1992-03-03',
        '11990000003',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 4',
        'pessoa4@email.com',
        '1993-04-04',
        '11990000004',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 5',
        'pessoa5@email.com',
        '1994-05-05',
        '11990000005',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 6',
        'pessoa6@email.com',
        '1995-06-06',
        '11990000006',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 7',
        'pessoa7@email.com',
        '1996-07-07',
        '11990000007',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 8',
        'pessoa8@email.com',
        '1997-08-08',
        '11990000008',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 9',
        'pessoa9@email.com',
        '1998-09-09',
        '11990000009',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 10',
        'pessoa10@email.com',
        '1999-10-10',
        '11990000010',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 11',
        'pessoa11@email.com',
        '1990-11-11',
        '11990000011',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 12',
        'pessoa12@email.com',
        '1991-12-12',
        '11990000012',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 13',
        'pessoa13@email.com',
        '1992-01-13',
        '11990000013',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 14',
        'pessoa14@email.com',
        '1993-02-14',
        '11990000014',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 15',
        'pessoa15@email.com',
        '1994-03-15',
        '11990000015',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 16',
        'pessoa16@email.com',
        '1995-04-16',
        '11990000016',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 17',
        'pessoa17@email.com',
        '1996-05-17',
        '11990000017',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 18',
        'pessoa18@email.com',
        '1997-06-18',
        '11990000018',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 19',
        'pessoa19@email.com',
        '1998-07-19',
        '11990000019',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 20',
        'pessoa20@email.com',
        '1999-08-20',
        '11990000020',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 21',
        'pessoa21@email.com',
        '1990-09-21',
        '11990000021',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 22',
        'pessoa22@email.com',
        '1991-10-22',
        '11990000022',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 23',
        'pessoa23@email.com',
        '1992-11-23',
        '11990000023',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 24',
        'pessoa24@email.com',
        '1993-12-24',
        '11990000024',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 25',
        'pessoa25@email.com',
        '1994-01-25',
        '11990000025',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 26',
        'pessoa26@email.com',
        '1995-02-26',
        '11990000026',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 27',
        'pessoa27@email.com',
        '1996-03-27',
        '11990000027',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 28',
        'pessoa28@email.com',
        '1997-04-28',
        '11990000028',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 29',
        'pessoa29@email.com',
        '1998-05-29',
        '11990000029',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 30',
        'pessoa30@email.com',
        '1999-06-30',
        '11990000030',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 31',
        'pessoa31@email.com',
        '1990-07-31',
        '11990000031',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 32',
        'pessoa32@email.com',
        '1991-08-01',
        '11990000032',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 33',
        'pessoa33@email.com',
        '1992-09-02',
        '11990000033',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 34',
        'pessoa34@email.com',
        '1993-10-03',
        '11990000034',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 35',
        'pessoa35@email.com',
        '1994-11-04',
        '11990000035',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 36',
        'pessoa36@email.com',
        '1995-12-05',
        '11990000036',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 37',
        'pessoa37@email.com',
        '1996-01-06',
        '11990000037',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 38',
        'pessoa38@email.com',
        '1997-02-07',
        '11990000038',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 39',
        'pessoa39@email.com',
        '1998-03-08',
        '11990000039',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 40',
        'pessoa40@email.com',
        '1999-04-09',
        '11990000040',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 41',
        'pessoa41@email.com',
        '1990-05-10',
        '11990000041',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 42',
        'pessoa42@email.com',
        '1991-06-11',
        '11990000042',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 43',
        'pessoa43@email.com',
        '1992-07-12',
        '11990000043',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 44',
        'pessoa44@email.com',
        '1993-08-13',
        '11990000044',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 45',
        'pessoa45@email.com',
        '1994-09-14',
        '11990000045',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 46',
        'pessoa46@email.com',
        '1995-10-15',
        '11990000046',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 47',
        'pessoa47@email.com',
        '1996-11-16',
        '11990000047',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 48',
        'pessoa48@email.com',
        '1997-12-17',
        '11990000048',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 49',
        'pessoa49@email.com',
        '1998-01-18',
        '11990000049',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        'Pessoa 50',
        'pessoa50@email.com',
        '1999-02-19',
        '11990000050',
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );
-- 4. Inserir 50 Reservas com datas adaptadas e cálculo do preço total fixo (5 dias)
INSERT INTO Reservations (
        SuiteId,
        PersonId,
        CheckInDate,
        CheckOutDate,
        TotalPrice,
        CreatedAt,
        UpdatedAt
    )
VALUES (
        1,
        1,
        DATETIME('now', '-10 days'),
        DATETIME('now', '-5 days'),
        150.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        2,
        2,
        DATETIME('now', '-9 days'),
        DATETIME('now', '-4 days'),
        300.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        3,
        3,
        DATETIME('now', '-8 days'),
        DATETIME('now', '-3 days'),
        500.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        4,
        4,
        DATETIME('now', '-7 days'),
        DATETIME('now', '-2 days'),
        100.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        5,
        5,
        DATETIME('now', '-6 days'),
        DATETIME('now', '-1 days'),
        400.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        6,
        6,
        DATETIME('now', '-5 days'),
        CURRENT_TIMESTAMP,
        160.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        7,
        7,
        DATETIME('now', '-4 days'),
        DATETIME('now', '+1 days'),
        310.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        8,
        8,
        DATETIME('now', '-3 days'),
        DATETIME('now', '+2 days'),
        520.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        9,
        9,
        DATETIME('now', '-2 days'),
        DATETIME('now', '+3 days'),
        110.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        10,
        10,
        DATETIME('now', '-1 days'),
        DATETIME('now', '+4 days'),
        410.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        11,
        11,
        CURRENT_TIMESTAMP,
        DATETIME('now', '+5 days'),
        155.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        12,
        12,
        DATETIME('now', '+1 days'),
        DATETIME('now', '+6 days'),
        305.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        13,
        13,
        DATETIME('now', '+2 days'),
        DATETIME('now', '+7 days'),
        510.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        14,
        14,
        DATETIME('now', '+3 days'),
        DATETIME('now', '+8 days'),
        105.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        15,
        15,
        DATETIME('now', '+4 days'),
        DATETIME('now', '+9 days'),
        405.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        16,
        16,
        DATETIME('now', '+5 days'),
        DATETIME('now', '+10 days'),
        165.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        17,
        17,
        DATETIME('now', '+6 days'),
        DATETIME('now', '+11 days'),
        315.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        18,
        18,
        DATETIME('now', '+7 days'),
        DATETIME('now', '+12 days'),
        530.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        19,
        19,
        DATETIME('now', '+8 days'),
        DATETIME('now', '+13 days'),
        115.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        20,
        20,
        DATETIME('now', '+9 days'),
        DATETIME('now', '+14 days'),
        415.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        21,
        21,
        DATETIME('now', '+10 days'),
        DATETIME('now', '+15 days'),
        170.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        22,
        22,
        DATETIME('now', '+11 days'),
        DATETIME('now', '+16 days'),
        320.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        23,
        23,
        DATETIME('now', '+12 days'),
        DATETIME('now', '+17 days'),
        540.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        24,
        24,
        DATETIME('now', '+13 days'),
        DATETIME('now', '+18 days'),
        120.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        25,
        25,
        DATETIME('now', '+14 days'),
        DATETIME('now', '+19 days'),
        420.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        26,
        26,
        DATETIME('now', '+15 days'),
        DATETIME('now', '+20 days'),
        175.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        27,
        27,
        DATETIME('now', '+16 days'),
        DATETIME('now', '+21 days'),
        325.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        28,
        28,
        DATETIME('now', '+17 days'),
        DATETIME('now', '+22 days'),
        550.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        29,
        29,
        DATETIME('now', '+18 days'),
        DATETIME('now', '+23 days'),
        125.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        30,
        30,
        DATETIME('now', '+19 days'),
        DATETIME('now', '+24 days'),
        430.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        31,
        31,
        DATETIME('now', '+20 days'),
        DATETIME('now', '+25 days'),
        180.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        32,
        32,
        DATETIME('now', '+21 days'),
        DATETIME('now', '+26 days'),
        330.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        33,
        33,
        DATETIME('now', '+22 days'),
        DATETIME('now', '+27 days'),
        560.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        34,
        34,
        DATETIME('now', '+23 days'),
        DATETIME('now', '+28 days'),
        130.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        35,
        35,
        DATETIME('now', '+24 days'),
        DATETIME('now', '+29 days'),
        440.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        36,
        36,
        DATETIME('now', '+25 days'),
        DATETIME('now', '+30 days'),
        185.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        37,
        37,
        DATETIME('now', '+26 days'),
        DATETIME('now', '+31 days'),
        335.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        38,
        38,
        DATETIME('now', '+27 days'),
        DATETIME('now', '+32 days'),
        570.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        39,
        39,
        DATETIME('now', '+28 days'),
        DATETIME('now', '+33 days'),
        135.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        40,
        40,
        DATETIME('now', '+29 days'),
        DATETIME('now', '+34 days'),
        450.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        41,
        41,
        DATETIME('now', '+30 days'),
        DATETIME('now', '+35 days'),
        190.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        42,
        42,
        DATETIME('now', '+31 days'),
        DATETIME('now', '+36 days'),
        340.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        43,
        43,
        DATETIME('now', '+32 days'),
        DATETIME('now', '+37 days'),
        580.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        44,
        44,
        DATETIME('now', '+33 days'),
        DATETIME('now', '+38 days'),
        140.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        45,
        45,
        DATETIME('now', '+34 days'),
        DATETIME('now', '+39 days'),
        460.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        46,
        46,
        DATETIME('now', '+35 days'),
        DATETIME('now', '+40 days'),
        195.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        47,
        47,
        DATETIME('now', '+36 days'),
        DATETIME('now', '+41 days'),
        345.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        48,
        48,
        DATETIME('now', '+37 days'),
        DATETIME('now', '+42 days'),
        590.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        49,
        49,
        DATETIME('now', '+38 days'),
        DATETIME('now', '+43 days'),
        145.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    ),
    (
        50,
        50,
        DATETIME('now', '+39 days'),
        DATETIME('now', '+44 days'),
        470.00 * 5,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP
    );
