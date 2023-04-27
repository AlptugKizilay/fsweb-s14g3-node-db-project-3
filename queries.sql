-- Multi-Table Sorgu Pratiği

-- Tüm ürünler(product) için veritabanındaki ProductName ve CategoryName'i listeleyin. (77 kayıt göstermeli)
select p.ProductName, c.CategoryName from Product as p
join Category as c on c.Id = p.CategoryId

-- 9 Ağustos 2012 öncesi verilmiş tüm siparişleri(order) için sipariş id'si (Id) ve gönderici şirket adını(CompanyName)'i listeleyin. (429 kayıt göstermeli)
select o.Id, c.CompanyName from [Order] as o
join Customer as c on c.Id=o.CustomerId
where o.OrderDate< '2012-08-09'

-- Id'si 10251 olan siparişte verilen tüm ürünlerin(product) sayısını ve adını listeleyin. ProdcutName'e göre sıralayın. (3 kayıt göstermeli)
select p.ProductName, Count(ord.ProductId) as 'NumberOfProduct' from OrderDetail as ord
left join Product as p on p.Id = ord.ProductId
where ord.OrderId = 10251
group by ord.ProductId

-- Her sipariş için OrderId, Müşteri'nin adını(Company Name) ve çalışanın soyadını(employee's LastName). Her sütun başlığı doğru bir şekilde isimlendirilmeli. (16.789 kayıt göstermeli)
select o.Id as 'OrderID',c.CompanyName,e.LastName from [Order] as o
join Customer as c on c.Id = o.CustomerId
join Employee as e on e.Id = o.EmployeeId

---------------------------------------------------------

--1
SELECT s.ShipperName,od.OrderID,od.Quantity FROM [Orders] as o
join Shippers as s on s.ShipperID = o.ShipperID
join OrderDetails as od on od.OrderID= o.OrderID
group by s.ShipperName
--2
SELECT e.FirstName || " " || e.LastName as 'Name Surname', count(*) FROM [Orders] as o
join Employees as e on e.EmployeeID=o.EmployeeID
group by e.FirstName || " " || e.LastName
order by count(*) desc
limit(5)
--3
SELECT e.FirstName, e.LastName, sum(od.Quantity * p.Price) as 'Sum Price' FROM [OrderDetails] as od
join Products as p on p.ProductID=od.ProductID
join Orders as o on o.OrderID=od.OrderID
join Employees as e on e.EmployeeID=o.EmployeeID
group by e.FirstName, e.LastName
order by sum(od.Quantity * p.Price) desc
limit 5
--4
SELECT c.CategoryName, sum(od.Quantity * p.Price) as 'Sum Price' FROM [OrderDetails] as od
join Products as p on p.ProductID=od.ProductID
join Categories as c on c.CategoryID=p.CategoryID
group by c.CategoryName
order by sum(od.Quantity * p.Price)
limit 5
--5
SELECT c.Country, count(*) as 'Order Quantity' FROM [Orders] as o
join Customers as c on c.CustomerID=o.CustomerID
group by c.Country
order by count(*) desc
limit 1