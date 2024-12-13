use shoping_trends;

SELECT * FROM market_trends;

# 1. Q: What is the most frequently purchased item category?

SELECT category,sum(`purchase amount in INR`) as total_purchase
FROM market_trends
group by category
order by total_purchase desc
limit 1;

ALTER TABLE market_trends
change `customer id`  customer_id int primary key; 

ALTER TABLE market_trends
change `item purchased`  item_name varchar(255) not null;

# 2. Q: What is the average purchase amount in USD ?

#ALTER TABLE market_trends
#change `purchase amount (USD)`  Purchase_amount_USD varchar(255) not null;

ALTER TABLE market_trends
change Purchase_amount_USD  Purchase_amount_USD INT  not null;

SELECT avg(purchase_amount_usd) as avg_purchase_in_usd FROM market_trends;
# output:  average purchase amount in USD is 59.7644

# 3. Q: Which age group has the highest frequency of purchases?
SELECT * FROM market_trends;

ALTER TABLE market_trends
change agr_group age_group varchar (255) not null; 

SELECT age_group,count(purchase_amount_usd) as highest_frequency_of_purchases
FROM market_trends
GROUP BY age_group
order by  highest_frequency_of_purchases desc;
# Output: highest frequency of purchases is Middle-aged adults

#4. Q: How many customers prefer "Free Shipping"?
SELECT `shipping type`, count(customer_id) as total_customers
FROM market_trends
where `shipping type`="Free Shipping"
group by `shipping type`
;
        #or
SELECT count(*) FROM market_trends
where `shipping type`="Free Shipping";
# output: 675 customers prefer "Free Shipping

# 5. Q: Which payment method is most commonly used?
SELECT * FROM market_trends;

SELECT `payment method`, count(customer_id) as total_payment
 FROM market_trends
 group by  `payment method`
 order by total_payment desc
 LIMIT 1;
 # output: payment method is most commonly used Credit Card
 
 # 6. Q: What is the highest Purchase Amount in INR?
 
 SELECT  item_name ,sum(`purchase amount in inr`) as total_purchase
 FROM market_trends
 group by item_name
 order by  total_purchase desc
 limit 1;
 # output : highest Purchase Amount in INR is 883080.2999999999 for a Blouse 
 
 # 7. Q: Which season has the highest purchase activity?
 SELECT season ,sum(`purchase amount in inr`) as  total_purchase
 FROM market_trends
 group by season
 order by total_purchase desc
 limit 1;
 # output :Fall  season has the highest purchase activity is 5091326.93999999 in inr 
 
 #9. Q: Which customer gave the highest Review Rating?
 SELECT * FROM market_trends;
 
  SELECT location, `review rating` 
  FROM market_trends
  order by `review rating`  desc
  limit 1;
  # second method to solve this question
SELECT max(`review rating`) FROM market_trends;

# output :Kentucky customer gave the highest Review Rating is 5
   
#10. Q: Which customer has the most Previous Purchases?
SELECT customer_id,`previous purchases`
FROM market_trends
order by `previous purchases`desc
limit 1;
# output : 21 cusomer_id is  most Previous Purchases and value is 50




   
 
 
 
 
 
 
 
 