CREATE DATABASE `jobs`; 
USE `jobs`;

DROP TABLE IF EXISTS dept;
CREATE TABLE dept (
	deptname	VARCHAR(20),
    deptfloor	SMALLINT NOT NULL,
    deptphone	SMALLINT NOT NULL,
    empno	    SMALLINT NOT NULL,
    PRIMARY KEY (deptname));
INSERT INTO dept VALUES ("Management", 5, 2001, 1);
INSERT INTO dept VALUES ("Marketing", 1, 2002, 2);
INSERT INTO dept VALUES ("Accounting", 4, 2003, 5);
INSERT INTO dept VALUES ("Purchasing", 4, 2004, 7);
INSERT INTO dept VALUES ("Personnel & PR", 1, 2005, 9);

DROP TABLE IF EXISTS emp;    
CREATE TABLE emp (
	empno		SMALLINT,
    empfname	VARCHAR(10),
    empsalary	DECIMAL(7,0),
    deptname	VARCHAR(15),
    bossno		SMALLINT,
    PRIMARY KEY(empno),
    CONSTRAINT fk_belong_dept FOREIGN KEY(deptname)
		REFERENCES dept (deptname),
	CONSTRAINT fk_has_boss FOREIGN KEY(bossno)
		REFERENCES emp (empno));
INSERT INTO emp VALUES (1,"Alice",75000,"Management", NULL);
INSERT INTO emp VALUES (2,"Ned",45000,"Marketing",1);
INSERT INTO emp VALUES (3,"Andrew",25000,"Marketing",2);
INSERT INTO emp VALUES (4,"Clare",22000,"Marketing",2);
INSERT INTO emp VALUES (5,"Todd",38000,"Accounting",1);
INSERT INTO emp VALUES (6,"Nancy",22000,"Accounting",5);
INSERT INTO emp VALUES (7,"Brier",43000,"Purchasing",1);
INSERT INTO emp VALUES (8,"Sarah",56000,"Purchasing",7);
INSERT INTO emp VALUES (9,"Sophie",35000,"Personnel & PR",1);

-- describe jobs.dept;
-- Use this statement to describe the table.
        
-- Question 2a
-- Find the departments where all the employees earn less than their boss.
WITH wrk AS (SELECT * FROM emp),
boss AS (SELECT * FROM emp)
SELECT wrk.deptname FROM wrk JOIN boss
	ON wrk.bossno = boss.empno
    WHERE wrk.empsalary < boss.empsalary;
    
-- Question 2c
-- List the departments having an average salary greater than $25,000.
SELECT deptname, AVG (empsalary) AS average_salary
FROM emp
WHERE deptname = "Marketing";

SELECT deptname, AVG (empsalary) AS average_salary
FROM emp
WHERE deptname = "Accounting";

SELECT deptname, AVG (empsalary) AS average_salary
FROM emp
WHERE deptname = "Purchasing";

SELECT deptname, AVG (empsalary) AS average_salary
FROM emp
WHERE deptname = "Management";

SELECT deptname, AVG (empsalary) AS average_salary
FROM emp
WHERE deptname = "Personnel & PR";

-- Question 2e
-- List the names and manager of the employees of the Marketing department who have a salary greater than $25,000.
SELECT empfname, bossno
FROM emp
WHERE empsalary > 25000 AND deptname = "Marketing";