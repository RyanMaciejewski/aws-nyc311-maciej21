-- This query counts the total number of complaints in the dataset. The expected result is 200,000 (as a single number).
SELECT COUNT(*) AS n_complaints
FROM nyc311_db.complaints;

-- This query finds the earliest and latest complaint dates in the dataset. The expected result is two dates listed as earliest and latest.
SELECT 
  MIN(created_date) AS earliest,
  MAX(created_date) AS latest
FROM nyc311_db.complaints;

-- This query finds the number of complaint counts per agency with a limit of showing the top 10 agenecies by complaint count.
SELECT agency, COUNT(*) AS n
FROM nyc311_db.complaints
GROUP BY agency
ORDER BY n DESC
LIMIT 10;

-- This query finds the greatest number of the same problem complaints for the top 20 most reported issues and lists them by borough, problem, and complaint count.
SELECT borough, problem, COUNT(*) AS n
FROM nyc311_db.complaints
GROUP BY borough, problem
ORDER BY n DESC
LIMIT 20;

-- This query finds the total number of complaints per agenecy and outputs a table with agenecy, agency name, and total count of complaint. The table is ordered from greatest complaint count to lowest.
SELECT 
  c.agency,
  a.agency_name,
  COUNT(*) AS n
FROM nyc311_db.complaints AS c
JOIN nyc311_db.agencies AS a
  ON c.agency = a.agency
GROUP BY c.agency, a.agency_name
ORDER BY n DESC;