CREATE DATABASE king_queen;
USE king_queen;

DROP TABLE IF EXISTS monarch;
CREATE TABLE monarch (
	montype	CHAR(5) NOT NULL,
    monname	VARCHAR(15),
    monnum	VARCHAR(5),
    rgnbeg	DATE,
    premonname	VARCHAR(15),
    premonnum	VARCHAR(5),
    PRIMARY KEY (monname, monnum),
    CONSTRAINT fk_monarch FOREIGN KEY (premonname, premonnum)
		REFERENCES monarch (monname, monnum));
INSERT INTO monarch (montype, monname, monnum, rgnbeg) VALUES ("King", "William", "IV", "1830-06-26");
INSERT INTO monarch VALUES ("Queen", "Victoria", "I", "1837-06-20", "William", "IV");
INSERT INTO monarch VALUES ("King", "Edward", "VII", "1901-01-22", "Victoria", "I");
INSERT INTO monarch VALUES ("King", "George", "V", "1910-05-06", "Edward", "VII");
INSERT INTO monarch VALUES ("King", "Edward", "VIII", "1936-01-20", "George", "V");
INSERT INTO monarch VALUES ("King", "George", "VI", "1936-12-11", "Edward", "VIII");
INSERT INTO monarch VALUES ("Queen", "Elizabeth", "II", "1952-02-06", "George", "VI");
INSERT INTO monarch VALUES ("King", "Charles", "III", "2022-09-08", "Elizabeth", "II");

-- Question 3a
-- Who succeeded Victoria I?
SELECT premonname, premonnum
FROM monarch
WHERE monname = "Edward" AND monnum = "VII";

-- Question 3c
-- How many kings are there in the table?
SELECT COUNT(montype) AS king_count
FROM monarch
WHERE montype = "King";