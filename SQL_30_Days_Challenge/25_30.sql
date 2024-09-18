-- TikTok Interview Question for data analyst

-- Create TikTok table
CREATE TABLE tiktok (
					views INT
);


-- Insert records
-- Insert records into the tiktok table
INSERT INTO tiktok (views) 
VALUES 
	(100), (800), (350), 
	(150), (600), 
	(700), (700), (950);

/*
-- Tik Tok Data Analyst Interview question

Q.1 Find the median within a series of numbers in SQL ;

1 8 3 4 5 odd 

1 3 4 5 8 9 even 

*/

with cte as (
select *,
ROW_NUMBER() over(order by views asc) asc_rn,
ROW_NUMBER() over(order by views desc) dec_rn
from tiktok
)
select cast(AVG(views) as float) as median from cte where ABS(dec_rn - asc_rn) <=1;
