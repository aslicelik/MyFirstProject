select 5+6;
select getdate ();
select 'bilge adam besıktas';
print 'bilge adam';

--STRİNG FONKSIYONLAR

SELECT ASCII ('A') AS 'ASCII DEGERINI TESLIM EDER(SAYILSAL OLARAK)'
select char (65) as 'metinsel degerını teslım eder';

--not: SQL 'de ındex numarası 1'den başlar.
selecet charindex ( '@', 'murat.vuranok@bılgeadam.com') as 'karakterın ındex degerını teslım eder'; ---yanı @ burda nerde demek ısterız.

SELECT LEFT('Bilge adam',5) as'soldan karakter teslım al' --- soldan karakter teslım al tablo adı oldu.bılge adam 5 dedıgımız ıcın sadece 5 harfı alır ıecrık olarak.

SELECT LEFT(ProductName,3)
from Products
Where ProductID=1;


SELECT RIGHT('BILGE ADAM',4) AS 'SAGDAN KARAKTER TESLIM AL'; ---SAGDAN ITIBAREN 4 HARF AL.

SELECT LEN('BILGE ADAM BESIKTAS')AS 'TOPLAM METIN ICERISINDE YER ALAN KARAKTER SAYISI'

SELECT LTRIM ('              BILGE ADAM               ') AS 'SOLDAKİ BOSLUKLARI SILER' 
SELECT RTRIM ('              BILGE ADAM               ') AS 'SOLDAKİ BOSLUKLARI SILER' 
SELECT LEN (LTRIM ('         BILGE ADAM         ')) AS 'SOLDAKI BOSLUKLAR OLMADAN KARAKTER SILER'
SELECT LEN (RTRIM ('    BILGE ADAM               ')) AS 'SOLDAKI BOSLUKLAR OLMADAN KARAKTER SILER'

SELECT LEN (RTRIM (LTRIM('  BILGE ADAM          '))) AS 'SAGDAKI VE SOLDAKI BOSLUKLAR OLMADAN KARAKTER SAYISI';

---REPLACE

SELECT REPLACE ('BILGE ADAM', 'ADAM','HATUN') AS 'METIN DEGISIKLIGI'
SELECT ProductName FROM Products --- ürün ıcerısınde yer alan turkce ve yabancı karakterlerı temızleyınız

-- Gustaf's Knäckebröd => Gustaf's knackebrod  

select replace ( Replace(replace (  ProductName , 'ö','o'),'ä','a') ,'ß', 'b') as  ProductName from PRoducts;


select 'bılge Adam'
select reverse ('Bılge Adam')
Select REPLICATE ('senı cok sevıyorum kısının adı gelecek ', 1000)---
select 'bılge'+ SPACE (50) + 'ADAM' AS [BELIRTILERN ADET KADAR BOSLUK EKLE];

SELECT LOWER ('BILGE ADAM')  AS 'HEPSI KUCUK HARF';

-SELECT UPPER  ('bılge adam')  AS 'HEPSI KUCUK HARF';

---SUBSTRING --ALT METIN OLUSTURUR

select SUBSTRING ('bılge adam' ,1,5 ) as 'alt metın olustur'--ıstedıgınız sıradan baslayarak, ıstedıgınız kadar karakterı tesım eder.(max=> eleman sayısı)

--bırıncı parametreden verılen degerın ıcerısınden,
---ıkıncı  parametreden baslşayarark,
--3. cu parametrede verılen deger kadar elemanı teslım eder. 

--DECLARE 
--toplamda 11 tip verı var.sql de degısken tanımlamak ıcın declare kullanılır.degısken ısımlerı kesınlıkle ısaretı ıle @ baslar.


--TEKLI DEGISKEN TANIMLAMA YONTEMI
declare @isim nvarchar (50) --toplamda max 50 karakter tutan metınsel bır degısken tanımladdık.


--COKLU DEGISKEN TANIMLAMA YONTEMI

declare @isim nvarchar (50), @soyisim nvarchar (100) , @yas INT;


SELECT @isim= FirstName, @soyisim= LastName, @yas= year ( getdate ()) - year ( Birthdate)  FROM Employees where EmployeeID=1        

  --bu satırı tek calıstıramazsın tanımlamalar declare de yapıldı.hepsını calıstır

print ('kişinin adı : '+ @isim +char (13)+'kişinin soyadı :' +@soyisim + char (13) + 'kişinin yaşı: '+cast (@yas as nvarchar (4)));


print concat ('kişinin adı : '+ @isim +char (13)+'kişinin soyadı :' +@soyisim + char (13) + 'kişinin yaşı: ' , @yas);



---1.ÖDEV
--KULLANICININ MAIL ADRESINI KULLANARAK,O MAIL ADRESI ICERSINDE YER ALAN DATALARI ALINIZ .OR: 
--BİR DEGISKEN TANIMLAYARAK ASAGIDAKI FORMATTA BIR MAIL ADRESI GIRINIZ

--murat.vuranok@bilgeadam.com
--ali.vuranok@bilgeadam.com
--veli.vuranok@bilgeadam.com
---CEVAP
 DECLARE @isim nvarchar (100), @soyisim nvarchar (100), @domain nvarchar(100), @uzanti nvarchar (5), @mail nvarchar (100)=
 'murat.vuranok@bilgeadam.com' 


 --cıktı=>
---@isim=murat
---@soyisim=vuranok
---@domain=bilgeadam
---@uzanti=com

--2.ÖDEV
--GİRİLEN TELEFON NUMARASINI FORMATLAMA
--kullanıcı asagıdakı formatta telefon numarası verecek ( bir Değişkene tanımlayınız)
--02124567812
--+90 (212)456 78 12 => cıktı bu formatta olacak.

declare @d nvarchar (10), @e nvarchar (10) , @f nvarchar (10);

--set @d='A'   --set anahtar kelımesi sadece tek bır elemana esıtleme yapar.
--set @e='D'

select @d='D', @e='E', @f='F';  --selecet cokşu esıtlame yapar

print @d;
print @e;
print @f;

--JOIN ISLEMLERI

--1)INNER JOIN--kesısım kumesını getırır.


select * from Products where CategoryID is Null  ---kategorisi olmayan ürünlerin listesi

select ProductName, CategoryName  from Categories inner join Products
on Categories.CategoryID=Products.CategoryID
order by 2

--product tablosundan ProductID,ProductName,CategoryID
--categorıes tablosundan CategoryName, Description 


select ProductID, ProductName, Products.CategoryID, CategoryName, Description from Products inner join Categories
on Categories.CategoryID=Products.CategoryID
order by 2      ---burda eger dıagramda tablo ıkı tablo yapıp product ve category ılıskılendırmezsen yanlıs kayıt getırır yada getırmez hıc. önce tabloları ekle.


---eger joın ıslemlerınde, tekerrur eden alanlar var ise, mutlaka hangı tablodan geldıgını belırtmemız gerek.
---hangı sıparıs hangı calısan tarafından , hangı musterıye yapılmıs.
--order    => siparıs numarası , sipariş tarihi
--Employees => Adı, Soyadı
--Customers => Şirket adı, yetkılı kısı.



--select * from customers inner jon orders on Customers.CustomerID=Orders.CustomerID

select [ Sipariş No ] = O.OrderID,
        O.OrderDate as 'Sipariş Tarihi',
		Personel=E.FirstName+ '' +E.LastName ,
		C.CompanyName as [Şirket Adı],
		C.Contactname as  'Satın Alma Yetkili Personel '
		from Customers as C JOIN orders as O  on C.CustomerID=O.CustomerID
	JOIN  Employees AS  E on O.EmployeeID=E.EmployeeID;

		

--2.OUTER JOIN
--2.1 LEFT OUTER JOIN: sorguda katılan tablolardan soldakının tum kayıtları gelırken, sagdakı tablodan sadece ılıskılı olanlar gelır.

SELECT  CategoryName, ProductName 
FROM Categories as C Left outer JOIN Products as P on C.CategoryID=P.CategoryID;


---2.2 RİGHT OUTER JOIN: sorguda katılan tablolardan sagdakının  tum kayıtları gelırken, soldakı tablodan sadece ılıskılı olanlar gelır.

SELECT  CategoryName, ProductName 
FROM Categories as C right  outer JOIN Products as P on C.CategoryID=P.CategoryID;

--3. FULL JOIN: her ıkı tablodakı tum kayıtlar getırılır.Left ve Right outer joın'in birleşimidir.

select CategoryName, ProductName FROM categories as C FULL  JOIN Products AS P ON C.CategoryID= P.CategoryID;


 --4.CROSS JOIN : BIr tablodakı kaydın dıger tablodakı tum kayıtlşarla eslestırılmesını saglar

 select CategoryName, ProductName FROM categories  CROSS  JOIN Products

 --AGGREGATE fONKSIYI-ONLAR= ( TOPLAN FONK.GRUPLAMALI FONK)
 --COUNT (SUTUN ADI| *) : BIR TABLODAKI KAYIT SAYININI OGRENMEK ICIN.
 --BIR TABLODAKI TOPLAM KAYIT SAYISINI OGRENEBILIRIZ.

 select COUNT (*) as 'Personel Sayısı'
 from Employees; -- toplam 9 kayıt lıstelenır.

 Select COUNT (Region)
 from Employees; --toplamda 5 kayıt.
 --regıon sutunundakı kayıt sayısı.


 select count (city) as adet from Employees    : burda aynı kayıtları da sayar ve toplam 9 kayıt getırır

  select count ( Distinct city) as adet from Employees :  5 kayıt verırı.aynıları saymaz.

  --SUM (sÜTUN ADI ): bir sutundakı degerlerın matematıksel olarak toplamını verır.metınselde calısmaz sayısal degerlerde calısır.

  select sum (EmployeeID) as toplam from Employees


  --1. çalısanların yaslarının toplamını bulunuz.


  select  sum(year(getdate()) -  year (Birthdate))  as toplam  from Employees;

  select sum (Datediff (year,Birthdate, Getdate ())) as toplam from Employees

  ---AVG ORTALAMAYI VERIR.--sadeece sayısal sutunlarda kullanılır.


  select avg (EmployeeID) from Employees;

 --Calısanların yaslarının toplamı
 
  select avg (Datediff (year,Birthdate, Getdate ())) as toplam from Employees
  

--MAX (SUTUN ADI) : BIR SUTUNDAKI EN KUCUK DEGERI VERIR.

SELECT MAX (EmployeeID)
from Employees

--MIN (sÜTUN aDI): Bir sutundakı en kucuk dgereı verırı

select min  (EmployeeID)
from Employees


select min (EmployeeID)
from Employees;

Select Min ( Firstname)
from Employees;

--JOIN ODEV
--
-- Bir siparişin hangi çalışan tarafından hangi müşteriye hangi kategorideki üründen hangi fiyattan kaç adet satıldığını listeleyiniz.
-- Çalışanın adı, soyadı, ünvanı, görevi, işe başlama tarihi
-- Müşterinin firma adını, temsilcisini ve telefonunu
-- Ürünün adını, stok miktarını, birim fiyatını
-- Siparişin adetini ve satış fiyatını
-- Kategori adını

-- Orders, Order_Details, Customers,Categories,Products, Employees


CREATE VIEW satisraporlari
AS


SELECT        dbo.Employees.TitleOfCourtesy, dbo.Products.UnitPrice, dbo.Products.ProductName, dbo.Products.UnitsInStock, dbo.Categories.CategoryName, dbo.Customers.ContactTitle, dbo.[Order Details].UnitPrice AS Expr1, 
                         dbo.[Order Details].Quantity, dbo.Employees.LastName, dbo.Employees.FirstName, dbo.Employees.Title, dbo.Employees.HireDate, dbo.Customers.ContactName, dbo.Customers.CompanyName, dbo.Customers.Phone
FROM            dbo.Employees INNER JOIN
                         dbo.Orders INNER JOIN
                         dbo.Customers ON dbo.Orders.CustomerID = dbo.Customers.CustomerID ON dbo.Employees.EmployeeID = dbo.Orders.EmployeeID INNER JOIN
                         dbo.[Order Details] ON dbo.Orders.OrderID = dbo.[Order Details].OrderID INNER JOIN
                         dbo.Products INNER JOIN
                         dbo.Categories ON dbo.Products.CategoryID = dbo.Categories.CategoryID ON dbo.[Order Details].ProductID = dbo.Products.ProductID

	select from *satisraporlari	
	----sen tabloyu yap sonra tablonun altındakı kodları al buraya kopyala. calıstır. 
	---ust satıra viev yaz ve bu sekılde de calıstır . soldaki views da refresh yap. buraya kodu atmıs oluruz.
--- artık  kısa yolla calıstırırız.



select *
from KategoriListesi;

--ALTER => DUZENLEME
--CREATE => OLUSTURMA once create et execute yap , view a gel refresh yap.kategorı lıstesı views ın altında çıkar.sonra buraya gel alter view yap yaz calıstır 

create VIEW KategoriListesi
as
select CategoryID, Description
from Categories;


---View üzerinden tüm CRUD işlemlerini yapabiliriz.  ** view raporlamalarda kullanılır.sanal sorgular olustrurur
--NOT  : View içerisinde yer alan tablonun kuralları gecerlıdır.



alter VIEW KategoriListesi
as
select CategoryID, Description
from Categories;



delete from KategoriListesi where CategoryID >8 


select *from KategoriListesi
insert into KategoriListesi (Description) values ('Açıklama Alanı')

alter view KategoriListresi;
as select 
CategoryID, CategoryName, Description from Categories

---view içerisinde insert calısacaktır.toplamda verılecek olan parametre sayımız
insert into KategoriListesi  values ('Kategori Adı', 'Açıklama')

--aşağıdaki sorgu calısmayacaktor.Picture alanı yüzünden .picturelara bişey eklemedım cunku.


insert into KategoriListesi  values ('Kategori Adı', 'Açıklama')


CREATE VIEW OgrenciListesi
as 
select FirstName, LastName, Title,City
from Employees;                                    ---- execute et.sonra 314 dekını yaz execute .

select * from OgrenciListesi

insert into OgrenciListesi value ('murat','vuranok','Kaldırım Mühendisi','Ankara')    ---kısıye gore yetkılendırme yapmak                                                                                 ıstıyorum.Murat bunu gorsun bunu goremesın  
----alttakı gıbı yaparsan kısı bazlı yetkılendırme olur.

alter VIEW OgrenciListesi
as 
select FirstName, LastName, Title,City
from Employees              where City ='Ankara'

select * from OgrenciListesi


insert into OgrenciListesi value ('murat','sahın','Kaldırım Mühendisi','Ankara')


alter VIEW OgrenciListesi
as 
select FirstName, LastName, Title,City
from Employees              where City ='Ankara'
with check option 

--alter view sureklı calıstırma.bır kere calıstırdıktan sonra ınsert ı tek calıstırman gerek
insert into OgrenciListesi values ('murat','sahın','Kaldırım Mühendisi','Ankara')



---ENCYRPTİON=> VİEW I SIFRELEME


alter VIEW OgrenciListesi
with encryption
as 
select FirstName, LastName, Title,City
from Employees              where City ='Ankara'
with check option ;


--şifreyı acmak ıcın ; 

alter VIEW OgrenciListesi
as 
select FirstName, LastName, Title,City
from Employees              where City ='Ankara'
with check option ;


--CASE --WHEN --THEN KULLANIMI

select FirstName as Adı, LastName as Soyadı, 'Nezaket Ünvanı'= TitleOfCourtesy,BirthDate from Employees
-- bu sekılde fırstame adı oldu vs vs.

select FirstName as Adı,
LastName as Soyadı,
Title as Görev, 
(case (country)
when 'UK' then 'İngiltere Birleşik Krallığı'
when 'USA' then 'Amerika Birleşik Devletleri'
--else 'belirtılmedı'
else Country -- o ulkenın db deki adını 
end ) as 'Country'
from Employees

update Employees set Country ='FR' where EmployeeID=1           ---usttekını calıstır.bunu ekle tek cvalıstır tabloya                                                             eklenmıs olur.sonra hepsını calıstır ustte FR cıkar.


--personelin ID değeri 5' ten buyukse buyuktur, 5' ten kucukse kucuktur.aksi durumda eşittir.

select EmployeeID, FirstName,
LastName, Title,
(case  
when EmployeeID>5  then  '5'' ten buyuktur'
when  EmployeeID<5  then '5'' ten kucuktur'
else '5 ''e eşittir'
end) as statu
from Employees

---GROUP BY KULLANIMI--ELINIZDEKI DEGERLERI BELIRLI BI ANAHTARA GORE GRUPLAMA
---çalısanların ulkelerıne gore gruplanması

select Country,count (*) as adet  from Employees group by Country;  --count sayısını verır.baslıgı adet olarak degıstırdık.

--Çalısanların yapmıs oldugu siparıs adetı

select EmployeeID, count (*) as adet from Orders group by EmployeeID


select  (FirstName +''+E.LastName) as Personel, COUNT (*) as adet from Orders O JOIN Employees as E ON E.EmployeeID=O.EmployeeID group by (FirstName +''+E.LastName) order by 

--urun bedelı 35$ dan az olan urunlerın kategorılerıne gore gruplanması

select  CategoryID, count(*) as adet   from Products where UnitPrice<35 
and CategoryID IS NOT NULL group by CategoryID order by adet;


--Baş harfı A-K aralıgında olan ve stok mıktarı 5 ile 50 arasında olan urunlerı kategorılerıne (Kategorı Adı) gore gruplayınız.

select CategoryID,count (*) as adet from  Products
 where ProductName like '[A-K]%' and UnitsInStock between 5 and 50 
 group by CategoryID order by 2;

 select  CategoryName, COUNT(*) as adet  from Products P JOIN Categories C
 on P.CategoryID=C.CategoryID 



 ---her bir siparişteki toplam ürün sayısını bulunuz. order details
select OrderID, Sum (Quantity) as Urunsayisi  from [Order Details] group by OrderID
--ÖDEVLER

--Toplam tutarı 2500 ıle 3500 arasında olan siparişlerin gruplanması

select  OrderID, cast(SUM(Quantity * Unitprice *(1-Discount))  as decimal (15,3))  as toplam 
 from  [Order Details] 
 --WHERE SUM (Quantity * Unitprice *(1-Discount)) BETWEEN 2500 AND 3500
  GROUP BY OrderID 
 HAVING SUM ( Quantity * Unitprice * (1-Discount)) BETWEEN 2500 AND 3500 
 ORDER BY 2;



-- her bır sıparıstekı toplam urun sayısı 200 den az olanlar

select  OrderID, SUM (Quantity) as adet  from [Order Details]
group by OrderID
HAVING SUM  (Quantity) <=200
order by 2;

--kategorılerıne gore toplam stok mıktarını bul

select CategoryName, SUM(UnitsInStock) as ToplamStokAdedi  
 from Categories  as C JOIN Products as P on C.CategoryID=P.CategoryID
group by CategoryName
order by 2;

select C.CategoryID, Description, SUM(UnitsInStock) as ToplamStokAdedi  
 from Categories  as C JOIN Products as P on C.CategoryID=P.CategoryID
group by   C.CategoryID, CategoryName, Description
order by 2;

--her bır calısan toplam ne kadarlık satıs yapmıstır

select CONCAT (E.FirstName ,' ', E.Lastname) as Personel , CAST (SUM (Quantity * Unitprice * (1-Discount)) 
AS DECIMAL (15,3)) AS [Toplam Yapılan Sipariş Tutarı]
 from Employees AS E JOIN Orders AS O ON E.EmployeeID=O.EmployeeID
 JOIN [Order Details] AS OD ON OD.OrderID=O.OrderID
 GROUP BY CONCAT (E.Firstname ,' ', E.Lastname)
 ORDER BY 2;


 --stored procedure (Saklı Yordamlar)



 create procedure Kategoriler_SP
 as select * from Categories           ---burdaki view gıbı ıslem gorur create proceude.sonra programmabılıty stored procedure içine Kategoriler_SP gelır refresh.sonra alttakı.


 execute Kategoriler_SP

 create proc UrunlerByCategory
 as
 select * from Products where CategoryID=1
 exec UrunlerByCategory

alter  proc UrunlerByCategory 
@Id int 
                                         
 as
 select * from Products where CategoryID=@Id
 exec UrunlerByCategory 5

 -- alter duzenleme dır

 --Adının ılk harfıne gore personellerı lısteleyen sp yazınız.--once basitce yaz.select* from empl. sonra ıcerısını yaz.ilk create ıle yap.baktın hata verıo duzenleme alter yaz create ın yerıne

 create proc PersonelByName
 @name nvarchar as 

select  FirstName,LastName,BirthDate from Employees where FirstName like @name +'%';    bu 1.


execute PersonelByName 'a';                                                             bu 2.



alter  proc PersonelByName
 @name nvarchar as 

select  FirstName,LastName,BirthDate from Employees where FirstName like @name +'%';   


execute PersonelByName 'a' ;

--Procedure üzerinde değişiklik yapmak için Create yerine alter anahtar kelımesını eklemek yeterlı.

--Customers tablosundaki tum alanlara ekleme yapan sp yazınız:

create proc MusteriEke_sp

 @CustomerID nchar (5),
 @companyName nvarchar (40),
 @ContactName nvarchar (30),
 @ContactTitle nvarchar (30),
 @Address nvarchar (60),
 @City nvarchar (15),
 @Region nvarchar (15),
@PostalCode nvarchar (10),
 @Country nvarchar (15),
 @Phone nvarchar (24),
@Fax nvarchar (24)
as
BEGIN
 insert into Customers
 values (

@CustomerID,@CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Country, @Phone,@Fax)

END;

--TUM ALANLARA EKLEM YAPCAMIZ ICIN CUSTOMERS YAZDIK. yoksa customers (CustomerId vs vs )
--values a da aynılarını gir.

alter proc MusteriEke_sp

 @CustomerID nchar (5),
 @companyName nvarchar (40)= null
 @ContactName nvarchar (30)= null,
 @ContactTitle nvarchar (30)= null,
 @Address nvarchar (60)= null,
 @City nvarchar (15)= null,
 @Region nvarchar (15)= null,
@PostalCode nvarchar (10)= null,
 @Country nvarchar (15)= null,
 @Phone nvarchar (24)= null,
@Fax nvarchar (24)= null
as
BEGIN
 insert into Customers
 values (
 (

@CustomerID,@CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Country, @Phone,@Fax)

END;

--exec MusteiEkle_sp 'BLGDC', 'BilgeAdam';

exec MusteriEke_sp @CustomerID='BLGDR', @companyName='Bilge Adam', @City='İstanbul';
select *
from Customers

-- KOD ılw DB olusturma

create database UsersDB

go
use UsersDB 
go
create table Users(
Id int primary key identity (1,1),
FirstName nvarchar (50) not null,
LastName nvarchar (50) not null,
Mail nvarchar (100) null,
Phone nvarchar (24) null ,
CreatedDate datetime default (getdate())
);
go
insert into Users (Firstname ,Lastname,Mail,Phone) values
('murat', 'vuranok','murat.vuranok@bilgeadam.com','+9021214587269'),
('murat', 'vuranok','murat.vuranok@bilgeadam.com','+9021214587269'),
('murat', 'vuranok','murat.vuranok@bilgeadam.com','+9021214587269'),
('murat', 'vuranok','murat.vuranok@bilgeadam.com','+9021214587269'),
('murat', 'vuranok','murat.vuranok@bilgeadam.com','+9021214587269'),
('murat', 'vuranok','murat.vuranok@bilgeadam.com','+9021214587269')

select* from Users


--ODEV
--Kullanicinin telefon numarasini alip formatlayan bir function
--if else kullanimini arastir,
 insert into Users (FirstName, LastName, Mail,Phone
 values('murat', 'vuranok','murat.vuranok@bilgeadam.com', dbo.PhoneFormat ('+9021214587269'))



 select * 
 from Products as P JOIN Categories as C on P.ProductID=C.CategoryID                                                 
                    JOIN Suppliers as S on S.SupplierID= P.SupplierID
					JOIN [OrderDetails] as OD on OD.ProductID=P.ProductID
					JOIN Orders AS O on O.OrderID=OD.OrderID
					JOIN Employees as E on E.EmployeeID=O.EmployeeID
					JOIN Customers As CM on CM.CustomerID=O.CustomerID
					JOIN Shippers As SP on SP.ShipperID=O.ShipVia;

--602 dekı ıkı tabloyu bagladık artık tek tablo oldu. sonra buna supplıersdakı supplıerıd eklemek ıcın devam joın ıle devam etmek lazım