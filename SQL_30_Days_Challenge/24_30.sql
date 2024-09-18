-- Zomato Business Analyst interview question 
drop table if exists order_details;
CREATE TABLE order_details (
    order_id INT,
    del_partner VARCHAR(255),
    predicted_time datetime,
    delivery_time datetime
);


INSERT INTO order_details (order_id, del_partner, predicted_time, delivery_time) 
VALUES 
    (11, 'Partner C', '2024-02-29 11:30:00', '2024-02-29 12:00:00'),
    (12, 'Partner A', '2024-02-29 10:45:00', '2024-02-29 11:30:00'),
    (13, 'Partner B', '2024-02-29 09:00:00', '2024-02-29 09:45:00'),
    (14, 'Partner A', '2024-02-29 12:15:00', '2024-02-29 13:00:00'),
    (15, 'Partner C', '2024-02-29 13:30:00', '2024-02-29 14:15:00'),
    (16, 'Partner B', '2024-02-29 14:45:00', '2024-02-29 15:30:00'),
    (17, 'Partner A', '2024-02-29 16:00:00', '2024-02-29 16:45:00'),
    (18, 'Partner B', '2024-02-29 17:15:00', '2024-02-29 18:00:00'),
    (19, 'Partner C', '2024-02-29 18:30:00', '2024-02-29 19:15:00');


/*
-- How many delayed orders does each delivery partner have, 
considering the predicted delivery time and the actual delivery time?
*/

with cte as(
select *,
cast(DATENAME(hour, predicted_time) AS float) + cast(DATENAME(MINUTE, predicted_time) as float)/60 as pre_hour, -- Hour convert 
cast(DATENAME(hour, delivery_time) AS float) + cast(DATENAME(MINUTE, delivery_time) as float)/60 as del_hour -- hour convert
from order_details
)
select del_partner, COUNT(*) delay_order_count from cte where del_hour > pre_hour
group by del_partner

