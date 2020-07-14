--sorguları fıltrelemek
where cumlecıgını kullanacagız.
--unvanı mr.olanların lıstelenmesı

select  TitleOfCourtesy, FirstName, LastName from employees where TitleOfCourtesy='Mr.'  --nvarchar olanları '' tek tırnaga al.

--EmployeeId değerı 5 ten buyuk olanların lıstelenmesı

select EmployeeID, FirstName, LastName from Employees where EmployeeID  > 5

--1960 yılında doganların lıstelenmesı

select  FirstName, LastName,Birthdate from Employees where year (Birthdate)=1960

--1950 ile 1961 yılları arasında doganları lıstele

select   FirstName, LastName, year (Birthdate) [year] from Employees
 where year (Birthdate)>=1950 and year (Birthdate)>= 1961

--between => aralık bıldrıme ıslemı
select FirstName, LastName, year (Birthdate) as 'year' from Employees 
where year (Birthdate) between 1950 and 1961

--ing de oturan bayanları adı,soyadı, mesleği unvanı,ulkesı ve dogum tarıhını lısteleynız. (Employees)


select FirstName, LastName, Title, TitleOfCourtesy, Country BirthDate from Employees
where country= 'UK' 
and (TitleOfCourtesy='Mrs.'
or TitleOfCourtesy='Ms.')   --bırden fazla sartımız varsa () olmalı.ıslem oncelıgı yanı.tum bayanlar gelır.

--unvanı mr olanlar veya yası 60 tan buyuk olanların lıstelenmesı

select TitleOfCourtesy, FirstName,LastName, year (getdate ()) -year (Birthdate) as age 
 from Employees
where year (getdate()) -year (Birthdate) >60 or TitleOfCourtesy ='Mr.';


--getdate () fonk. ıle guncel tarıh bılgısını verır.year() fonk. ıle bırlıkte o tarıhe aıt olan yıl bılgısını ogrenırız.whre ıle bırlıkte  kendı ısımlendırdıgımız sutunları kullanamayız.ör yukarıda yas olarak ısımlendırdıgımız sutun ısmını whe
WHREre ıle bırlıkte kullanamayız

--NULL VERILERI SORGULAMAK

SELECT region FROM Employees---9 kayıt, 5 dolu ,4 null(boş)

select Region from Employees where Region=null  ---calısmaz mesela.olmayan bısey esıtlenmez.

--null sorguları =,<,> vs gıbı terımlerle sorgulamayız. bujnun yerıne is noll yada is not null.
sorgulamak ıcın asagıya bak;

select FirstName, LastName, Region from Employees
where Region is null;  ---bolgesı belırtılmeyen personeller


select FirstName, LastName, Region from Employees
where Region is not null; --bolgesı belırtılen personeller

--SIRALAMA ISLEMLERI

select EmployeeID,FirstName, LastName, Title from Employees
where EmployeeID between 2 and 8
order by FirstName ASC;                  --ascending (artan sırada) fakırden zengıne :)

select FirstName,LastName, BirthDate from Employees
order by BirthDate   --- eger asc yı belırtmezsek default olarak bu sekılde sıralar.bu sorguda bırthdate sutubnuna gore artan sırada sıralama yaptık.

select  FirstName,LastName,BirthDate,HireDate from Employees
order by HireDate desc -- descendıng (azalan sırada) zengınden fakıre :)

select TitleOfCourtesy, FirstName,LastName,BirthDate from Employees
order by FirstName, BirthDate desc   --- ısımlerıne fırstname  gore sırala d.tarıhlerı buyukten kucuge olacak sekılde

select FirstName,      --1.kolon
LastName,              --2.kolon
BirthDate,             --3.kolon
HireDate,              --4.kolon
Title,                 --5.kolon
TitleOfCourtesy        --6.kolon
 from Employees
order by 4, 6 desc        --4 e gore kucukten buyuge  sırala.( yanı 4. kolona gore) 6 ya gore buyukten kucuge

--calısanları unvanlarına gore ve unvanları aynıysa yaslarına gore buyukten kucuge sırala.

select TitleOfCourtesy, FirstName,LastName, age= year ( getdate()) -year (Birthdate) from Employees
order by 1, age desc;

--BETWEEN -AND KULLANIMI
--aralık bıldırmek ıcın kullanacagız
--1952 ıle 1960 arasında doganların lıstelenmesı

--1.YOL

select FirstName,LastName,year (Birthdate ) as Birthdate  from Employees
where year (BirthDate) >=1952 and year (Birthdate) <=1960
order by 3

--2.YOL
select FirstName,LastName,year (Birthdate ) as Birthdate  from Employees
where year (BirthDate) between 1952 and 1960 
order by 3

--ALFABETIK OLARAK JANET ILE ROBERT ARASINDA OLANLARIN LISTELENMESI

--1.YOL

select FirstName, LastName  from Employees
where FirstName between  'Janet' and 'Robert' ORDER BY 1

--2.YOL
select FirstName, LastName  from Employees
where FirstName>= 'Janet'
 and 
 FirstName <='Robert' ORDER BY 1

 --İN KULLANIMI
 --unvanı mr veya dr olanların lıstelenmesı

 --1.YOL
 select TitleOfCourtesy, FirstName,LastName from Employees
  where TitleOfCourtesy= 'Mr.' 
  or TitleOfCourtesy= 'Ms.'
    or TitleOfCourtesy= 'Dr.'

---2.YOL
 select TitleOfCourtesy, FirstName,LastName from Employees
 where TitleOfCourtesy in ('Dr.', 'Mr.')

 --1950,1955 ve 1960 yıllarında doganların lıstelenmesı
 select FirstName,LastName, year (Birthdate ) from Employees
where year (Birthdate ) in ('1950','1955','1960')           ---1950 dogumlu cıkmayacak cunku kaayıtta yokmus.

 select FirstName,LastName, year (Birthdate ) as Birthyear from Employees
where year (Birthdate ) in ('1950','1955','1960')  
order by Birthyear                                    ---bu da dogum tarıhıne gore sıralar tek fark bu.order by 3 de olur.

--TOP KULLANIMI

select top 3  EmployeeID, FirstName,LastName from Employees;


select top 5 EmployeeID, FirstName,LastName,Birthdate from Employees
order by FirstName

--TOP ıfadesı bır sorguda en son calısan kısımdır.Yani öncelıkle sorgumuz calısır ve olusacak sonuc kumesının ılk 5 kaydı alınırı.

--Çalısanları yaslarına gore azalan sırada sıraladıktan sonra olusacak sonuc kumesının %25 lık kısmını lısteyelım.

select top 25 percent  FirstName, LastName, age=year ( getdate()) - year (Birthdate) from Employees --mantıgı 2020-1983 vs

order by age desc;

--LİKE KULLANIMI
--Adının Michael lıastelenmesı

--1.YOL
select FirstName, LastName from Employees where FirstName = 'Michael';

--2.YOL
select FirstName, LastName from Employees where FirstName like 'Michael';

--Adının ılk harfı A ıle baslayanlar
select FirstName, LastName from Employees where FirstName like 'A%'

--Soyadının son harfı N olanlar
select FirstName, LastName from Employees where LastName like '%N'

--Adının ılk harfı A veya L olanlar
--1.YOL
select FirstName, LastName from Employees where FirstName like 'A%'
or FirstName like 'L%'


select FirstName, LastName from Employees where FirstName like '[AL]%' 
order by 1

---öDEVLER
--1) Adının ıcerısınde R veya T harfı olanlar,
--2-Adının ilk harfı alfabetık olarak J ıle R aralıgında olanlar
--3- Adı su sekılde olanlar: tAmer, yAsemin, tAner ( A ıle E arasında tek bır karakter)
--4- Adının ıcerısınde A ıle E arasında 2 karakter olanlar
--5 Adının ılk ıkı harfı LA,LN,AA veya AN olanlar

--5)
select FirstName, LastName from Employees where FirstName like '[LA,LN,AA,AN]%'  
order by 1

select FirstName, LastName from Employees where FirstName like '[LA][AN]%' order by 1
--1 )
select FirstName, LastName from Employees where FirstName like  '%R%' or FirstName like '%T%'
select FirstName, LastName from Employees where FirstName like '[RT]%'
--2)   
select FirstName, LastName from Employees where FirstName like '[J-R]%'
--3)
select FirstName, LastName from Employees where FirstName like '%A_E%'
--4)
select FirstName, LastName from Employees where FirstName like '%A__E%'