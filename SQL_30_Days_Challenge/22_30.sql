-- Google Interview Question for DA

CREATE TABLE student_names(
    student_id INT,
    name VARCHAR(50)
);

-- Insert the records
INSERT INTO student_names (student_id, name) VALUES
(1, 'RAM'),
(2, 'ROBERT'),
(3, 'ROHIM'),
(4, 'RAM'),
(5, 'ROBERT');


-- Question 


-- Get the count of distint student that are not unique 

with cte as (
select *,
COUNT(*) over(PARTITION by name) cnt
from student_names
)
select COUNT(distinct name) Distinct_not_unq_Student_Count from cte where cnt > 1;
