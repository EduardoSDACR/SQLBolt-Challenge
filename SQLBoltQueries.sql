-- Exercise 1 --

SELECT Title FROM movies;
SELECT Director FROM movies;
SELECT Title, Director FROM movies;
SELECT Title, Year FROM movies;
SELECT * FROM movies;

-- Exercise 2 --

SELECT title, year FROM movies WHERE id = 6;
SELECT title, year FROM movies WHERE Year BETWEEN 2000 AND 2010;
SELECT title, year FROM movies WHERE Year NOT BETWEEN 2000 AND 2010;
SELECT title, year FROM movies ORDER BY year LIMIT 5;

-- Exercise 3 --

SELECT * FROM movies WHERE Title LIKE 'Toy Story%';
SELECT * FROM movies WHERE Director = 'John Lasseter';
SELECT * FROM movies WHERE Director <> 'John Lasseter';
SELECT * FROM movies WHERE Title LIKE 'WALL-%';

-- Exercise 4 --

SELECT DISTINCT Director FROM movies ORDER BY Director ASC;
SELECT * FROM movies ORDER BY Year DESC LIMIT 4;
SELECT * FROM movies ORDER BY Title ASC LIMIT 5;
SELECT * FROM movies ORDER BY Title ASC LIMIT 5 OFFSET 5;

-- Exercise 5 --

SELECT City, Population FROM north_american_cities WHERE country = 'Canada';
SELECT * FROM north_american_cities 
    WHERE country = 'United States' 
    ORDER BY Latitude DESC;
SELECT * FROM north_american_cities 
    WHERE Longitude < (
        SELECT Longitude FROM north_american_cities 
            WHERE city = 'Chicago'
        )
    ORDER BY Longitude;
SELECT * FROM north_american_cities 
    WHERE country = 'Mexico' 
    ORDER BY Population DESC 
    LIMIT 2;
SELECT * FROM north_american_cities
    WHERE country = 'United States'
    ORDER BY Population DESC
    LIMIT 2 OFFSET 2;

-- Exercise 6 --

SELECT m.title, b.domestic_sales, b.international_sales FROM movies m
    INNER JOIN boxoffice b 
    ON m.id = b.movie_id;
SELECT m.title, b.domestic_sales, b.international_sales FROM movies m
    INNER JOIN boxoffice b
    ON m.id = b.movie_id
    WHERE b.international_sales > b.domestic_sales;
SELECT m.title, b.rating FROM movies m
    INNER JOIN boxoffice b
    ON m.id = b.movie_id
    ORDER BY rating DESC;

-- Exercise 7 --

SELECT DISTINCT b.building_name FROM employees e 
    LEFT JOIN buildings b 
    ON e.building = b.building_name;
SELECT * FROM buildings;
SELECT DISTINCT e.role, b.building_name FROM buildings b LEFT JOIN employees e ON b.building_name = e.building

-- Exercise 8 --

SELECT name, role FROM employees WHERE building IS NULL;
SELECT b.building_name FROM buildings b 
    LEFT JOIN employees e 
    ON b.building_name = e.building
    WHERE e.building IS NULL;

-- Exercise 9 --

SELECT 
    m.title, 
    ((b.domestic_sales + b.international_sales) / 1000000) combined_sales 
    FROM movies m 
      JOIN boxoffice b
      ON m.id = b.movie_id;
SELECT m.title, (b.rating * 10) rating_percent FROM movies m 
    JOIN boxoffice b
    ON m.id = b.movie_id;
SELECT title, year FROM movies WHERE (year % 2) = 0;

-- Exercise 10 --

SELECT MAX(years_employed) longest_hired_employee FROM employees;
SELECT role, AVG(years_employed) average_years_employed FROM employees GROUP BY role;
SELECT building, SUM(years_employed) FROM employees GROUP BY building;

-- Exercise 11 --

SELECT Role, COUNT() employees_quantity FROM employees WHERE role = 'Artist' GROUP BY role;
SELECT Role, COUNT() employees_quantity FROM employees GROUP BY role;
SELECT role, SUM(years_employed) total_years_employed FROM employees 
    GROUP BY role 
    HAVING role = 'Engineer';

-- Exercise 12 --

SELECT director, COUNT() number_of_movies FROM movies GROUP BY director;
SELECT 
    m.director,
    (SUM(b.domestic_sales) + SUM(b.international_sales)) AS total_sales
    FROM movies m
        JOIN boxoffice b 
        ON m.id = b.movie_id
        GROUP BY director;

-- Exercise 13 --

INSERT INTO movies (title, director, year, length_minutes) 
    VALUES ('Toy Story 4', 'Jhon Lasseter', 2018, 94);
INSERT INTO boxoffice (movie_id, rating, domestic_sales, international_sales) 
    VALUES (15, 8.7, 340000000, 270000000);

-- Exercise 14 --

UPDATE movies SET director = 'John Lasseter' WHERE title = 'A Bug''s Life';
UPDATE movies SET year = 1999 WHERE title = 'Toy Story 2';
UPDATE movies SET 
    title = 'Toy Story 3',
    director = 'Lee Unkrich'
        WHERE title = 'Toy Story 8';

-- Exercise 15 --

DELETE FROM movies WHERE year < 2005;
DELETE FROM movies WHERE director = 'Andrew Stanton';

-- Exercise 16 --

CREATE TABLE Database (
    name TEXT,
    version FLOAT,
    download_count INTEGER
);

-- Exercise 17 --

ALTER TABLE movies ADD Aspect_ratio FLOAT;
ALTER TABLE movies ADD language TEXT DEFAULT 'English';

-- Exercise 18 --

DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS boxoffice;
