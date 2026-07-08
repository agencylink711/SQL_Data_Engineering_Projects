/*
Find the top 10 companies for posting jobs,
They must have >3000 postings and the average salary must be >$100,000
Limit this to only US jobs
*/

SELECT
    cd.name AS company_name,
    COUNT(jpf.*) AS postings_count,
FROM
    job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
    ON jpf.company_id = cd.company_id
WHERE
    jpf.job_country = 'United States'    
GROUP BY
    cd.name
HAVING
    COUNT(jpf.job_id) > 3000
ORDER BY
    postings_count DESC
LIMIT 10;
