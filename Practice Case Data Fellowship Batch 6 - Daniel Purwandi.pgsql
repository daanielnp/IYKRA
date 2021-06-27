-- Practice Case Data Fellowship Batch 6
-- by Daniel Nugraha Purwandi

-- Question 1: How many recommendations could you give for him?

SELECT count(film_id) 
FROM film
WHERE 
    description like '%stronaut%';

SELECT * 
FROM film
WHERE 
    description like '%stronaut%';

-- Question 2: How many films have a rating of “R” and a replacement cost between $5 and $15

SELECT * 
FROM film
WHERE 
    rating = 'R' AND
    (replacement_cost BETWEEN 5 AND 15);

-- Question 3: How many payments did each staff member handle? And how much was the total amount processed by each staff member?

SELECT
    s.staff_id,
    s.first_name,
    sum(p.amount) as sum_amount_payment,
    count(p.customer_id) as count_order
FROM staff as s
LEFT JOIN payment as p
ON s.staff_id = p.staff_id
GROUP BY 1,2;

-- Question 4: Average replacement cost of movies by rating

SELECT 
    rating,
    avg(replacement_cost) as avg_replacement_cost
FROM film
GROUP BY 1 
ORDER BY 1;

-- Question 5: 5 customers name, email and their spent amount

SELECT 
    c.first_name,
    c.email,
    sum(p.amount)
FROM customer as c
LEFT JOIN payment as p
ON c.customer_id = p.customer_id
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 5;

-- Question 6: How many copies of each movie in each store, do we have?

SELECT 
    store_id,
    film_id,
    count(film_id) as count_film
FROM inventory
GROUP BY 1,2
ORDER BY 1,2;

-- Question 7: Customer name, email who are eligible for the credit card

SELECT 
    c.first_name,
    c.email,
    count(p.payment_id) as count_payment
FROM customer as c
LEFT JOIN payment as p  
ON c.customer_id = p.customer_id
GROUP BY 1,2
HAVING count(p.payment_id)>= 40;