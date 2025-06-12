use walmart_db;

show tables;

DROP TABLE walmart;

/******** DATA EXPLORATION ********/

select count(*) as no_of_records
from walmart;

select distinct payment_method 
from walmart;

select payment_method, count(*) as payment_method_count
from walmart
group by payment_method
order by payment_method_count desc;

select count(distinct Branch) as no_of_branches
from Walmart;

select max(quantity) as max_qty
from walmart;

select min(quantity) as min_qty
from walmart;


/******** BUSINESS PROBLEMS ********/

/** 1. Analyze Payment Methods and Sales
● Question: What are the different payment methods, and how many transactions and
items were sold with each method?
● Purpose: This helps understand customer preferences for payment methods, aiding in
payment optimization strategies. **/

select * from walmart limit 10;

select payment_method, round(sum(total),2) as total_sales
from walmart
group by payment_method;


/** 2. Identify the Highest-Rated Category in Each Branch
● Question: Which category received the highest average rating in each branch?
● Purpose: This allows Walmart to recognize and promote popular categories in specific
branches, enhancing customer satisfaction and branch-specific marketing. **/

select * from walmart limit 10;

with cte as (
select category, round(avg(rating),2) as avg_rating, dense_rank() over(order by avg(rating) desc) as rnk
from walmart
group by category
)

select category, avg_rating
from cte
where rnk = 1

/*--------------*/
select category, round(avg(rating),2) as avg_rating
from walmart
group by category
order by avg_rating desc
limit 1;


/** 3. Determine the Busiest Day for Each Branch
● Question: What is the busiest day of the week for each branch based on transaction
volume?
● Purpose: This insight helps **/

select * from walmart limit 10;

with cte as (
select branch, date, dense_rank() over(partition by date order by sum(total) desc) as rnk
from walmart
group by category
)

select branch, date, rnk
from cte
where rnk = 1


/** 4. Calculate Total Quantity Sold by Payment Method
● Question: How many items were sold through each payment method?
● Purpose: This helps Walmart track sales volume by payment type, providing insights
into customer purchasing habits. **/

select * from walmart limit 10;

select payment_method, sum(quantity) as total_quantity
from walmart
group by payment_method;


/** 5. Analyze Category Ratings by City
● Question: What are the average, minimum, and maximum ratings for each category in
each city?
● Purpose: This data can guide city-level promotions, allowing Walmart to address
regional preferences and improve customer experiences. **/

select * from walmart limit 10;

select distinct city, category, round(avg(rating),2) as avg_rating, max(rating) as max_rating, min(rating) as min_rating
from walmart
group by city, category
order by city, category


/** 6. Calculate Total Profit by Category
● Question: What is the total profit for each category, ranked from highest to lowest?
● Purpose: Identifying high-profit categories helps focus **/

select * from walmart limit 10;

select category, round(sum(quantity * unit_price * profit_margin),2) as total_profit
from walmart
group by category
order by total_profit desc;

select category, round(sum(quantity * unit_price),2) as total_sales
from walmart
group by category
order by total_sales desc;


/** 7. Determine the Most Common Payment Method per Branch
● Question: What is the most frequently used payment method in each branch?
● Purpose: This information aids in understanding branch-specific payment preferences, potentially allowing branches to streamline their payment processing systems. **/

select * from walmart limit 10;

with cte as (
select branch, payment_method, count(*) as pref_payment_method_count, dense_rank() over(partition by branch, payment_method order by count(*) desc) as rnk
from walmart
group by branch, payment_method
order by pref_payment_method_count desc
)

select branch, payment_method, pref_payment_method_count, rnk
from cte
where rnk = 1

/** 8. Analyze Sales Shifts Throughout the Day
● Question: How many transactions occur in each shift (Morning, Afternoon, Evening)
across branches?
● Purpose: This insight helps in managing staff shifts and stock replenishment schedules,
especially during high-sales periods. **/

select * from walmart limit 10;

select branch, 
	   case when TIME(time) between '06:00:00' and '11:59:59' then 'Morning'
			when TIME(time) between '12:00:00' and '17:59:59' then 'Afternoon'
            when TIME(time) between '18:00:00' and '23:59:59' then 'Evening'
		end as shift,
		count(*) as transaction_count
from walmart
group by branch, shift
order by branch, shift;


/** 9. Identify Branches with Highest Revenue Decline Year-Over-Year
● Question: Which branches experienced the largest decrease in revenue compared to
the previous year?
● Purpose: Detecting branches with declining revenue is crucial for understanding
possible local issues and creating strategies to boost sales or mitigate losses. **/

select * from walmart limit 10;

with yearly_revenue_cte as (
	select branch, YEAR(date) as year, round(sum(quantity*unit_price),2) as total_revenue
    from walmart
    group by branch, year
)

select c.branch,
	   c.total_revenue as current_year_revenue,
       p.total_revenue as previuos_year_revenue,
       round((c.total_revenue - p.total_revenue),2) as revenue_decline
from yearly_revenue_cte c
join yearly_revenue_cte p
on c.branch = p.branch
and c.year = p.year + 1
where c.total_revenue < p.total_revenue
order by revenue_decline desc;
