/* Answers for the question
Name :-  Vikas Dinesh Soni
Assignmemt SQL
Date :- 17-02-22
DataBase Name :- [VikasAssignment2]
Purpose :- Answers of All Question Queries.
*/


--1. Write a SQL statement to prepare a list with salesman name, customer name and their cities for the salesmen and customer who belongs to the same city

select salesman.name, customer.cust_name, salesman.city as common_city from salesman inner join customer on salesman.city = customer.city


--2. Write a SQL statement to make a list with order no, purchase amount, customer name and their cities for those orders which order amount between 500 and 2000
select orders.ord_no, orders.purch_amt, customer.cust_name from orders inner join customer on orders.customer_id  = customer.customer_id where orders.purch_amt between 500 and 2000

--3. Write a SQL statement to know which salesman are working for which customer.
select salesman.name as salesman_name, customer.cust_name from salesman inner join customer on salesman.salesman_id =  customer.salesman_id

--4. Write a SQL statement to find the list of customers who appointed a salesman for their jobs who gets a commission from the company is more than 12%

select customer.cust_name, salesman.name, salesman.commission from customer inner join salesman  on salesman.salesman_id = customer.salesman_id where salesman.commission > 0.12

--5. Write a SQL statement to find the list of customers who appointed a salesman for their jobs who does not live in the same city where their customer lives, and gets a commission is above 12%

select customer.cust_name, salesman.name, salesman.commission, customer.city, salesman.city from customer inner join salesman  on salesman.salesman_id = customer.salesman_id where salesman.commission > 0.12 and customer.city != salesman.city

--6. Write a SQL statement to find the details of a order i.e. order number, order date, amount of order, which customer gives the order and which salesman works for that customer and how much commission he gets for an order.

select orders.ord_no, orders.ord_date, orders.purch_amt, customer.cust_name, salesman.name as Salesman_name, salesman.commission from orders inner join customer on orders.customer_id  = customer.customer_id inner join salesman on customer.salesman_id = salesman.salesman_id 


----7. Write a SQL statement to make a join on the tables salesman, customer and orders in such a form that the same column of each table will appear once and only the relational rows will come.

select orders.* , salesman.name, salesman.city as Salesman_city, salesman.commission, customer.cust_name, customer.city as Customer_City, customer.grade from orders inner join customer on orders.customer_id = customer.customer_id inner join salesman on customer.salesman_id = salesman.salesman_id

--8. Write a SQL statement to make a list in ascending order for the customer who works either through a salesman or by own. 

select cust_name from customer as List_Of_Customer ORDER BY cust_name asc;

--9. Write a SQL statement to make a list in ascending order for the customer who holds a grade less than 300 and works either through a salesman or by own.
select customer_id , cust_name, grade, salesman_id from customer where grade < 300 

--10. Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to find that either any of the existing customers have placed no order or placed one or more orders.

select customer.cust_name, customer.city, orders.ord_no, orders.ord_date, orders.purch_amt as order_amount from orders left join customer on orders.customer_id  = customer.customer_id order by orders.ord_date asc;

--11. Write a SQL statement to make a report with customer name, city, order number, order date, order amount salesman name and commission to find that either any of the existing customers have placed no order or placed one or more orders by their salesman or by own. 

select customer.cust_name, customer.city, orders.ord_no, orders.ord_date, orders.purch_amt, salesman.name as Salesman_name, salesman.commission from orders left join customer on orders.salesman_id = customer.salesman_id left join salesman on customer.salesman_id =  salesman.salesman_id

--12. Write a SQL statement to make a list in ascending order for the salesmen who works either for one or more customer or not yet join under any of the customers.  

select salesman_id, name from salesman order by salesman_id asc;

--or 

select salesman.salesman_id, salesman.name from salesman inner join customer on customer.salesman_id =  salesman.salesman_id order by salesman_id asc


--13. Write a SQL statement to make a list for the salesmen who works either for one or more customer or not yet join under any of the customers who placed either one or more orders or no order to their supplier.

select salesman.salesman_id, salesman.name , customer.customer_id , customer.cust_name from customer full join salesman on customer.salesman_id =  salesman.salesman_id


--14. Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier. 
-- Discuss with sir 
select  distinct salesman.name  as salesman_name  from orders left join customer on customer.salesman_id = orders.salesman_id left join salesman  on orders.salesman_id  = salesman.salesman_id where orders.purch_amt > 2000 and grade is not null;

--15 . Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount for those customers from the existing list who placed one or more orders or which order(s) have been placed by the customer who is not on the list.
select customer.cust_name, customer.city, orders.ord_no, orders.ord_date, orders.purch_amt from orders full join customer on orders.customer_id =  customer.customer_id

--16 . Write a SQL statement to make a report with customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who is neither in the list not have a grade. 

select customer.cust_name, customer.city, orders.ord_no, orders.ord_date, orders.purch_amt  from orders full join customer on orders.customer_id =  customer.customer_id where customer.grade is not null;

--17 . Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa.

	select customer.cust_name, salesman.name as salesman_Name from customer cross join salesman

--18 . Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for that customer who belongs to a city.
	select customer.cust_name, salesman.name as salesman_Name from customer cross join salesman where customer.city is not null;

--19 . Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for those salesmen who belongs to a city and the customers who must have a grade. 
	select customer.cust_name, salesman.name as salesman_Name from customer cross join salesman where salesman.city is not null and customer.grade is not null;



--20 . Write a SQL statement to make a cartesian product between salesman and customer i.e. each salesman will appear for all customer and vice versa for those salesmen who must belong a city which is not the same as his customer and the customers should have an own grade. 

select customer.cust_name, salesman.name as salesman_Name from customer cross join salesman where salesman.city != customer.city and customer.grade is not null;




--21 . Write a SQL query to display all the data from the item_mast, including all the data for each item's producer company.
select item_mast.*, company_mast.COM_NAME  from item_mast inner join company_mast on item_mast.PRO_COM =  company_mast.COM_ID


--22 . Write a SQL query to display the item name, price, and company name of all the product

select item_mast.PRO_NAME as Item_name, item_mast.PRO_PRICE as Item_price, company_mast.COM_NAME from item_mast inner join company_mast on item_mast.PRO_COM =  company_mast.COM_ID 


--23 . Write a SQL query to display the average price of items of each company, showing the name of the company. 

select company_mast.COM_NAME,  avg(item_mast.PRO_PRICE) as average_price from item_mast  inner join company_mast on item_mast.PRO_COM = company_mast.COM_ID group by item_mast.PRO_COM, company_mast.COM_NAME


--24 . Write a SQL query to display the names of the company whose products have an average price larger than or equal to Rs. 350.

select company_mast.COM_NAME,  avg(item_mast.PRO_PRICE) as average_price from item_mast  inner join company_mast on item_mast.PRO_COM = company_mast.COM_ID group by item_mast.PRO_COM, company_mast.COM_NAME having avg(item_mast.PRO_PRICE) >= 300


--25 . Write a SQL query to display the name of each company along with the ID and price for their most expensive product
  
 select company_mast.COM_ID, company_mast.COM_NAME,  max(item_mast.PRO_PRICE) as MostExpensiveITEM from company_mast  inner join item_mast on item_mast.PRO_COM = company_mast.COM_ID group by item_mast.PRO_COM, company_mast.COM_NAME, company_mast.COM_ID

 --26 . Write a query in SQL to display all the data of employees including their department
 select emp_details.EMP_IDNO, emp_details.EMP_FNAME, emp_details.EMP_LNAME , emp_department.DPT_NAME from emp_details inner join emp_department ON   emp_details.EMP_DEPT = emp_department.DPT_CODE

--27 . Write a query in SQL to display the first name and last name of each employee, along with the name and sanction amount for their department.

select  emp_details.EMP_FNAME, emp_details.EMP_LNAME , emp_department.DPT_NAME, emp_department.DPT_ALLOTMENT from emp_details inner join emp_department ON   emp_details.EMP_DEPT = emp_department.DPT_CODE


--28 . Write a query in SQL to find the first name and last name of employees working for departments with a budget more than Rs. 50000. 

select  emp_details.EMP_FNAME, emp_details.EMP_LNAME  from emp_details inner join emp_department ON   emp_details.EMP_DEPT = emp_department.DPT_CODE where emp_department.DPT_ALLOTMENT > 50000


--29 . Write a query in SQL to find the names of departments where more than two employees are working.

select emp_department.DPT_NAME  from emp_details inner join emp_department on emp_department.DPT_CODE =  emp_details.EMP_DEPT  group by emp_details.EMP_DEPT , emp_department.DPT_NAME having COUNT(emp_details.EMP_DEPT) > 2




--30 . Write a query to display all the orders from the orders table issued by the salesman 'Paul Adam'

select orders.*, salesman.name from orders inner join salesman on orders.salesman_id = salesman.salesman_id where salesman.salesman_id = 5007




--31 . Write a query to display all the orders for the salesman who belongs to the city London.
select orders.*, salesman.name from orders inner join salesman on orders.salesman_id = salesman.salesman_id where salesman.city = 'London'



--32 . Write a query to find all the orders issued against the salesman who may works for customer whose id is 3007.
create function q32()
returns float
as
begin
declare @ans int
select @ans =  salesman_id from orders where customer_id = 3007
return @ans
end
select orders.* , salesman.name from orders inner join salesman on salesman.salesman_id  =  orders.salesman_id where salesman.salesman_id in (dbo.q32())




--33 . Write a query to display all the orders which values are greater than the average order value for 10th October 2012.

create function q33()
returns float
as
begin
declare @avg int
select @avg = avg(purch_amt) from orders group by ord_date having orders.ord_date= '2012-10-10'
return @avg
end

select orders.* from orders where orders.purch_amt > dbo.q33()




--34 . Write a query to find all orders attributed to a salesman in New york.

	select orders.* from orders inner join salesman on orders.salesman_id = salesman.salesman_id where salesman.city = 'New york'   




--35 . Write a query to count the customers with grades above New York's average
create function q35()
returns float
as
begin
declare @ans int
select @ans =  avg(grade) from customer where city = 'New York'
return @ans
end
select count(customer_id) from customer where grade > (dbo.q35()) 



--36 . Write a query to display all the customers with orders issued on date 17th August, 2012
select customer.cust_name from orders inner join customer on orders.customer_id =  customer.customer_id where orders.ord_date = '17 August 2012'





--37 . Write a query to find the name and numbers of all salesmen who had more than one customer. 
	select salesman.name, salesman.salesman_id from customer  join salesman on customer.salesman_id = salesman.salesman_id group by salesman.salesman_id, salesman.name having count(customer.salesman_id) > 1


--38 . Write a query to find all orders with order amounts which are above-average amounts for their customers.
select t.customer_id, purch_amt from orders 
inner join 
(

select  customer_id, avg(purch_amt) as amounts from orders group by orders.customer_id
) as t on t.customer_id =  orders.customer_id
where orders.purch_amt > t.amounts





--39 . Write a queries to find all orders with order amounts which are on or above-average amounts for their customers.  
select t.customer_id, purch_amt from orders 
inner join 
(

select  customer_id, avg(purch_amt) as amounts from orders group by orders.customer_id
) as t on t.customer_id =  orders.customer_id
where orders.purch_amt >= t.amounts

 -- or
create function q39()
returns table

return (select  customer_id, avg(purch_amt) as amounts from orders group by orders.customer_id)


select th.customer_id, purch_amt from orders inner join  dbo.q39() as th on th.customer_id =  orders.customer_id
where orders.purch_amt >= th.amounts



--40 . Write a query to find the sums of the amounts from the orders table, grouped by date, eliminating all those dates where the sum was not at least 1000.00 above the maximum order amount for that date.

create function q40()
returns float
as
begin
declare @abc float
select @abc = max(purch_amt) from orders group by ord_date
select @abc = @abc + 1000
return @abc
end

select ord_date, sum(purch_amt)  from orders group by ord_date having  sum(purch_amt) > dbo.q40()


--41 . Write a query to extract the data from the customer table if and only if one or more of the customers in the customer table are located in London. 
create function q41()
returns float
as
begin
declare @abc float
select @abc = count(customer_id) from customer where city= 'London'
return @abc
end

select * from customer where dbo.q41() != 0;




--42 . Write a query to find the salesmen who have multiple customers. 

select salesman.salesman_id , salesman.name from salesman inner join customer on customer.salesman_id  =  salesman.salesman_id group by salesman.salesman_id , salesman.name having count(customer.salesman_id) > 1



--43 . Write a query to find all the salesmen who worked for only one customer

select salesman.salesman_id , salesman.name from salesman inner join customer on customer.salesman_id  =  salesman.salesman_id group by salesman.salesman_id , salesman.name having count(customer.salesman_id) = 1


--44 . Write a query that extract the rows of all salesmen who have customers with more than one orders.

select salesman.salesman_id , salesman.name from salesman inner join orders on orders.salesman_id  =  salesman.salesman_id group by salesman.salesman_id , salesman.name having count(orders.customer_id) > 1


--45 . Write a query to find salesmen with all information who lives in the city where any of the customers lives. 
select distinct salesman.* , customer.cust_name from salesman inner join customer on salesman.city = customer.city
--or
select distinct salesman.* from salesman, customer where salesman.city = customer.city

--46 . Write a query to find all the salesmen for whom there are customers that follow them.
select distinct salesman.* from salesman, customer where customer.salesman_id is not null;

--47 . Write a query to display the salesmen which name are alphabetically lower than the name of the customers.

select distinct salesman.* from salesman , customer where len(salesman.name) < len(customer.cust_name)


--48 . Write a query to display the customers who have a greater gradation than any customer who belongs to the alphabetically lower than the city New York.
create or alter function q48()
returns float
as 
begin
declare @ans float
select @ans = customer.grade from customer where len(customer.city)  < len('New York')
return @ans
end

select distinct customer.* from customer
WHERE 
customer.grade  > = dbo.q48()

--49 . Write a query to display all the orders that had amounts that were greater than at least one of the orders on September 10th 2012. 
create or alter function q49()
returns float 
begin 
declare @ans float 
select @ans =  min(purch_amt) from orders group by  orders.ord_date having ord_date = '2012-09-10'
return @ans
end

select orders.* from orders where purch_amt > dbo.q49()



--50 . Write a query to find all orders with an amount smaller than any amount for a customer in London.


create or alter function q50()
returns float 
begin 
declare @ans float 

select @ans  = customer_id from customer where city  = 'LONDON'
select @ans  =  max(purch_amt) from orders where customer_id  = @ans
return @ans
end

select orders.* from orders where purch_amt < dbo.q50()


--51 . Write a query to display all orders with an amount smaller than any amount for a customer in London.

select orders.* from orders where purch_amt < dbo.q50()


--52 . Write a query to display only those customers whose grade are, in fact, higher than every customer in New York.
create or alter function q52()
returns float 
begin 
declare @ans float 
select @ans  =  max(grade) from customer where city = 'New York'
return @ans
end

select customer.* from orders inner join customer on orders.customer_id  =  customer.customer_id where customer.grade > dbo.q52()


--53 . Write a query to find only those customers whose grade are, higher than every customer to the city New York.
create or alter function q53()
returns float 
begin 
declare @ans float 
select @ans  =  max(grade) from customer where city = 'New York'
return @ans
end



select customer.* from orders inner join customer on orders.customer_id  =  customer.customer_id where customer.grade > dbo.q53()


--54 . Write a query to get all the information for those customers whose grade is not as the grade of customer who belongs to the city London


create or alter function q54()
returns float 
begin 
declare @ans float 
select @ans  =  max(grade) from customer where city = 'London'
return @ans
end

select distinct customer.*, customer.grade from orders inner join customer on orders.customer_id  =  customer.customer_id where customer.grade != dbo.q54()

--55 . Write a query to find all those customers whose grade are not as the grade, belongs to the city Paris.

create or alter function q55()
returns float 
begin 
declare @ans float 
select @ans  =  max(grade) from customer where city = 'Paris'
return @ans
end

select distinct customer.*, customer.grade from orders inner join customer on orders.customer_id  =  customer.customer_id where customer.grade != dbo.q55()

--56 . Write a query to find all those customers who hold a different grade than any customer of the city Dallas.

create or alter function q56()
returns float 
begin 
declare @ans float 
select @ans  =  max(grade) from customer where city = 'Dallas'
return @ans
end

select distinct customer.*, customer.grade from orders inner join customer on orders.customer_id  =  customer.customer_id where customer.grade not in( dbo.q55() )


--57 . Write a SQL query to find the average price of each manufacturer's products along with their name. 

select company_mast.COM_NAME, avg(pro_price) from item_mast inner join  company_mast on company_mast.COM_ID =  item_mast.PRO_COM group by company_mast.COM_NAME, COM_ID 


--58 . Write a SQL query to display the average price of the products which is more than or equal to 350 along with their names.
create or alter function f58()
returns table 
return(
select COM_ID, company_mast.COM_NAME, avg(pro_price) AS avg_price  from item_mast inner join  company_mast on company_mast.COM_ID =  item_mast.PRO_COM group by company_mast.COM_NAME, COM_ID  having avg(pro_price) >= 350 )



select item_mast.PRO_NAME, f6.*,  avg(pro_price)   from item_mast inner join  dbo.f58()as f6 on f6.COM_ID =  item_mast.PRO_COM group by f6.COM_NAME, COM_ID,item_mast.PRO_NAME, avg_price  having avg(pro_price) > 350




--59 . Write a SQL query to display the name of each company, price for their most expensive product along with their Name.

create function f59()
returns table 
return(
select COM_ID, company_mast.COM_NAME, max(pro_price) as maximum_price from item_mast inner join  company_mast on company_mast.COM_ID =  item_mast.PRO_COM group by company_mast.COM_NAME, COM_ID )


select item_mast.PRO_NAME, rt.*  from item_mast inner join dbo.f59() as rt on rt.COM_ID = item_mast.PRO_COM where item_mast.PRO_PRICE = rt.maximum_price

