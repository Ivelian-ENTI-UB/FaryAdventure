/*Database Fary Adventures*/
DROP TABLE IF EXISTS characters_items;

DROP TABLE IF EXISTS stats;

DROP TABLE IF EXISTS characters_weapons;

DROP TABLE IF EXISTS characters;

DROP TABLE IF EXISTS items;

DROP TABLE IF EXISTS weapons;

DROP TABLE IF EXISTS weapons_types;

DROP TABLE IF EXISTS USERS;

CREATE TABLE characters (
    id_character INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(24) NOT NULL,
    age INT NOT NULL,
    gender CHAR(1) NOT NULL,
    level INT NOT NULL,
    health INT NOT NULL,
    height FLOAT NOT NULL,
    weight FLOAT NOT NULL,
    origin CHAR(2) NOT NULL
);

INSERT INTO
    characters (
        name,
        age,
        gender,
        level,
        health,
        height,
        weight,
        origin
    )
VALUES
    ('El Fary', 86, 'N', 201, 70, 1.2, 47, 'GY'),
    ('El Cigala', 640, 'M', 201, 80, 2.4, 150, 'RU'),
    ('El Churumbel', 33, 'M', 34, 33, 3.3, 333, 'AS'),
    ('El Kiko', -1, 'F', 70, 100, 1.1, 420, 'RE');

CREATE TABLE stats (
    id_stat INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    reputation INT NOT NULL,
    speed INT NOT NULL,
    morality INT NOT NULL,
    defense INT NOT NULL,
    hunger INT NOT NULL,
    reflex INT NOT NULL,
    stamina INT NOT NULL,
    id_character INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_character) REFERENCES characters(id_character)
);

INSERT INTO
    stats (
        reputation,
        speed,
        morality,
        defense,
        hunger,
        reflex,
        stamina,
        id_character
    )
VALUES
    (100, 40, 80, 10, 0, 0, -1, 1),
    (60, 50, 40, 5, 0, 1, 10, 2),
    (75, 30, 75, 7, 0, 0, 50, 3),
    (90, 60, 80, 4, 0, 1, 30, 4);

CREATE TABLE items (
    id_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    item VARCHAR(24) NOT NULL,
    type VARCHAR(16) NOT NULL,
    weight FLOAT NOT NULL,
    shape INT NOT NULL,
    equipable BOOLEAN NOT NULL,
    rarity INT NOT NULL,
    uses INT NOT NULL,
    quantity INT NOT NULL
);

INSERT INTO
    items (
        item,
        type,
        weight,
        shape,
        equipable,
        rarity,
        uses,
        quantity
    )
VALUES
    ('Bollo', 'Comida', 0.1, 3, 0, 5, 1, 1),
    (
        'Guitarra Flamenca',
        'Instrumento',
        1,
        4,
        1,
        100,
        100,
        1
    ),
    ('Piti', 'Droga', 0.01, 1, 1, 10, 1, 1),
    ('Portatil', 'Tecnologia', 2, 5, 1, 30, 100, 1),
    (
        'Pandereta',
        'Instrumento',
        0.2,
        1,
        1,
        40,
        1000,
        1
    ),
    ('Piano', 'Instrumento', 6, 1, 1, 75, 2000, 1),
    (
        'Escobilla de vater',
        'Limpieza',
        0.1,
        1,
        1,
        20,
        1000,
        1
    );

CREATE TABLE characters_items (
    id_character_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_character INT UNSIGNED NOT NULL,
    id_item INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_character) REFERENCES characters(id_character),
    FOREIGN KEY (id_item) REFERENCES items(id_item)
);

INSERT INTO
    characters_items (id_character, id_item)
VALUES
    (1, 5),
    (2, 5),
    (4, 5),
    (2, 7),
    (1, 6),
    (2, 2),
    (2, 6),
    (1, 2),
    (3, 6),
    (1, 7);

CREATE TABLE weapons_types (
    id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    weapon_type VARCHAR(16) NOT NULL
);

INSERT INTO
    weapons_types (weapon_type)
VALUES
    ('Melee'),
    ('Proyectil');

CREATE TABLE weapons (
    id_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    weapon VARCHAR(24) NOT NULL,
    level INT NOT NULL,
    damage INT NOT NULL,
    weight FLOAT NOT NULL,
    critical INT NOT NULL,
    id_weapon_type INT UNSIGNED NOT NULL
);

INSERT INTO
    weapons (
        weapon,
        level,
        damage,
        weight,
        critical,
        id_weapon_type
    )
VALUES
    ('Puños', 5, 10, 0.25, 5, 1),
    ('SPAS-12', 50, 80, 2, 10, 2),
    ('Extensible', 25, 20, 0.25, 10, 1),
    ('Taser', 30, 40, 0.25, 50, 1);

CREATE TABLE characters_weapons (
    id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_character INT UNSIGNED NOT NULL,
    id_weapon INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_character) REFERENCES characters(id_character),
    FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon)
);

INSERT INTO
    characters_weapons (id_character, id_weapon)
VALUES
    (2, 3),
    (3, 1),
    (1, 3),
    (1, 2);

INSERT INTO
    `weapons`(
        `weapon`,
        `level`,
        `damage`,
        `weight`,
        `critical`,
        `id_weapon_type`
    )
VALUES
    ('Kalashnikov', 23, 34, 3.8, 25, 1),
    ('KarahAnchoa', 42, 90, 0, 60, 1),
    ('PorroconWahhhxx', 150, 999, 0.1, 100, 1);

INSERT INTO
    `characters_weapons`(`id_character`, `id_weapon`)
VALUES
    (4, 5),
    (1, 6),
    (3, 7);

CREATE TABLE USERS (
    id_character INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(32) NOT NULL,
    password CHAR(32) NOT NULL,
    email VARCHAR(32) NOT NULL,
    birthdate DATE,
    registered DATETIME
);

INSERT INTO
    USERS (username, password, email, birthdate, registered)
VALUES
    (
        'ELXocas',
        'f5262801df669ef08d7879b98a893045',
        'ElXocas@gmail.com',
        '2000-01-01',
        '2023-11-27 14:21:01'
    );