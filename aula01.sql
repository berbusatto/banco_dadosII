SELECT "Use MySQL database"
AS "INFO";

USE mysql;

SELECT "Drop database aula01 if exists"
AS "INFO";

DROP DATABASE IF EXISTS aula01;

SELECT "The creating of database" 
AS "INFO";

CREATE DATABASE aula01;

SELECT "Use of database" 
AS "INFO";

USE aula01;

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id_student          INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name          VARCHAR(255) NOT NULL,
    last_name           VARCHAR(255) NOT NULL,
    gender              ENUM("MA", "FE"),
    created_at          DATETIME DEFAULT CURRENT_DATE(),
    deleted_at          DATETIME,
    code_registration   INTEGER UNIQUE,
    status              BOOLEAN DEFAULT true
);

DESCRIBE students;

INSERT INTO students(
    first_name,
    last_name,
    gender,
    code_registration
)
    VALUES
(
    'Bernardo',
    'Busatto',
    'MA',
    1
),
(
    'Raphael',
    'Stanula',
    'MA',
    2
),
(
    'Aryon',
    'Brunetti',
    'MA',
    3
);

SELECT * FROM students;