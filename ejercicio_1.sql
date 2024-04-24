SELECT  s.name,
        c.cust_name,
        c.city
FROM salesman s 
LEFT JOIN customer c on s.salesman_id=c.salesman_id
WHERE s.city=c.city
ORDER BY s.name