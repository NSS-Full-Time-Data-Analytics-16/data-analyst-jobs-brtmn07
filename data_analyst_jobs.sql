-- data-analyst-jobs project

--1) How many rows are in the data_analyst_jobs table?
--		ANSWER: 1793

SELECT COUNT(*) 
FROM data_analyst_jobs;


--2) Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
--		ANSWER: ExxonMovil

SELECT *
FROM data_analyst_jobs
LIMIT 10;



--3) How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
--		ANSWER: TN=21 KY=6


SELECT COUNT(location), location
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY'
GROUP BY location;



SELECT COUNT(location)
FROM data_analyst_jobs
WHERE location = 'KY';


--4) How many postings in Tennessee have a star rating above 4?
--	ANSWER: 3

SELECT COUNT(DISTINCT(location, star_rating))
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;





--5) How many postings in the dataset have a review count between 500 and 1000?
--	ANSWER: count distinct = 70 (whereas count =151)

SELECT COUNT(review_count)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;



SELECT company, review_count
FROM data_analyst_jobs;





--6) Show the average star rating for companies in each state. The output should show the state as `state` and the 
--		average rating for the state as `avg_rating`. Which state shows the highest average rating?
--		ANSWER: NE with 4.2

SELECT location AS state, ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
GROUP BY location
ORDER BY avg_rating DESC NULLS LAST;


--7) Select unique job titles from the data_analyst_jobs table. How many are there?
--		ANSWER: 881

SELECT COUNT(DISTINCT(title)) AS unique_title
FROM data_analyst_jobs;

SELECT *
FROM data_analyst_jobs;


--8) How many unique job titles are there for California companies?
--		ANSWER: 230

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';



--9) Find the name of each company and its average star rating for all companies that have more than 5000 reviews 
--		across all locations. How many companies are there with more that 5000 reviews across all locations?
--		ANSWER: 41

SELECT company, ROUND(AVG(star_rating), 2) AS avg_star_rating
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY company
ORDER BY avg_star_rating DESC;


--10) Add the code to order the query in #9 from highest to lowest average star rating. Which company with more 
--		than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
--		ANSWER: General Motors, Unilever, Microsoft, NIKE, AMEX, KAiser Permanente all have 4.2 (see code above in #9)






--11) Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
--		ANSWER: 774

 SELECT COUNT(DISTINCT title)
 FROM data_analyst_jobs
 WHERE title ILIKE '%Analyst%';


 --12) How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? 
 --		What word do these positions have in common?
 --		ANSWER: 4 and the common word is data or Tableau

 SELECT title
 FROM data_analyst_jobs
 WHERE title NOT ILIKE '%Analyst%' AND title NOT ILIKE '%Analytics%';



 

 
-- BONUS: You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by 
--	industry (domain) that require SQL and have been posted longer than 3 weeks. 
--		Disregard any postings where the domain is NULL. 
--		Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
--		Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks 
--			for each of the top 4?



SELECT *
FROM data_analyst_jobs;


SELECT COUNT(title) AS total_jobs, domain
FROM data_analyst_jobs
	WHERE days_since_posting > 21 
	AND domain IS NOT NULL
	AND skill ILIKE '%SQL%'
GROUP BY domain
ORDER BY total_jobs DESC;



	

