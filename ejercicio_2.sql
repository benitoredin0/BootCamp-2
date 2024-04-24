SELECT  o.ord_no,
        o.purch_amt,
        c.cust_name,
        c.city
FROM orders o
LEFT JOIN customer c on o.customer_id=c.customer_id
WHERE purch_amt BETWEEN 500 and 2000;