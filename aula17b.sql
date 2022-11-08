DROP DATABASE IF EXISTS calendars;
CREATE DATABASE calendars;

USE calendars;

CREATE TABLE calendars(
    id INT AUTO_INCREMENT,
    fulldate DATE,
    day TINYINT NOT NULL,
    month TINYINT NOT NULL,
    quarter TINYINT NOT NULL,
    year INT NOT NULL,
    PRIMARY KEY(id)
);

DELIMITER $$

CREATE PROCEDURE insertCalendar(dt DATE)
BEGIN 
    INSERT INTO calendars(
        fulldate,
        day, 
        month,
        quarter,
        year
    )
    VALUES (
            dt,
            EXTRACT(DAY FROM dt),
            EXTRACT(MONTH FROM dt),
            EXTRACT(QUARTER FROM dt),
            EXTRACT(YEAR FROM dt)
    );

END $$

DELIMITER ;

CALL insertCalendar(NOW());

-- SELECT * FROM calendars;

DELIMITER $$

CREATE PROCEDURE LoadCalendars(
    startDate DATE,
    day INT
)
BEGIN 

    DECLARE counter INT DEFAULT 1;
    DECLARE dt DATE DEFAULT startDate;

    WHILE counter <= day DO 
        CALL insertCalendar(dt);
        SET counter = counter + 1;
        SET dt = DATE_ADD(dt, INTERVAL 1 day);
    END WHILE;

END $$

DELIMITER ;

CALL LoadCalendars(NOW(), 10);

SELECT * FROM calendars;

DELIMITER $$

CREATE PROCEDURE RepeatDemo()
BEGIN   
    DECLARE counter INT DEFAULT 1;
    DECLARE result VARCHAR(100) DEFAULT '';

    REPEAT
        SET result = CONCAT(result, counter, ',');
        SET counter = counter +1;
    UNTIL counter >= 10
    END REPEAT;

    -- DISPLAY RESULT
    SELECT result;

END$$

DELIMITER ;

CALL repeatDemo();



