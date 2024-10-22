/*FACEBOOK CLONE EXPLORATORY DATA ANALYSIS USING SQL*/

/*SQL SKILLS: joins, date manipulation, regular expressions, views, stored procedures, aggregate functions, string manipulation*/
 
-- --------------------------------------------------------------------------------------------------------------

/*Ques.1 The first 10 users on the platform*/
SELECT 
    *
FROM
   new.users
ORDER BY created_at asc
LIMIT 10;

 --------------------------------------------------------------------------------------------------------------

/*Ques.2 Total number of registrations*/

SELECT 
    COUNT(*) AS 'Total Registration'
FROM
    new.users;
    -- --------------------------------------------------------------------------------------------------------------

/*Ques.3 The day of the week most users register on*/

CREATE VIEW vwtotalregistrations AS
    SELECT 
        DATE_FORMAT(created_at, '%W') AS 'day of the week',
        COUNT(*) AS 'total number of registration'
    FROM
        new.users
    GROUP BY 1
    ORDER BY 2 DESC;

    SELECT 
    *
FROM
    vwtotalregistrations;

/*Version 2*/

SELECT 
    DAYNAME(created_at) AS 'Day of the Week',
    COUNT(*) AS 'Total Registration'
FROM
    new.users
GROUP BY 1
ORDER BY 2 DESC;
-- --------------------------------------------------------------------------------------------------------------

/*Ques.4 The users who have never posted a photo*/

SELECT 
    u.username
FROM
    new.users u
        LEFT JOIN
    new.photos p ON p.user_id = u.id
WHERE
    p.id IS NULL;
-- --------------------------------------------------------------------------------------------------------------

/*Ques.5 The most likes on a single photo*/
