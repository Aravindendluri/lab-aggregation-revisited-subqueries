
  
#Select the first name, last name, and email address of all the customers who have rented a movie.
  SELECT  DISTINCT(CONCAT(first_name," ",last_name))  as customer_name,lower(email)
  FROM customer c
  JOIN rental r ON r.customer_id=c.customer_id
  WHERE r.rental_id>=0;
 
 2-- # What is the average payment made by each customer (display the *customer id*, *customer name* (concatenated), and the *average payment made*). 
  SELECT DISTINCT(CONCAT(c.first_name," ", c.last_name)) as customer_name, c.customer_id, AVG(p.amount) as average_payment
  FROM customer c
  JOIN rental r ON r.customer_id=c.customer_id
  JOIN payment p ON p.customer_id=r.customer_id
  GROUP BY customer_name,customer_id;
  
  #- Write the query using multiple join statements
    SELECT category_id, name
    FROM category
    WHERE name='action'; -- The category_id of action films is 1.
    
    SELECT DISTINCT(CONCAT(c.first_name," ", c.last_name)) as customer_name, c.email as email
    FROM customer c
    JOIN store s ON s.store_id=c.store_id
    JOIN inventory i ON i.store_id=s.store_id
    JOIN film f ON f.film_id=i.inventory_id
    JOIN film_category fc ON fc.film_id=f.film_id
    WHERE fc.category_id=1
    ORDER BY customer_name ASC;
  