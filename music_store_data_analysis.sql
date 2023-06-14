
/*	Question Set 1 */

/* Q1: Who is the senior most employee based on job title? */

select * from employee order by levels desc limit 1;


/* Q2: Which countries have the most Invoices? */

select billing_country, count(*) as c from invoice
group by billing_country order by c desc;

/* Q3: What are top 3 values of total invoice? */
select invoice_id, total from invoice
order by total desc limit 3;

/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals */

select sum(total) as invoice_total, billing_city from invoice
group by billing_city order by invoice_total desc limit 1;

/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/

SELECT customer.customer_id, min(first_name) as first_name, min(last_name) as last_name, SUM(total) AS total_spending
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total_spending DESC
LIMIT 1;

/* Question Set 2  */

/* Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners.
Return your list ordered alphabetically by email starting with A. */

SELECT DISTINCT email AS Email,first_name AS FirstName, last_name AS LastName, genre.name AS Name
FROM customer
JOIN invoice ON invoice.customer_id = customer.customer_id
JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
JOIN track ON track.track_id = invoice_line.track_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
ORDER BY email;


/* Q2: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */

select a.name, count(track.track_id) as total_track from artist as a
left join album on a.artist_id = album.album_id
join track on album.album_id = track.album_id
join genre on track.genre_id = genre.genre_id
where genre.name = "rock"
group by a.name
order by count(track_id) desc
limit 10;


/* Q3: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

select name, milliseconds
from track
where milliseconds > (select avg(milliseconds) from track)
order by milliseconds desc;

/* Question Set 3 */

/* Q1: Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent */

select min(customer.first_name) as FirstName, min(customer.last_name) as LastName, max(artist.name) as artist_name, sum(invoice.total) as total_spend
from customer
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
join track on invoice_line.track_id = track.track_id
join album on track.album_id = album.album_id
join artist on album.artist_id = artist.artist_id
group by customer.first_name, artist.name;


/* Q2: We want to find out the most popular music Genre for each country. We determine the most popular genre as the genre 
with the highest amount of purchases. Write a query that returns each country along with the top Genre. For countries where 
the maximum number of purchases is shared return all Genres. */

with my_table1 as  (SELECT customer.country, genre.name as genre, sum(invoice.total) as total, COUNT(invoice_line.quantity) AS purchases
FROM customer
JOIN invoice ON invoice.customer_id = customer.customer_id
JOIN invoice_line ON invoice_line.invoice_id = invoice.invoice_id
JOIN track ON track.track_id = invoice_line.track_id
JOIN genre ON genre.genre_id = track.genre_id
group by customer.country, genre.name
order by customer.country)
select max(purchases) as purchases , country, max(genre) as genre
from my_table1
group by country
having max(total)
order by country;


/* Q3: Write a query that determines the customer that has spent the most on music for each country. 
Write a query that returns the country along with the top customer and how much they spent. 
For countries where the top amount spent is shared, provide all customers who spent this amount. */

select customer.country, max(customer.first_name) as first_name, max(customer.last_name) as last_name, sum(invoice.total) as total_spending
from customer
join invoice on customer.customer_id = invoice.customer_id
group by customer.country
order by country