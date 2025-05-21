
-- Single Table Lab Sheet

CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1), checkups SMALLINT UNSIGNED, birth DATE, death DATE);

INSERT INTO pet (name,owner,species,sex,checkups,birth,death)VALUES
 ('Fluffy','Harold','cat','f',5,'2001-02-04',NULL),
 ('Claws','Gwen','cat','m',2,'2000-03-17',NULL),
 ('Buffy','Harold','dog','f',7,'1999-05-13',NULL),
 ('Fang','Benny','dog','m',4,'2000-08-27',NULL),
 ('Bowser','Diane','dog','m',8,'1998-08-31','2001-07-29'),
 ('Chirpy','Gwen','bird','f',0,'2002-09-11',NULL),
 ('Whistler','Gwen','bird','',1,'2001-12-09',NULL),
 ('Slim','Benny','snake','m',5,'2001-04-29',NULL);

 . schema
 . table

SELECT * FROM pet;

-- Q1-1
SELECT owner, name FROM pet WHERE sex = 'f';

-- Q1-2
SELECT name, birth FROM pet where species = 'dog';

-- Q1-3
SELECT owner FROM pet where species = 'bird';

-- Q1-4
SELECT species FROM pet WHERE sex = 'f';

-- Q1-5
SELECT name, birth FROM pet WHERE species IN ('cat', 'bird');

-- Q1-6
SELECT name, species FROM pet WHERE species IN ('cat', 'bird') AND sex = 'f';

-- Q2-1
SELECT owner, name FROM pet WHERE name LIKE '%er' OR name LIKE '%all';

-- Q2-2
SELECT name FROM pet WHERE owner LIKE '%e%';

-- Q2-3
SELECT name FROM pet WHERE name NOT LIKE '%fy';

-- Q2-4
SELECT name FROM pet WHERE LENGTH(owner) == 4;

-- Q2-5
SELECT owner 
FROM pet 
WHERE substr(owner, 1, 1) IN ('A', 'B', 'C', 'D', 'E')
  AND substr(owner, -1, 1) IN ('A', 'B', 'C', 'D', 'E');

-- Q2-6
SELECT owner 
FROM pet 
WHERE UPPER(substr(owner, 1, 1)) IN ('A', 'B', 'C', 'D', 'E')
  AND UPPER(substr(owner, -1, 1)) IN ('A', 'B', 'C', 'D', 'E');

-- Q3-1
SELECT AVG(checkups) FROM pet;

-- Q3-2
SELECT species, COUNT(*) AS count FROM pet 
    GROUP BY species 
    ORDER BY count ASC;

-- Q3-3
SELECT owner, species, COUNT(*) AS pet_count FROM pet 
    GROUP BY owner, species 
    ORDER BY owner, species;

-- Q3-4
SELECT owner, COUNT(DISTINCT species) AS species_count FROM pet 
    GROUP BY owner 
    ORDER BY owner;

-- Q3-5
SELECT species, sex, COUNT(*) as gender_count FROM pet
  GROUP BY species, sex
  ORDER BY species, sex;

-- Q3-6
SELECT owner, SUM(species = 'bird') AS bird_count FROM pet GROUP BY owner; 

-- Q3-7
SELECT owner, COUNT(checkups) AS checkup_count FROM pet GROUP BY owner;