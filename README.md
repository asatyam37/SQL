# SQL LESSONS

# 1. DDL(Data Defining Language)

## LESSON 1 : SELECTING QUERIES

Suppose you created a table named mytable:


---
| id | title               | director        | year | length_minutes |
|----|---------------------|-----------------|------|----------------|
| 1  | Brave               | Brenda Chapman  | 2012 | 102            |
| 2  | Ratatouille         | Brad Bird       | 2007 | 115            |
| 3  | Cars 2              | John Lasseter   | 2011 | 120            |
| 4  | Monsters, Inc.      | Pete Docter     | 2001 | 92             |
| 5  | Finding Nemo        | Andrew Stanton  | 2003 | 107            |
| 6  | Monsters University | Dan Scanlon     | 2013 | 110            |
| 7  | WALL-E              | Andrew Stanton  | 2008 | 104            |
| 8  | The Incredibles     | Brad Bird       | 2004 | 116            |
| 9  | Up                  | Pete Docter     | 2009 | 101            |
| 10 | Toy Story           | John Lasseter   | 1995 | 81             |
| 11 | A Bug's Life        | John Lasseter   | 1998 | 95             |
| 12 | Toy Story 2         | John Lasseter   | 1999 | 93             |
| 13 | Toy Story 3         | Lee Unkrich     | 2010 | 103            |
| 14 | Cars                | John Lasseter   | 2006 | 117            |
---


- Select query for a specific columns

        SELECT column, another_column, …
        FROM mytable;

- Select query for all columns
    
        SELECT * 
        FROM mytable;
---

### LESSON 2 : SELECTING QUERIES WITH CONSTRAINTS

- Select query with constraints

        SELECT column, another_column, …
        FROM mytable
        WHERE condition
        AND/OR another_condition
        AND/OR …

---
        
| Operator              | Condition                                            | SQL Example                        |
|:---------------------:|------------------------------------------------------|------------------------------------|
| =, !=, <, <=, >, >=  | Standard numerical operators                         | col_name **!=** 4                  |
| BETWEEN ... AND ...   | Number is within range of two values (inclusive)     | col_name **BETWEEN** 1.5 **AND** 10.5 |
| NOT BETWEEN ... AND ... | Number is not within range of two values (inclusive) | col_name **NOT BETWEEN** 1 **AND** 10 |
| IN (...)              | Number exists in a list                              | col_name **IN** (2, 4, 6)          |
| NOT IN (...)          | Number does not exist in a list                      | col_name **NOT IN** (1, 3, 5)      |

---

| Operator    | Condition                                                                                          | Example                                                                |
|:-----------:|----------------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| =           | Case-sensitive exact string comparison                                                            | col_name **=** "abc"                                                   |
| != or <>    | Case-sensitive exact string inequality comparison                                                 | col_name **!=** "abcd"                                                 |
| LIKE        | Case-insensitive exact string comparison                                                          | col_name **LIKE** "ABC"                                                |
| NOT LIKE    | Case-insensitive exact string inequality comparison                                               | col_name **NOT LIKE** "ABCD"                                           |
| %           | Matches a sequence of zero or more characters (only with LIKE or NOT LIKE)                        | col_name **LIKE** "%AT%" (matches "AT", "ATTIC", "CAT" or "BATS")      |
| \_          | Matches a single character (only with LIKE or NOT LIKE)                                            | col_name **LIKE** "AN_" (matches "AND", but not "AN")                  |
| IN (...)    | String exists in a list                                                                            | col_name **IN** ("A", "B", "C")                                        |
| NOT IN (...)| String does not exist in a list                                                                    | col_name **NOT IN** ("D", "E", "F")                                    |

---
Find all the Toy Story movies
            
            SELECT * FROM mytable
            WHERE title LIKE "Toy Story%"

Find all the movies directed by John Lasseter
           
            SELECT * FROM mytable
            WHERE director = "John Lasseter"

Find all the movies (and director) not directed by John Lasseter
            
            SELECT * FROM mytable 
            WHERE director != "John Lasseter"

Find all the WALL-* movies

         SELECT * FROM mytable
         WHERE title LIKE "WALL-%"


--- 

### LESSON 3: FILTERING AND SORTING QUERY RESULTS

Select query with unique results

        SELECT DISTINCT column, another_column, …
        FROM mytable
        WHERE condition(s);


Select query with ordered results

        SELECT column, another_column, …
        FROM mytable
        WHERE condition(s)
        ORDER BY column ASC/DESC;    

Select query with limited rows

        SELECT column, another_column, …
        FROM mytable
        WHERE condition(s)
        ORDER BY column ASC/DESC
        LIMIT num_limit OFFSET num_offset;

---

1. List all directors of Pixar movies (alphabetically), without duplicates 
        
        SELECT DISTINCT director FROM movies
        ORDER BY director ASC;

2. List the last four Pixar movies released (ordered from most recent to least)

        SELECT title, year FROM movies
        ORDER BY year DESC
        LIMIT 4;

3. List the first five Pixar movies sorted alphabetically 

        SELECT title FROM movies
        ORDER BY TITLE ASC
        LIMIT 5;


----
    Table: North American Cities
---
| city                | country       | population | latitude  | longitude   |
|---------------------|---------------|------------|-----------|-------------|
| Guadalajara         | Mexico        | 1500800    | 20.659699 | -103.349609 |
| Toronto             | Canada        | 2795060    | 43.653226 | -79.383184  |
| Houston             | United States | 2195914    | 29.760427 | -95.369803  |
| New York            | United States | 8405837    | 40.712784 | -74.005941  |
| Philadelphia        | United States | 1553165    | 39.952584 | -75.165222  |
| Havana              | Cuba          | 2106146    | 23.054070 | -82.345189  |
| Mexico City         | Mexico        | 8555500    | 19.432608 | -99.133208  |
| Phoenix             | United States | 1513367    | 33.448377 | -112.074037 |
| Los Angeles         | United States | 3884307    | 34.052234 | -118.243685 |
| Ecatepec de Morelos | Mexico        | 1742000    | 19.601841 | -99.050674  |
| Montreal            | Canada        | 1717767    | 45.501689 | -73.567256  |
| Chicago             | United States | 2718782    | 41.878114 | -87.629798  |

1. List all the Canadian cities and their populations

        SELECT * FROM north_american_cities
        WHERE Country like "Canada";

2. Order all the cities in the United States by their latitude from north to south

        SELECT * FROM north_american_cities
        WHERE Country like "United States"
        ORDER BY Latitude DESC;

3. List all the cities west of Chicago, ordered from west to east

        SELECT * FROM north_american_cities
        WHERE Longitude < -87.629798
        ORDER BY Longitude ASC;

4. List the two largest cities in Mexico (by population)
        SELECT city, population FROM north_american_cities
        WHERE country LIKE "Mexico"
        ORDER BY population DESC
        LIMIT 2;

5. List the third and fourth largest cities (by population) in the United States and their population

        SELECT city, population FROM north_american_cities
        WHERE country LIKE "Mexico"
        ORDER BY population DESC
        LIMIT 2 OFFSET 2;
