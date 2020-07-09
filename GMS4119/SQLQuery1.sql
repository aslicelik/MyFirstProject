use northwind
--tek satırlık yorum satırı

/*
coklu
yorum 
satırı
*/

--ctrl+k+c


--tabloları sorgulamak
--select sutun adları,* from tablo adı
--*yıldız anahtar kelımesı kullanılmaması gereken parametrelerden bırıdır.performansı olumusz etkıler.
--not: sorguları yazarken kucuk buyuk harfe dıkkat etmenıze gerek yok
--DLM=> data manıpulatıon language

select *from Employees
--employees tablosundan calısanlara aıt ad,soyad ve dogum tarıhı bılgılerını lısteleyelım

select FirstName, LastName, Title, TitleOfCourtesy  from Employees
--var olan tum kolonları sorguya dahıl etme
select [EmployeeID], [LastName], [FirstName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Extension], [Photo], [Notes], [ReportsTo], [PhotoPath]
from Employees
--tablo ısımlerının (sutun adları) degıstırılmesı

select FirstName as Adı, LastName as Soyadı, Title as Görevi from Employees

--2.yontem
select FirstName Adı, Lastname Soyadı, Title Görev, birthdate 'Dogum tarıhı' from Employees

--3.yontem
select Adı= FirstName, Soyadı= LastName, Görev=Title, 'dogum tarıhı' =BirthDate, [işe giriş tarihi]= HireDate  
from Employees
--tekil kayıtların listelenmesi

select City
from Employees--toplamda 9 kayıt lıstelenır

select distinct
        City 
from Employees --toplamda 5 adet kayıt lıstelenır.tekrar eden kayıtlar lıstelenmez

--DISTINCT => tekıllestırme ıslemı yapar.

--METINLERI BIRLESTIRMEK

select TitleOfCourtesy + ' ' + FirstName + ' ' + LastName from Employees    
select TitleOfCourtesy + 'aslı ' + FirstName + ' ' + LastName from Employees

select concat (TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) from Employees bunu yazdıgında no column name ıle cıkar
select  personel=concat (TitleOfCourtesy , ' ' , FirstName , ' ' , LastName) from Employees         bunu yazdıgında kolon adı personel cıkar
select TitleOfCourtesy + ' ' + FirstName + ' ' + LastName as personel from Employees                bunu yazdıgında kolon adı personel cıkar
--+ operatoru ıle metınlerı bırlestırıyoruz.'' ıle bosluk eklenır.

select *
from Categories

insert into Categories (CategoryName, Description)
 values( 'KAtegori Adı','Acıklama Alanı')
select *
from Categories
 bu sorgu calısmas
insert into Categories (Description) values ( 'ekleme sorgusu calısmayacak:), hata mesajını oku'); sorgu calısmaz. categorı name bos bırakma.

select *
from Shippers
insert into Shippers (CompanyName, Phone )
values ('MNG Kargo', '0503 555 22 22')

insert into Shippers values ('aras kargo', '(0555 145 12 13') bunu da yazarsan calıstırırken sadece 67-68 kolonu calıstırman gerek
insert into Shippers (Phone,CompanyName) values  ( '(0555 145 12 13', 'UPS Kargo ') ılk phone yazdıysan ılk verdıgın deger tel no olmalı
insert into Shippers values ( 'DHL Kargo' , '(0556 458 78 96' ) bunu sec yukardan 67-68 calıstır

--bilge adam sırketını musterıler (customers)tablosuna ekleyınız

select * from customers 
insert into Customers  (CompanyName, CustomerID) values ('Bılge Adam','BLGDM') buna kolonu tutup surukleme..
customerıd tipi nchar5 tır.cekemezsın bundan 

--2) update: bır tablodakı kayıtları guncellenmek ıcın kullanılır.dıkkat edılmesı gereken hangı kaydı guncelleyecegımızı acıktan belırtmek.
--aksı halde tum kayıtlar guncellenır

/*
update <tablo adı > set <sutun adı> = <sutun degerı> 
*/
--employees tablosunda olan kayıtlar calısanlar adında bır tablo olustur ve verılerı orya kopyalar.

select * into calısanlar from employees
select * from calısanlar
--set esıtlemek ıcın kullanılır
update calısanlar set LastName = 'vuranok'   bunu sec 91 calıstır.
---employee ıd 1 olanın soyadının guncellenmesı
--where kelımesı fıltrelemek ıcındır.where den sonra key= value seklınde kolon adı=degerı belırtılerek kayıt degıstırırılır.

update calısanlar 
set LastName='Şahın'
where EmployeeID=1;   bunu sec sonra 91 calıstır.

drop table calısanlar; -- calısanlar tablosunu db uzerınden kalıcı olarak sıler. 91 calıstır tekrar  gerı gelsın.

update calısanlar set LastName='Şahin' where TitleOfCourtesy = 'Ms'
--product tablosunu urunler adında yenı bır tabloya tasıyınız ve urunlere bırım fıyatı uzerınden %5 lık zam yapınız.

 select ProductID, ProductName, UnitPrice as OldPrice, UnitPrice as NewPrice 
 into Urunler 
 from Products
 select *from Urunler
  update Urunler 
  set NewPrice=NewPrice + (NewPrice *0.05)

  ---delete : tablo dakı kayıtları sıler aynı update gıbı dıkkaet edılmesı gerekır.cunku bırden fazla kayıt sıler .

  /* delete from <tablo _adı>
  
  */
  ---delete tablo ıcındekı verılerı 
  drop ise tablonun kendısını sıler

  select *
  from Urunler;

  delete from Urunler;

  select *from calısanlar
  delete from calısanlar  where TitleOfCourtesy= 'Mr.'
  delete from calısanlar  where EmployeeID=1;    --- calısanlardakı sadece mr ve ıd1 olanı sıler.

    delete from calısanlar 
	 where TitleOfCourtesy= 'Mr.' or TitleOfCourtesy='Dr.'  sec 126 çalıstır.ıkısını de sıler
  
  delete from calısanlar 
  where TitleOfCourtesy in ('Mr.','Dr.', 'Ms.'); sec 126 calıstır



   