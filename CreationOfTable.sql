
/* Creation of the Table 
Name :-  Vikas Dinesh Soni
AssignmemtSQL
Date :- 17-02-22
DataBase Name :- [VikasAssignment2]
Purpose :- Creation Of Tables
*/


--create table emp_department(
--DPT_CODE int primary key,
--DPT_NAME varchar(20),
--DPT_ALLOTMENT int
--);


--create table emp_details(
--EMP_IDNO int primary key,
--EMP_FNAME varchar(20),
--EMP_LNAME varchar(20),
--EMP_DEPT int foreign key references emp_department(DPT_CODE)
--);


--insert into emp_department values(57, 'IT',65000),(63, 'Finance', 15000), (47, 'HR', 240000), (27, 'RD', 55000), (89, 'QC', 75000);
--select * from emp_department


--insert into emp_details values(127323,'Michale', 'Robbin',57), (526689,'Carlos', 'Snares',63), (843795,'Enric', 'Dosio',57), (328717,'Jhon', 'Snares',63), (444527,'Joseph', 'Dosni',47), (659831,'Zanifer', 'Emily',47), (847674,'Kuleswar', 'Sitaraman',57), (748681, 'Henrey','Gabriel',47), (555935, 'Alex','Manuel',57),(539569, 'George', 'Mardy', 27), (733843, 'Mario', 'Saule', 63),(631548, 'Alan', 'Snappy', 27), (839139, 'Maria', 'Foster', 57);


--select * from emp_details;














--create table company_mast(
--COM_ID int primary key,
--COM_NAME varchar(20)
--);


--insert into company_mast values(11, 'Samsung'), (12, 'iBall'), (13, 'Epsion'), (14 ,'Zebronics'), (15, 'Asus'), (16, 'Frontech');

--select * from company_mast


--create table item_mast(
--PRO_ID int primary key,
--PRO_NAME varchar(20),
--PRO_PRICE int,
--PRO_COM int foreign key references company_mast(COM_ID)
--);

--insert into item_mast values(101, 'Mother Board',3200, 15), (102 , 'Key Board',450, 16), (103  , 'ZIP drive',250, 14), (104  , 'Speaker',550, 16), (105   , 'Monitor',5000, 11), (106, 'DVD drive',900, 12), (107, 'CD drive',800, 12),  (108, 'Printer',2600, 13), (109, 'Refill cartridge',350, 13), (110, 'Mouse',250, 12);

--select * from item_mast;


--create table salesman(
--salesman_id  int primary key,
--name varchar(30),
--city varchar(20), 
--commission float
--);


--insert into salesman values(5001,'James Hoog', 'New York', 0.15), (5002,'Nail Knite', 'Paris', 0.13), (5005,'Pit Alex', 'London', 0.11), (5006 ,'Mc Lyon', 'Paris', 0.14), (5007 ,'Paul Adam', 'Rome', 0.13), (5003,'Lauson Hen', 'San Jose', 0.12 );
--select * from salesman;

--create table customer(
--customer_id int primary key,
--cust_name varchar(30),
--city varchar(30),
--grade int,
--salesman_id int foreign key references salesman(salesman_id)
--);

--insert into customer values(3002, 'Nick Rimando',  'New York', 100, 5001), (3007, 'Brad Davis',  'New York', 200, 5001), (3005, 'Graham Zusi',  'California', 200, 5002), (3008, 'Julian Green',  'London', 300, 5002), (3004, 'Fabian Johnson',  'Paris', 300, 5006), (3009, 'Geoff Cameron',  'Berlin', 100, 5003), (3003, 'Jozy Altidor',  'Moscow', 200, 5007), (3001, 'Brad Guzan',  'London', null, 5005);

--select * from customer;


--create table orders(
--ord_no int primary key,
--purch_amt float,
--ord_date  date,
--customer_id int foreign key references customer(customer_id),
--salesman_id int foreign key references salesman(salesman_id)
--);

--insert into orders values(70001, 150.5, '2012-10-05', 3005, 5002), (70009, 270.65, '2012-09-10', 3001, 5005), (70002, 65.26, '2012-10-05', 3002, 5001), (70004, 110.5, '2012-08-17', 3009, 5003), (70007, 948.5, '2012-09-10', 3005, 5002), (70005, 2400.6, '2012-07-27', 3007, 5001), (70008, 5760, '2012-09-10', 3002, 5001), (70010, 1983.43, '2012-10-10', 3004, 5006), (70003, 2480.4, '2012-10-10', 3009, 5003), (70012, 250.45, '2012-06-27', 3008, 5002), (70011, 75.29, '2012-08-17', 3003, 5007), (70013, 3045.6, '2012-04-25', 3002, 5001);

--select * from orders;