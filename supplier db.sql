use master

create database Supplier

use Supplier

--SupplierMaster
create table SupplierMaster
(
	SID			Integer				Primary Key,
	NAME		Varchar(40)			NOT NULL,
	CITY		Char(6)				NOT NULL,
	GRADE		Tinyint				NOT NULL check(GRADE > 0 and GRADE <= 4),
)

sp_help SupplierMaster      --get the schema of the table
sp_help PartMaster
sp_help SupplyDetails
select * from SupplierMaster   --read the table
select * from PartMaster
select * from SupplyDetails
--insert
insert into SupplierMaster values (10, 'Usman Khan', 'Delhi', 1)
insert into SupplierMaster values (20, 'Nitish K', 'Kandla', 2)
insert into SupplierMaster values (30, 'Shiva S', 'Mumbai', 2)
insert into SupplierMaster values (40, 'Sirmet', 'Pune', 3)
insert into SupplierMaster values (50, 'Srikanth', 'HYD', 4)
insert into SupplierMaster values (60, 'Stanley', 'Delhi', 1)

--PartMaster
create table PartMaster
(
	PID			TinyInt				Primary Key,
	NAME		Varchar(40)			NOT NULL,
	PRICE		Money				NOT NULL,
	CATEGORY	Tinyint				NOT NULL,
	QTYONHAND	Integer				NULL,
)

--insert
insert into PartMaster values (1, 'Lights', 1000, 1, 1200)
insert into PartMaster values (2, 'Batteries', 5600, 1, 500)
insert into PartMaster values (3, 'Engine', 67000, 2, 4000)
insert into PartMaster values (4, 'Tyres', 2400, 3, 5000)
insert into PartMaster values (5, 'Tubes', 700, 3, 7800)
insert into PartMaster values (6, 'Screws', 12, 2, 200)
insert into PartMaster values (7, 'Mirrors', 450, 2, 1200)

--SupplyDetails
create table SupplyDetails
(
	PID			TinyInt				NOT NULL Foreign Key references PartMaster(PID),
	SID			Integer				NOT NULL Foreign Key references SupplierMaster(SID),
	DOS			DateTime			NOT NULL,
	CITY		Varchar(40)			NOT NULL,
	QTYSUPPLIED Integer				NOT NULL
)

--insert
insert into SupplyDetails values (2, 30, '2019/5/21', 'Pune', 45)
insert into SupplyDetails values (3, 10, '2019/5/30', 'Mumbai', 25)
--.....


