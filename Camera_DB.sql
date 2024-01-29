CREATE DATABASE camera;
USE camera;

DROP TABLE IF EXISTS products;
CREATE TABLE products (
	prodid	INTEGER,
    proddesc	VARCHAR(30),
    prodcost	DECIMAL(9,2),
    prodprice	DECIMAL(9,2),
		PRIMARY KEY (prodid));
        
INSERT INTO products VALUES (1000, "Animal photography kit", NULL, 725);
INSERT INTO products VALUES (101, "Camera", 150, 300);
INSERT INTO products VALUES (102, "Camera case", 10, 15);
INSERT INTO products VALUES (103, "70-210 zoom lens", 125, 200);
INSERT INTO products VALUES (104, "28-85 zoom lens", 115, 185);
INSERT INTO products VALUES (105, "Photographer's vest", 25, 40);
INSERT INTO products VALUES (106, "Lens cleaning cloth", 1, 1.25);
INSERT INTO products VALUES (107, "Tripod", 35, 45);
INSERT INTO products VALUES (108, "16 GB SDHC memory card", 30, 37);
        
DROP TABLE IF EXISTS assembly;
CREATE TABLE assembly (
	quantity	INTEGER NOT NULL,
    prodid	INTEGER,
    subprodid	INTEGER,
		PRIMARY KEY (prodid, subprodid),
        CONSTRAINT fk_assembly_product FOREIGN KEY (prodid)
			REFERENCES products (prodid),
		CONSTRAINT fk_assembly_subproduct FOREIGN KEY (subprodid)
			REFERENCES products (prodid));
            
INSERT INTO assembly VALUES (1, 1000, 101);
INSERT INTO assembly VALUES (1, 1000, 102);
INSERT INTO assembly VALUES (1, 1000, 103);
INSERT INTO assembly VALUES (1, 1000, 104);
INSERT INTO assembly VALUES (1, 1000, 105);
INSERT INTO assembly VALUES (2, 1000, 106);
INSERT INTO assembly VALUES (1, 1000, 107);
INSERT INTO assembly VALUES (10, 1000, 108);

-- Question 4a
-- How many different items are there in the animal photography kit?
SELECT COUNT(DISTINCT proddesc)
FROM products
WHERE proddesc != "Animal photography kit";

-- Question 4c
-- What is the total cost of the components of the animal photography kit?
SELECT SUM(prodcost) AS total_cost_animal_pk
FROM products;