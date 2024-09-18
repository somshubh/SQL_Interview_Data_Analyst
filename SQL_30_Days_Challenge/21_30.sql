-- SCHEMA


-- Create pages table
CREATE TABLE pages (
    page_id INTEGER PRIMARY KEY,
    page_name VARCHAR(255)
);

-- Insert data into pages table
INSERT INTO pages (page_id, page_name) VALUES
(20001, 'SQL Solutions'),
(20045, 'Brain Exercises'),
(20701, 'Tips for Data Analysts');

-- Create page_likes table
CREATE TABLE page_likes (
    user_id INTEGER,
    page_id INTEGER,
    liked_date DATETIME,
    FOREIGN KEY (page_id) REFERENCES pages(page_id)
);

-- Insert data into page_likes table
INSERT INTO page_likes (user_id, page_id, liked_date) VALUES
(111, 20001, '2022-04-08 00:00:00'),
(121, 20045, '2022-03-12 00:00:00'),
(156, 20001, '2022-07-25 00:00:00');



/*
Question 1:
Write a SQL query to retrieve the IDs of the Facebook pages that have zero likes. 
The output should be sorted in ascending order based on the page IDs.
*/

select * from pages;
select * from page_likes;

select p.page_id from pages p left join page_likes pl on p.page_id = pl.page_id
-- where pl.user_id is null
group by p.page_id
having COUNT(pl.page_id) = 0
order by p.page_id


