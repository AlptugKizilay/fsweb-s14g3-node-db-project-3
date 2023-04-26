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
