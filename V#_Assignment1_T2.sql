use V#Assign
--Assignment Question 2
--Create table Product
create table Product
(
Id int primary key identity,
Name varchar(50),
UnitPrice int
)
--insert values
insert into Product values('TV',450),('Laptop',500),('Desktop',1000)
--select statement
select * from Product

--create table customer 
create table Customer
(
CustId int primary key identity,
CustName varchar(50)
)
--inserting records
insert into Customer values('Ashish'),('Ritesh'),('Jyoti'),('Archana'),('Satish')
--select
select * from Customer

--create table Order
Create table OrderTable
(
OrderId int primary key identity,
ProductId int,
CustomerId int,
Quantity int
)
--inserting records
insert  into OrderTable values(1,1,10),(1,2,15),(2,3,5),(3,2,1)
--select
select * from OrderTable

select * from Product
select * from Customer
Select * from OrderTable

/*1.Retrieve all customer names with product name and total price. 
		[Consider only those customers who has bought products]*/
select C.CustName as CustomerName,P.Name as ProductName,
			sum(O.Quantity * P.UnitPrice)as Total
from 
	Customer C 
join 
	OrderTable O on C.CustId = O.OrderId
join
	Product P on P.Id = O.OrderId
group by
	C.CustName,
	P.Name
order by
	C.CustName
/*CustomerName	ProductName	Total
		Ashish	TV			4500
		Jyoti	Desktop		5000
		Ritesh	Laptop		7500*/

--i want CustName,ProductName,unit price,Quantity,total
select C.CustName,P.Name,P.UnitPrice,O.Quantity,
		sum(O.Quantity * P.UnitPrice)as Total
from 
	Customer C 
join
	OrderTable O on C.CustId = O.OrderId
join
	Product P on P.Id = O.OrderId
group by
	C.CustName,P.Name,P.UnitPrice,O.Quantity
order by
	C.CustName
/*CustName	Name	UnitPrice	Quantity	Total
	Ashish	TV			450		10			4500
    Jyoti	Desktop		1000	5			5000
	Ritesh	Laptop		500		15			7500*/

select * from Product
Select * from OrderTable
select * from Customer


--A)a.	Write a query for below o/p :
/*Product_Name	TotalQuantitySale	TotalSalePrice
	TV				25					11250
	Laptop			5					2500
	Desktop			1					1000*/

--use left join product table & Ordertable,
--(sum total quantity),(sum product * Quantity)group by,order by

select P.Name as Product_Name,
	sum(O.Quantity)as TotalQuantitySale,
	sum(P.unitPrice * O.Quantity) as TotalSalePrice
from 
	Product P  left join OrderTable O 
	on P.Id = O.ProductId
group by 
	P.Name
order by
	P.Name desc


--2.Select all Customer Id and Name who has not yet bought any product.
--use 1-cutomer & product table full join,where p.id null

select C.CustId as Customer_Id,C.CustName as Customer_Name
from 
	Customer C full join Product P
	on C.CustId = P.Id
where P.Id  is null
/*Customer_Id	Customer_Name
		4			Archana
		5			Satish*/


select * from Product
Select * from OrderTable
select * from Customer

--3)Select all products Id and Name which are not yet sold a single product
select p.Id as ProductId, P.Name as Product_Name 
from 
	Product P full join OrderTable O
	on P.Id = O.OrderId
where O.ProductId is null
/*ProductId	Product_Name*/
--because,here sold all product

--4.Select all product names with their total quantity sold.
select P.Name as Product_Name,
		sum(O.Quantity)as TotalQuantity
from
	Product P join OrderTable O
	on P.Id = O.ProductId
Group by P.Name
order by P.Name desc
/*
Product_Name	TotalQuantity
	TV				25
	Laptop			5
	Desktop			1*/



