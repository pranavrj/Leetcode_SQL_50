/*
1757. Recyclable and Low Fat Products
Table: Products

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| low_fats    | enum    |
| recyclable  | enum    |
+-------------+---------+
product_id is the primary key (column with unique values) for this table.
low_fats is an ENUM (category) of type ('Y', 'N') where 'Y' means this product is low fat and 'N' means it is not.
recyclable is an ENUM (category) of types ('Y', 'N') where 'Y' means this product is recyclable and 'N' means it is not.

 

Write a solution to find the ids of products that are both low fat and recyclable.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Products table:
+-------------+----------+------------+
| product_id  | low_fats | recyclable |
+-------------+----------+------------+
| 0           | Y        | N          |
| 1           | Y        | Y          |
| 2           | N        | Y          |
| 3           | Y        | Y          |
| 4           | N        | N          |
+-------------+----------+------------+
Output: 
+-------------+
| product_id  |
+-------------+
| 1           |
| 3           |
+-------------+
Explanation: Only products 1 and 3 are both low fat and recyclable.
*/

SELECT 
PRODUCT_ID
FROM PRODUCTS
WHERE LOW_FATS='Y' AND RECYCLABLE='Y'



/*
584. Find Customer Referee
Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
In SQL, id is the primary key column for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.


Find the names of the customer that are not referred by the customer with id = 2.

Return the result table in any order.

The result format is in the following example.

*/

SELECT NAME FROM CUSTOMER
WHERE REFEREE_ID<>2 OR REFEREE_ID IS NULL

/*

595. Big Countries
Table: World

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| name        | varchar |
| continent   | varchar |
| area        | int     |
| population  | int     |
| gdp         | bigint  |
+-------------+---------+
name is the primary key (column with unique values) for this table.
Each row of this table gives information about the name of a country, the continent to which it belongs, its area, the population, and its GDP value.

 

A country is big if:

    it has an area of at least three million (i.e., 3000000 km2), or
    it has a population of at least twenty-five million (i.e., 25000000).

Write a solution to find the name, population, and area of the big countries.
*/

SELECT
NAME, POPULATION, AREA
FROM WORLD 
WHERE AREA>=3000000 OR POPULATION>=25000000

/*

1148. Article Views I
Table: Views

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| article_id    | int     |
| author_id     | int     |
| viewer_id     | int     |
| view_date     | date    |
+---------------+---------+
There is no primary key (column with unique values) for this table, the table may have duplicate rows.
Each row of this table indicates that some viewer viewed an article (written by some author) on some date. 
Note that equal author_id and viewer_id indicate the same person.

 

Write a solution to find all the authors that viewed at least one of their own articles.

Return the result table sorted by id in ascending order.

The result format is in the following example.
*/

SELECT
DISTINCT AUTHOR_ID AS ID
FROM VIEWS
WHERE AUTHOR_ID=VIEWER_ID


/*
1683. Invalid Tweets
Table: Tweets

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| tweet_id       | int     |
| content        | varchar |
+----------------+---------+
tweet_id is the primary key (column with unique values) for this table.
This table contains all the tweets in a social media app.

 

Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

Return the result table in any order.

The result format is in the following example.
*/

SELECT 
TWEET_ID
FROM TWEETS
WHERE LEN(CONTENT)>15

/*
1378. Replace Employee ID With The Unique Identifier
Table: Employees

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains the id and the name of an employee in a company.

 

Table: EmployeeUNI

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| unique_id     | int     |
+---------------+---------+
(id, unique_id) is the primary key (combination of columns with unique values) for this table.
Each row of this table contains the id and the corresponding unique id of an employee in the company.

 

Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.

Return the result table in any order.

The result format is in the following example.
*/

SELECT 
EU.UNIQUE_ID,E.NAME
FROM EMPLOYEES E
LEFT JOIN EMPLOYEEUNI EU
ON E.ID=EU.ID


/*

1068. Product Sales Analysis I

Table: Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
(sale_id, year) is the primary key (combination of columns with unique values) of this table.
product_id is a foreign key (reference column) to Product table.
Each row of this table shows a sale on the product product_id in a certain year.
Note that the price is per unit.

 

Table: Product

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
product_id is the primary key (column with unique values) of this table.
Each row of this table indicates the product name of each product.

 

Write a solution to report the product_name, year, and price for each sale_id in the Sales table.

Return the resulting table in any order.

The result format is in the following example.
*/

SELECT 
P.PRODUCT_NAME, S.YEAR,S.PRICE
FROM 
SALES S INNER JOIN PRODUCT P
ON S.PRODUCT_ID=P.PRODUCT_ID

/*
1581. Customer Who Visited but Did Not Make Any Transactions
Table: Visits

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| visit_id    | int     |
| customer_id | int     |
+-------------+---------+
visit_id is the column with unique values for this table.
This table contains information about the customers who visited the mall.

 

Table: Transactions

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| transaction_id | int     |
| visit_id       | int     |
| amount         | int     |
+----------------+---------+
transaction_id is column with unique values for this table.
This table contains information about the transactions made during the visit_id.

 

Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

Return the result table sorted in any order.
*/

SELECT 
V.CUSTOMER_ID,COUNT(V.CUSTOMER_ID) AS COUNT_NO_TRANS
FROM 
TRANSACTIONS T RIGHT JOIN VISITS V
ON V.VISIT_ID=T.VISIT_ID
WHERE T.TRANSACTION_ID IS NULL
GROUP BY V.CUSTOMER_ID

/*
197. Rising Temperature
Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.

 

Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.
*/

SELECT W1.id
FROM Weather W1
JOIN Weather W2
ON W1.recordDate = DATEADD(day, 1, W2.recordDate)
WHERE W1.temperature > W2.temperature;

/*
1661. Average Time of Process per Machine
Table: Activity

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| machine_id     | int     |
| process_id     | int     |
| activity_type  | enum    |
| timestamp      | float   |
+----------------+---------+
The table shows the user activities for a factory website.
(machine_id, process_id, activity_type) is the primary key (combination of columns with unique values) of this table.
machine_id is the ID of a machine.
process_id is the ID of a process running on the machine with ID machine_id.
activity_type is an ENUM (category) of type ('start', 'end').
timestamp is a float representing the current time in seconds.
'start' means the machine starts the process at the given timestamp and 'end' means the machine ends the process at the given timestamp.
The 'start' timestamp will always be before the 'end' timestamp for every (machine_id, process_id) pair.

 

There is a factory website that has several machines each running the same number of processes. Write a solution to find the average time each machine takes to complete a process.

The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.

The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.

Return the result table in any order.
*/

select a1.machine_id, round(avg(a2.timestamp-a1.timestamp), 3) as processing_time 
from Activity a1
join Activity a2 
on a1.machine_id=a2.machine_id and a1.process_id=a2.process_id
and a1.activity_type='start' and a2.activity_type='end'
group by a1.machine_id


/*
577. Employee Bonus
Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| empId       | int     |
| name        | varchar |
| supervisor  | int     |
| salary      | int     |
+-------------+---------+
empId is the column with unique values for this table.
Each row of this table indicates the name and the ID of an employee in addition to their salary and the id of their manager.

 

Table: Bonus

+-------------+------+
| Column Name | Type |
+-------------+------+
| empId       | int  |
| bonus       | int  |
+-------------+------+
empId is the column of unique values for this table.
empId is a foreign key (reference column) to empId from the Employee table.
Each row of this table contains the id of an employee and their respective bonus.

 

Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.

Return the result table in any order.
*/

SELECT 
E.NAME,B.BONUS
FROM EMPLOYEE E LEFT JOIN BONUS B
ON B.EMPID=E.EMPID
WHERE B.BONUS<1000 OR B.BONUS IS NULL

/*
1280. Students and Examinations
Table: Students

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| student_id    | int     |
| student_name  | varchar |
+---------------+---------+
student_id is the primary key (column with unique values) for this table.
Each row of this table contains the ID and the name of one student in the school.

 

Table: Subjects

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| subject_name | varchar |
+--------------+---------+
subject_name is the primary key (column with unique values) for this table.
Each row of this table contains the name of one subject in the school.

 

Table: Examinations

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| student_id   | int     |
| subject_name | varchar |
+--------------+---------+
There is no primary key (column with unique values) for this table. It may contain duplicates.
Each student from the Students table takes every course from the Subjects table.
Each row of this table indicates that a student with ID student_id attended the exam of subject_name.

 

Write a solution to find the number of times each student attended each exam.

Return the result table ordered by student_id and subject_name.
*/
SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e.student_id) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;

/*
570. Managers with at Least 5 Direct Reports
Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the name of an employee, their department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.

 

Write a solution to find managers with at least five direct reports.

Return the result table in any order.
*/

SELECT name
FROM Employee 
WHERE id IN 
(SELECT managerId FROM Employee GROUP BY managerId HAVING COUNT(*) >= 5)

/*
1934. Confirmation Rate
Table: Signups

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
+----------------+----------+
user_id is the column of unique values for this table.
Each row contains information about the signup time for the user with ID user_id.

 

Table: Confirmations

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
| action         | ENUM     |
+----------------+----------+
(user_id, time_stamp) is the primary key (combination of columns with unique values) for this table.
user_id is a foreign key (reference column) to the Signups table.
action is an ENUM (category) of the type ('confirmed', 'timeout')
Each row of this table indicates that the user with ID user_id requested a confirmation message at time_stamp and that confirmation message was either confirmed ('confirmed') or expired without confirming ('timeout').

 

The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.

Write a solution to find the confirmation rate of each user.

Return the result table in any order.
*/

SELECT
S.USER_ID,
IFNULL(ROUND((SUM(CASE WHEN ACTION='confirmed' THEN 1 ELSE 0 END)/COUNT(C.ACTION)),2),0.00) AS CONFIRMATION_RATE
FROM SIGNUPS S LEFT JOIN CONFIRMATIONS C
ON S.USER_ID=C.USER_ID
GROUP BY S.USER_ID


/*
620. Not Boring Movies
Table: Cinema

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| movie          | varchar  |
| description    | varchar  |
| rating         | float    |
+----------------+----------+
id is the primary key (column with unique values) for this table.
Each row contains information about the name of a movie, its genre, and its rating.
rating is a 2 decimal places float in the range [0, 10]

 

Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".

Return the result table ordered by rating in descending order.

The result format is in the following example.
*/

SELECT
*
FROM CINEMA
WHERE ID%2=1 AND DESCRIPTION NOT LIKE '%boring%'
ORDER BY RATING DESC

/*
1251. Average Selling Price
Table: Prices

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| start_date    | date    |
| end_date      | date    |
| price         | int     |
+---------------+---------+
(product_id, start_date, end_date) is the primary key (combination of columns with unique values) for this table.
Each row of this table indicates the price of the product_id in the period from start_date to end_date.
For each product_id there will be no two overlapping periods. That means there will be no two intersecting periods for the same product_id.

 

Table: UnitsSold

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| purchase_date | date    |
| units         | int     |
+---------------+---------+
This table may contain duplicate rows.
Each row of this table indicates the date, units, and product_id of each product sold. 

 

Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places.

Return the result table in any order.
*/

SELECT
P.PRODUCT_ID,
ISNULL(ROUND((SUM(U.UNITS*P.PRICE)*1.0/SUM(U.UNITS)),2),0) AS AVERAGE_PRICE
FROM
PRICES P LEFT JOIN UNITSSOLD U ON P.PRODUCT_ID=U.PRODUCT_ID
AND U.PURCHASE_DATE BETWEEN P.START_DATE AND P.END_DATE
GROUP BY P.PRODUCT_ID

/*
1075. Project Employees I
Table: Project

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| project_id  | int     |
| employee_id | int     |
+-------------+---------+
(project_id, employee_id) is the primary key of this table.
employee_id is a foreign key to Employee table.
Each row of this table indicates that the employee with employee_id is working on the project with project_id.

 

Table: Employee

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |
+------------------+---------+
employee_id is the primary key of this table. It's guaranteed that experience_years is not NULL.
Each row of this table contains information about one employee.

 

Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

Return the result table in any order.
*/

SELECT
P.PROJECT_ID,
ROUND((SUM(E.EXPERIENCE_YEARS)*1.0/COUNT(P.EMPLOYEE_ID)),2) AS AVERAGE_YEARS
FROM
PROJECT P JOIN EMPLOYEE E ON P.EMPLOYEE_ID=E.EMPLOYEE_ID
GROUP BY P.PROJECT_ID

/*
1633. Percentage of Users Attended a Contest
Table: Users

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| user_name   | varchar |
+-------------+---------+
user_id is the primary key (column with unique values) for this table.
Each row of this table contains the name and the id of a user.

 

Table: Register

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| contest_id  | int     |
| user_id     | int     |
+-------------+---------+
(contest_id, user_id) is the primary key (combination of columns with unique values) for this table.
Each row of this table contains the id of a user and the contest they registered into.

 

Write a solution to find the percentage of the users registered in each contest rounded to two decimals.

Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.
*/

SELECT
R.CONTEST_ID,
ROUND(COUNT(R.USER_ID)*100.00/(SELECT COUNT(1) FROM USERS),2) AS PERCENTAGE
FROM USERS U LEFT JOIN REGISTER R 
ON U.USER_ID=R.USER_ID
WHERE R.CONTEST_ID IS NOT NULL
GROUP BY R.CONTEST_ID
ORDER BY PERCENTAGE DESC,R.CONTEST_ID

/*
1211. Queries Quality and Percentage
Table: Queries

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| query_name  | varchar |
| result      | varchar |
| position    | int     |
| rating      | int     |
+-------------+---------+
This table may have duplicate rows.
This table contains information collected from some queries on a database.
The position column has a value from 1 to 500.
The rating column has a value from 1 to 5. Query with rating less than 3 is a poor query.

 

We define query quality as:

    The average of the ratio between query rating and its position.

We also define poor query percentage as:

    The percentage of all queries with rating less than 3.

Write a solution to find each query_name, the quality and poor_query_percentage.

Both quality and poor_query_percentage should be rounded to 2 decimal places.

Return the result table in any order.
*/

SELECT
QUERY_NAME,
ROUND(1.0*AVG((1.0*RATING)/(1.0*POSITION)),2) AS QUALITY,
ROUND(100.0*SUM(CASE WHEN RATING<3 THEN 1 ELSE 0 END)/COUNT(1),2) AS POOR_QUERY_PERCENTAGE
FROM QUERIES
WHERE QUERY_NAME IS NOT NULL
GROUP BY QUERY_NAME

/*
1193. Monthly Transactions I
Table: Transactions

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| country       | varchar |
| state         | enum    |
| amount        | int     |
| trans_date    | date    |
+---------------+---------+
id is the primary key of this table.
The table has information about incoming transactions.
The state column is an enum of type ["approved", "declined"].

 

Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.

Return the result table in any order.
*/

SELECT
TO_CHAR(TRANS_DATE,'YYYY-MM') as month,
COUNTRY,
COUNT(STATE) AS TRANS_COUNT,
SUM(CASE WHEN STATE='approved' THEN 1 ELSE 0 END) AS APPROVED_COUNT,
SUM(AMOUNT) AS TRANS_TOTAL_AMOUNT,
SUM(CASE WHEN STATE='approved' THEN AMOUNT ELSE 0 END) AS APPROVED_TOTAL_AMOUNT
FROM TRANSACTIONS
GROUP BY TO_CHAR(TRANS_DATE,'YYYY-MM'), COUNTRY

/*
1174. Immediate Food Delivery II
Table: Delivery

+-----------------------------+---------+
| Column Name                 | Type    |
+-----------------------------+---------+
| delivery_id                 | int     |
| customer_id                 | int     |
| order_date                  | date    |
| customer_pref_delivery_date | date    |
+-----------------------------+---------+
delivery_id is the column of unique values of this table.
The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery date (on the same order date or after it).

 

If the customer's preferred delivery date is the same as the order date, then the order is called immediate; otherwise, it is called scheduled.

The first order of a customer is the order with the earliest order date that the customer made. It is guaranteed that a customer has precisely one first order.

Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.

The result format is in the following example.
*/
WITH CTE AS(
SELECT
CUSTOMER_ID,
MIN(ORDER_DATE) AS MIN_ORDER_DATE
FROM DELIVERY
GROUP BY CUSTOMER_ID
)

SELECT 
ROUND(100.0*SUM(CASE WHEN C.MIN_ORDER_DATE=D.customer_pref_delivery_date THEN 1 ELSE 0 END)/COUNT(1),2) AS IMMEDIATE_PERCENTAGE
FROM DELIVERY D JOIN CTE C
ON D.CUSTOMER_ID=C.CUSTOMER_ID
AND D.ORDER_DATE=C.MIN_ORDER_DATE

/*
550. Game Play Analysis IV
Table: Activity

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
(player_id, event_date) is the primary key (combination of columns with unique values) of this table.
This table shows the activity of players of some games.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.

 

Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.
*/

WITH CTE AS(
SELECT 
PLAYER_ID,
MIN(EVENT_DATE) AS MIN_EVENT_DATE
FROM ACTIVITY 
GROUP BY PLAYER_ID
)
SELECT 
ROUND(1.0*COUNT(CASE WHEN DATEDIFF(DAY,MIN_EVENT_DATE,EVENT_DATE)=1 THEN 1 ELSE NULL END)/COUNT(DISTINCT C.PLAYER_ID),2) AS FRACTION
FROM ACTIVITY A JOIN  CTE C ON A.PLAYER_ID=C.PLAYER_ID

/*
2356. Number of Unique Subjects Taught by Each Teacher
Table: Teacher

+-------------+------+
| Column Name | Type |
+-------------+------+
| teacher_id  | int  |
| subject_id  | int  |
| dept_id     | int  |
+-------------+------+
(subject_id, dept_id) is the primary key (combinations of columns with unique values) of this table.
Each row in this table indicates that the teacher with teacher_id teaches the subject subject_id in the department dept_id.

 

Write a solution to calculate the number of unique subjects each teacher teaches in the university.

Return the result table in any order.
*/
SELECT 
TEACHER_ID,
COUNT(DISTINCT SUBJECT_ID) AS CNT
FROM TEACHER
GROUP BY TEACHER_ID

/*
1141. User Activity for the Past 30 Days I
Table: Activity

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| session_id    | int     |
| activity_date | date    |
| activity_type | enum    |
+---------------+---------+
This table may have duplicate rows.
The activity_type column is an ENUM (category) of type ('open_session', 'end_session', 'scroll_down', 'send_message').
The table shows the user activities for a social media website. 
Note that each session belongs to exactly one user.

 

Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.

Return the result table in any order.
*/

SELECT 
ACTIVITY_DATE AS DAY,
COUNT(DISTINCT USER_ID) AS ACTIVE_USERS
FROM ACTIVITY
WHERE ACTIVITY_DATE>='2019-06-28' AND ACTIVITY_DATE<='2019-07-27'
GROUP BY ACTIVITY_DATE

/*
1070. Product Sales Analysis III
Table: Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
(sale_id, year) is the primary key (combination of columns with unique values) of this table.
product_id is a foreign key (reference column) to Product table.
Each row of this table shows a sale on the product product_id in a certain year.
Note that the price is per unit.

 

Table: Product

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
product_id is the primary key (column with unique values) of this table.
Each row of this table indicates the product name of each product.

 

Write a solution to select the product id, year, quantity, and price for the first year of every product sold.

Return the resulting table in any order.
*/

WITH CTE AS(
SELECT
PRODUCT_ID,
MIN(YEAR) AS FIRST_YEAR
FROM SALES
GROUP BY PRODUCT_ID
)

SELECT
S.PRODUCT_ID,
C.FIRST_YEAR,
S.QUANTITY,
S.PRICE
FROM CTE C INNER JOIN SALES S
ON C.PRODUCT_ID=S.PRODUCT_ID AND C.FIRST_YEAR=S.YEAR

/*
596. Classes More Than 5 Students
Table: Courses

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+
(student, class) is the primary key (combination of columns with unique values) for this table.
Each row of this table indicates the name of a student and the class in which they are enrolled.

 

Write a solution to find all the classes that have at least five students.

Return the result table in any order.
*/

SELECT 
CLASS 
FROM COURSES
GROUP BY CLASS
HAVING COUNT(STUDENT)>=5


/*
1729. Find Followers Count
Table: Followers

+-------------+------+
| Column Name | Type |
+-------------+------+
| user_id     | int  |
| follower_id | int  |
+-------------+------+
(user_id, follower_id) is the primary key (combination of columns with unique values) for this table.
This table contains the IDs of a user and a follower in a social media app where the follower follows the user.

 

Write a solution that will, for each user, return the number of followers.

Return the result table ordered by user_id in ascending order.
*/

SELECT
USER_ID,
COUNT(FOLLOWER_ID) AS FOLLOWERS_COUNT
FROM FOLLOWERS
GROUP BY USER_ID
ORDER BY USER_ID

/*
619. Biggest Single Number
Table: MyNumbers

+-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
+-------------+------+
This table may contain duplicates (In other words, there is no primary key for this table in SQL).
Each row of this table contains an integer.

 

A single number is a number that appeared only once in the MyNumbers table.

Find the largest single number. If there is no single number, report null.
*/

SELECT MAX(NUM) AS NUM FROM MYNUMBERS WHERE
NUM IN(
SELECT 
NUM
FROM MYNUMBERS
GROUP BY NUM
HAVING COUNT(NUM)=1
)

/*
1045. Customers Who Bought All Products
Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+
This table may contain duplicates rows. 
customer_id is not NULL.
product_key is a foreign key (reference column) to Product table.

 

Table: Product

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_key | int     |
+-------------+---------+
product_key is the primary key (column with unique values) for this table.

 

Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.

Return the result table in any order.
*/

SELECT CUSTOMER_ID
FROM CUSTOMER
GROUP BY CUSTOMER_ID
HAVING COUNT(DISTINCT PRODUCT_KEY)=(SELECT COUNT(DISTINCT PRODUCT_KEY) FROM PRODUCT)

/*
1731. The Number of Employees Which Report to Each Employee
Table: Employees

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| reports_to  | int      |
| age         | int      |
+-------------+----------+
employee_id is the column with unique values for this table.
This table contains information about the employees and the id of the manager they report to. Some employees do not report to anyone (reports_to is null). 

 

For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.

Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.

Return the result table ordered by employee_id.
*/

SELECT 
E1.EMPLOYEE_ID,
E1.NAME,
COUNT(E2.REPORTS_TO) AS REPORTS_COUNT,
ROUND(AVG(E2.AGE*1.00),0) AS AVERAGE_AGE
FROM EMPLOYEES E1 
JOIN EMPLOYEES E2 ON E1.EMPLOYEE_ID=E2.REPORTS_TO
--WHERE E2.AGE IS NOT NULL
GROUP BY E1.EMPLOYEE_ID,E1.NAME
HAVING COUNT(E2.REPORTS_TO)>=1
ORDER BY E1.EMPLOYEE_ID

/*
1789. Primary Department for Each Employee
Table: Employee

+---------------+---------+
| Column Name   |  Type   |
+---------------+---------+
| employee_id   | int     |
| department_id | int     |
| primary_flag  | varchar |
+---------------+---------+
(employee_id, department_id) is the primary key (combination of columns with unique values) for this table.
employee_id is the id of the employee.
department_id is the id of the department to which the employee belongs.
primary_flag is an ENUM (category) of type ('Y', 'N'). If the flag is 'Y', the department is the primary department for the employee. If the flag is 'N', the department is not the primary.

 

Employees can belong to multiple departments. When the employee joins other departments, they need to decide which department is their primary department. Note that when an employee belongs to only one department, their primary column is 'N'.

Write a solution to report all the employees with their primary department. For employees who belong to one department, report their only department.

Return the result table in any order.
*/

WITH CTE AS(
SELECT
EMPLOYEE_ID, COUNT(DEPARTMENT_ID) AS CNT
FROM EMPLOYEE
GROUP BY EMPLOYEE_ID)

SELECT 
EMPLOYEE_ID,DEPARTMENT_ID
FROM 
EMPLOYEE 
WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM CTE WHERE CNT>1)
AND PRIMARY_FLAG='Y'
UNION ALL
SELECT 
EMPLOYEE_ID,DEPARTMENT_ID
FROM 
EMPLOYEE 
WHERE EMPLOYEE_ID IN (SELECT EMPLOYEE_ID FROM CTE WHERE CNT=1)


/*
610. Triangle Judgement
Table: Triangle

+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+
In SQL, (x, y, z) is the primary key column for this table.
Each row of this table contains the lengths of three line segments.

 

Report for every three line segments whether they can form a triangle.

Return the result table in any order.
*/

SELECT 
X,
Y,
Z,
CASE 
WHEN X+Y>Z AND X+Z>Y AND Y+Z>X THEN 'Yes' ELSE 'No' END AS TRIANGLE
FROM TRIANGLE

/*
180. Consecutive Numbers
Table: Logs

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column.

 

Find all numbers that appear at least three times consecutively.

Return the result table in any order.
*/
WITH CTE AS(
SELECT 
NUM,
ID,
LEAD(NUM,1)OVER(ORDER BY ID) AS NUM_1,
LEAD(NUM,2)OVER(ORDER BY ID) AS NUM_2,
LEAD(ID,1)OVER(ORDER BY ID) AS ID_1,
LEAD(ID,2)OVER(ORDER BY ID) AS ID_2
FROM 
LOGS
)
SELECT 
DISTINCT NUM AS CONSECUTIVENUMS 
FROM CTE
WHERE NUM=NUM_1 AND NUM=NUM_2
AND ID_1-ID=ID_2-ID_1

/*
1164. Product Price at a Given Date
Table: Products

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| new_price     | int     |
| change_date   | date    |
+---------------+---------+
(product_id, change_date) is the primary key (combination of columns with unique values) of this table.
Each row of this table indicates that the price of some product was changed to a new price at some date.

 

Write a solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.

Return the result table in any order.
*/

WITH CTE AS(
SELECT 
PRODUCT_ID, MAX(CHANGE_DATE) AS NEW_DATE
FROM PRODUCTS
WHERE CHANGE_DATE<='2019-08-16'
GROUP BY PRODUCT_ID
)

SELECT
C.PRODUCT_ID, P.NEW_PRICE AS PRICE
FROM CTE C JOIN PRODUCTS P
ON C.PRODUCT_ID=P.PRODUCT_ID AND C.NEW_DATE=P.CHANGE_DATE
UNION ALL
SELECT 
DISTINCT PRODUCT_ID, 10 AS PRICE
FROM PRODUCTS
WHERE PRODUCT_ID NOT IN (SELECT PRODUCT_ID FROM PRODUCTS WHERE CHANGE_DATE<='2019-08-16')

/*
1204. Last Person to Fit in the Bus
Table: Queue

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| person_id   | int     |
| person_name | varchar |
| weight      | int     |
| turn        | int     |
+-------------+---------+
person_id column contains unique values.
This table has the information about all people waiting for a bus.
The person_id and turn columns will contain all numbers from 1 to n, where n is the number of rows in the table.
turn determines the order of which the people will board the bus, where turn=1 denotes the first person to board and turn=n denotes the last person to board.
weight is the weight of the person in kilograms.

 

There is a queue of people waiting to board a bus. However, the bus has a weight limit of 1000 kilograms, so there may be some people who cannot board.

Write a solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit. The test cases are generated such that the first person does not exceed the weight limit.
*/

WITH CTE AS(
SELECT
*,
SUM(WEIGHT)OVER(ORDER BY TURN) AS TOTAL_WEIGHT
FROM QUEUE)

SELECT 
PERSON_NAME FROM CTE
WHERE TOTAL_WEIGHT<=1000
AND TURN=(SELECT MAX(TURN) FROM CTE WHERE TOTAL_WEIGHT<=1000)

/*
1907. Count Salary Categories
Table: Accounts

+-------------+------+
| Column Name | Type |
+-------------+------+
| account_id  | int  |
| income      | int  |
+-------------+------+
account_id is the primary key (column with unique values) for this table.
Each row contains information about the monthly income for one bank account.

 

Write a solution to calculate the number of bank accounts for each salary category. The salary categories are:

    "Low Salary": All the salaries strictly less than $20000.
    "Average Salary": All the salaries in the inclusive range [$20000, $50000].
    "High Salary": All the salaries strictly greater than $50000.

The result table must contain all three categories. If there are no accounts in a category, return 0.

Return the result table in any order.
*/
WITH CTE AS (
SELECT ACCOUNT_ID,
CASE WHEN INCOME < 20000 THEN 'Low Salary'
WHEN INCOME >= 20000 and INCOME <=50000 THEN 'Average Salary'
WHEN INCOME > 50000 THEN 'High Salary'
END AS CATEGORY
FROM ACCOUNTS
),
CATEGORIES AS (
    SELECT 'Low Salary' AS CATEGORY
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
)

SELECT
CC.CATEGORY, COUNT(ACCOUNT_ID) AS ACCOUNTS_COUNT
FROM CTE C RIGHT JOIN CATEGORIES CC ON CC.CATEGORY=C.CATEGORY
GROUP BY CC.CATEGORY

/*
1978. Employees Whose Manager Left the Company
Table: Employees

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| manager_id  | int      |
| salary      | int      |
+-------------+----------+
In SQL, employee_id is the primary key for this table.
This table contains information about the employees, their salary, and the ID of their manager. Some employees do not have a manager (manager_id is null). 

 

Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company. When a manager leaves the company, their information is deleted from the Employees table, but the reports still have their manager_id set to the manager that left.

Return the result table ordered by employee_id.
*/

SELECT 
EMPLOYEE_ID
FROM EMPLOYEES
WHERE SALARY<30000
AND MANAGER_ID NOT IN (SELECT EMPLOYEE_ID FROM EMPLOYEES)
ORDER BY EMPLOYEE_ID

/*
626. Exchange Seats
Table: Seat

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
id is a continuous increment.

 

Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.
*/

SELECT
ID,
CASE
WHEN ROW_NUMBER()OVER(ORDER BY ID)%2!=0 AND ID=(SELECT MAX(ID) FROM SEAT) THEN STUDENT
WHEN ROW_NUMBER()OVER(ORDER BY ID)%2=1 THEN LEAD(STUDENT,1)OVER(ORDER BY ID) 
WHEN ROW_NUMBER()OVER(ORDER BY ID)%2=0 THEN LAG(STUDENT,1)OVER(ORDER BY ID) 
END AS STUDENT
FROM SEAT
GROUP BY ID,STUDENT
ORDER BY ID

/*
1341. Movie Rating
Table: Movies

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| title         | varchar |
+---------------+---------+
movie_id is the primary key (column with unique values) for this table.
title is the name of the movie.

 

Table: Users

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
+---------------+---------+
user_id is the primary key (column with unique values) for this table.

 

Table: MovieRating

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| movie_id      | int     |
| user_id       | int     |
| rating        | int     |
| created_at    | date    |
+---------------+---------+
(movie_id, user_id) is the primary key (column with unique values) for this table.
This table contains the rating of a movie by a user in their review.
created_at is the user's review date. 

 

Write a solution to:

    Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.
    Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name.

The result format is in the following example.
*/

WITH CTE1 AS(
SELECT
U.NAME, COUNT(MR.RATING),
ROW_NUMBER()OVER(ORDER BY COUNT(MR.RATING) DESC,U.NAME) AS RN
FROM USERS U JOIN MOVIERATING MR
ON U.USER_ID=MR.USER_ID
GROUP BY U.NAME)
, CTE2 AS(
SELECT
M.TITLE,AVG(MR.RATING),
ROW_NUMBER()OVER(ORDER BY AVG(MR.RATING) DESC,M.TITLE) AS RN
FROM 
MOVIES M JOIN MOVIERATING MR
ON M.MOVIE_ID=MR.MOVIE_ID
WHERE CREATED_AT BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY M.TITLE
)

SELECT NAME AS RESULTS FROM CTE1
WHERE RN=1
UNION ALL
SELECT TITLE FROM CTE2
WHERE RN=1

/*
1321. Restaurant Growth
Table: Customer

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| name          | varchar |
| visited_on    | date    |
| amount        | int     |
+---------------+---------+
In SQL,(customer_id, visited_on) is the primary key for this table.
This table contains data about customer transactions in a restaurant.
visited_on is the date on which the customer with ID (customer_id) has visited the restaurant.
amount is the total paid by a customer.

 

You are the restaurant owner and you want to analyze a possible expansion (there will be at least one customer every day).

Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places.

Return the result table ordered by visited_on in ascending order.

The result format is in the following example.
*/

WITH CTE1 AS(

SELECT VISITED_ON,
SUM(AMOUNT) AS AMOUNT
FROM CUSTOMER
GROUP BY VISITED_ON
)

SELECT
VISITED_ON,
SUM(AMOUNT)OVER(ORDER BY VISITED_ON ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS AMOUNT,
ROUND(AVG(AMOUNT)OVER(ORDER BY VISITED_ON ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS AVERAGE_AMOUNT
FROM CTE1
ORDER BY VISITED_ON
OFFSET 6

/*
602. Friend Requests II: Who Has the Most Friends
Table: RequestAccepted

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| requester_id   | int     |
| accepter_id    | int     |
| accept_date    | date    |
+----------------+---------+
(requester_id, accepter_id) is the primary key (combination of columns with unique values) for this table.
This table contains the ID of the user who sent the request, the ID of the user who received the request, and the date when the request was accepted.

 

Write a solution to find the people who have the most friends and the most friends number.

The test cases are generated so that only one person has the most friends.

The result format is in the following example.
*/

WITH CTE AS(
SELECT REQUESTER_ID AS ID FROM RequestAccepted 
UNION ALL
SELECT ACCEPTER_ID FROM RequestAccepted 
)

SELECT ID, COUNT(*) AS NUM
FROM CTE
GROUP BY ID
ORDER BY NUM DESC
LIMIT 1


/*
585. Investments in 2016
Table: Insurance

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| pid         | int   |
| tiv_2015    | float |
| tiv_2016    | float |
| lat         | float |
| lon         | float |
+-------------+-------+
pid is the primary key (column with unique values) for this table.
Each row of this table contains information about one policy where:
pid is the policyholder's policy ID.
tiv_2015 is the total investment value in 2015 and tiv_2016 is the total investment value in 2016.
lat is the latitude of the policy holder's city. It's guaranteed that lat is not NULL.
lon is the longitude of the policy holder's city. It's guaranteed that lon is not NULL.

 

Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

    have the same tiv_2015 value as one or more other policyholders, and
    are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).

Round tiv_2016 to two decimal places.
*/

SELECT ROUND(SUM(CAST(TIV_2016 AS NUMERIC)),2) TIV_2016 
FROM INSURANCE 
WHERE TIV_2015 IN (
SELECT 
TIV_2015 
FROM INSURANCE
GROUP BY 1 
HAVING(COUNT(1))>1)
AND (LAT,LON) IN
(SELECT 
LAT, LON 
FROM INSURANCE
GROUP BY 1,2 
HAVING(COUNT(1))=1)

/*
185. Department Top Three Salaries
Table: Employee

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
id is the primary key (column with unique values) for this table.
departmentId is a foreign key (reference column) of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.

 

Table: Department

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID of a department and its name.

 

A company's executives are interested in seeing who earns the most money in each of the company's departments. A high earner in a department is an employee who has a salary in the top three unique salaries for that department.

Write a solution to find the employees who are high earners in each of the departments.

Return the result table in any order.
*/

WITH CTE AS
(
SELECT D.NAME DEPARTMENT,
E.NAME EMPLOYEE,
E.SALARY,
DENSE_RANK()OVER(PARTITION BY DEPARTMENTID ORDER BY SALARY DESC) AS RN
FROM EMPLOYEE E JOIN DEPARTMENT D
ON E.DEPARTMENTID=D.ID
)

SELECT
DEPARTMENT, 
EMPLOYEE,
SALARY
FROM CTE 
WHERE RN<4

/*
1667. Fix Names in a Table
Table: Users

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| user_id        | int     |
| name           | varchar |
+----------------+---------+
user_id is the primary key (column with unique values) for this table.
This table contains the ID and the name of the user. The name consists of only lowercase and uppercase characters.

 

Write a solution to fix the names so that only the first character is uppercase and the rest are lowercase.

Return the result table ordered by user_id.
*/

SELECT
USER_ID,
CONCAT(UPPER(SUBSTRING(NAME FROM 1 FOR 1)),CONCAT(LOWER(SUBSTRING(NAME FROM 2)))) AS NAME
FROM
USERS
ORDER BY USER_ID


/*
1527. Patients With a Condition
Table: Patients

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| patient_id   | int     |
| patient_name | varchar |
| conditions   | varchar |
+--------------+---------+
patient_id is the primary key (column with unique values) for this table.
'conditions' contains 0 or more code separated by spaces. 
This table contains information of the patients in the hospital.

 

Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.

Return the result table in any order.
*/

SELECT 
* 
FROM PATIENTS
WHERE CONDITIONS LIKE '% DIAB1%'
OR CONDITIONS LIKE 'DIAB1%'

/*
196. Delete Duplicate Emails
Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.

 

Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.

For Pandas users, please note that you are supposed to modify Person in place.

After running your script, the answer shown is the Person table. The driver will first compile and run your piece of code and then show the Person table. The final order of the Person table does not matter.
*/
DELETE 
FROM PERSON
WHERE ID NOT IN (select MIN(ID) FROM PERSON GROUP BY EMAIL)

/*
176. Second Highest Salary
Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.

 

Write a solution to find the second highest salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).
*/

SELECT 
MAX(SALARY) AS SECONDHIGHESTSALARY
FROM EMPLOYEE WHERE SALARY<(SELECT MAX(SALARY) FROM EMPLOYEE)

/*
1484. Group Sold Products By The Date
Table Activities:

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| sell_date   | date    |
| product     | varchar |
+-------------+---------+
There is no primary key (column with unique values) for this table. It may contain duplicates.
Each row of this table contains the product name and the date it was sold in a market.

 

Write a solution to find for each date the number of different products sold and their names.

The sold products names for each date should be sorted lexicographically.

Return the result table ordered by sell_date.
*/

SELECT
SELL_DATE,
COUNT(DISTINCT PRODUCT) AS NUM_SOLD,
STRING_AGG(DISTINCT PRODUCT, ',') AS PRODUCTS
FROM ACTIVITIES
GROUP BY SELL_DATE
ORDER BY SELL_DATE;

/*
1327. List the Products Ordered in a Period
able: Products

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| product_id       | int     |
| product_name     | varchar |
| product_category | varchar |
+------------------+---------+
product_id is the primary key (column with unique values) for this table.
This table contains data about the company's products.

 

Table: Orders

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| product_id    | int     |
| order_date    | date    |
| unit          | int     |
+---------------+---------+
This table may have duplicate rows.
product_id is a foreign key (reference column) to the Products table.
unit is the number of products ordered in order_date.

 

Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.

Return the result table in any order.
*/

SELECT 
P.PRODUCT_NAME,
SUM(O.UNIT) AS UNIT
FROM PRODUCTS P JOIN ORDERS O
ON P.PRODUCT_ID=O.PRODUCT_ID
WHERE O.ORDER_DATE BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY P.PRODUCT_NAME
HAVING SUM(O.UNIT)>=100

/*
1517. Find Users With Valid E-Mails
Table: Users

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | int     |
| name          | varchar |
| mail          | varchar |
+---------------+---------+
user_id is the primary key (column with unique values) for this table.
This table contains information of the users signed up in a website. Some e-mails are invalid.

 

Write a solution to find the users who have valid emails.

A valid e-mail has a prefix name and a domain where:

    The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'. The prefix name must start with a letter.
    The domain is '@leetcode.com'.

Return the result table in any order.
*/

SELECT *
FROM USERS
WHERE REGEXP_LIKE(MAIL, '^[a-zA-Z]+[a-zA-Z0-9_.-]*@leetcode\.com$')
