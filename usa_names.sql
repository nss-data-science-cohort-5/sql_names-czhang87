SELECT *
FROM names
LIMIT 50;

/*
1. How many rows are in the names table?
*/
SELECT COUNT(*)
FROM names;

/*
2. How many total registered people appear in the dataset?
*/
SELECT SUM(num_registered)
FROM names;

/*
3. Which name had the most appearances in a single year in the dataset?
*/
SELECT name
FROM names
ORDER BY num_registered DESC
LIMIT 1;

/*
4. What range of years are included?
*/
SELECT MAX(year)-MIN(year)
FROM names;

/*
5. What year has the largest number of registrations?
*/
SELECT year
FROM names
ORDER BY num_registered DESC
LIMIT 1;

/*
6. How many different (distinct) names are contained in the dataset?
*/
SELECT COUNT(DISTINCT name)
FROM names;

/*
7. Are there more males or more females registered?
*/
SELECT gender,COUNT(gender)
FROM names
GROUP BY gender;

/*
8. What are the most popular male and female names overall (i.e., the most total registrations)?
*/
SELECT name, gender, SUM(num_registered)
FROM names
GROUP BY gender, name
ORDER BY SUM(num_registered) DESC;

/*
9. What are the most popular boy and girl names of the first decade of the 2000s (2000 - 2009)?
*/
SELECT name, gender, SUM(num_registered)
FROM names
WHERE year BETWEEN 2000 AND 2009
GROUP BY gender, name
ORDER BY SUM(num_registered) DESC

/*
10. Which year had the most variety in names (i.e. had the most distinct names)?
*/
SELECT COUNT(DISTINCT name), year
FROM names
GROUP BY year
ORDER BY COUNT(DISTINCT name) DESC
LIMIT 1;

/*
11. What is the most popular name for a girl that starts with the letter X?
*/
SELECT name, SUM(num_registered)
FROM names
WHERE name LIKE 'X%'
AND gender = 'F'
GROUP BY name
ORDER BY SUM(num_registered) DESC
LIMIT 1;

/*
12. How many distinct names appear that start with a 'Q', but whose second letter is not 'u'?
*/
SELECT COUNT(DISTINCT name)
FROM names
WHERE name LIKE 'Q%' AND name NOT LIKE '_u%';

/*
13. Which is the more popular spelling between "Stephen" and "Steven"? Use a single query to answer this question.
*/
SELECT name, SUM(num_registered)
FROM names
WHERE name = 'Stephen' OR name = 'Steven'
GROUP BY name
ORDER BY SUM(num_registered) DESC
LIMIT 1;

/*
14. What percentage of names are "unisex" - that is what percentage of names have been used both for boys and for girls?
*/
SELECT COUNT(unisex_counts)*100.00/COUNT(*)
FROM (SELECT CASE WHEN (COUNT( DISTINCT gender)>1) THEN 1 END AS unisex_counts
FROM names
GROUP BY name) AS unisex

/*
15. How many names have made an appearance in every single year since 1880?
*/


/*
16. How many names have only appeared in one year?
*/

/*
17. How many names only appeared in the 1950s?
*/

/*
18. How many names made their first appearance in the 2010s?
*/

/*
19. Find the names that have not be used in the longest.
*/

/*
20. Come up with a question that you would like to answer using this dataset. Then write a query to answer this question.
*/


