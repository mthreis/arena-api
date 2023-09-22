show databases;

describe users;

show tables;

CREATE TABLE sports (
    id int NOT NULL AUTO_INCREMENT,
    name VARCHAR(40),
    PRIMARY KEY (id)
);

CREATE TABLE users ()
    id int NOT NULL,
    firstName VARCHAR(40),
    surnames VARCHAR(100),
    dateOfBirth DATE NOT NULL,
    PRIMARY KEY (id)
);

select * from users;
select * from sports;

CREATE TABLE users (
    id int NOT NULL,
    firstName VARCHAR(40),
    surnames VARCHAR(100),
    dateOfBirth DATE NOT NULL,
    PRIMARY KEY (id)
);

UPDATE users
    SET sportID = null
    WHERE id = 1;

ALTER TABLE users DROP FOREIGN KEY fkSportID;
ALTER TABLE users
ADD COLUMN sportIDs int;


ALTER TABLE sports
DROP COLUMN sportID;

ALTER TABLE users
DROP COLUMN sportID;

ALTER TABLE users ADD CONSTRAINT fkSportID
FOREIGN KEY(sportID) REFERENCES sports(id);

ALTER TABLE users
MODIFY sportID int; FOREIGN KEY(sportID) REFERENCES sports(id);

ALTER TABLE users
MODIFY id int NOT NULL AUTO_INCREMENT;


INSERT INTO users (firstName, surnames, dateOfBirth, sex) 
VALUES ("Matheus", "Gonçalves Reis da Silva", "1995-03-29", 'M');


INSERT INTO sports (name) 
VALUES ("volleyball");