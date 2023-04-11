-- Kondi Rahul

--create database
CREATE DATABASE MVCMachineTask

--use database
USE MVCMachineTask

--create table
CREATE TABLE CATEGORY
(
	CategoryId INT IDENTITY(1,1) PRIMARY KEY,
	CategoryName VARCHAR(255)
)

--INSERT VALUES IN CATEGORY
INSERT INTO CATEGORY VALUES('Electronics'),('Beauty'),('Personal Care')
,('Home'),('Garden'),('Sports'),('Toys'),('Food')


--create table
CREATE TABLE PRODUCT
(
	ProductId INT IDENTITY(1,1) PRIMARY KEY,
	ProductName VARCHAR(255),
	CategoryId INT FOREIGN KEY REFERENCES Category(CategoryId)
)


--INSERT VALUES IN PRODUCT
INSERT INTO PRODUCT VALUES('Mobile',1);

--ProductId	ProductName			CategoryId	
--	1		Mobile				Electronics	
--	2		T-shirts			Clothing	
--	3		Nike Shoes			Footwaer	
--	4		Adidas Filpfloops	Footwaer
--	5		Bata Shoes			Footwaer
--	6		LG Fridge			Electronics	
--	7		Whilpool Fridge		Electronics	
--	8		Sony 4k TV			Electronics	
--	9		wireed Earphones	Electronics
--	10		Iphone				Electronics	
--	11		Snadeals			Footwaer	
--	12		cricket bat			Sports	
--	13		cricket ball		Sports	
--	14		Blue plain Shirts	Clothing	
--	15		Biscuit				Food	

--RETRIVE TABLE DATA
SELECT * FROM PRODUCT;
SELECT * FROM CATEGORY;


--PROCEDURES FOR CATEGORY
-- SPGETCATEGORY --
CREATE PROCEDURE SPGETCATEGORY
AS
BEGIN
SELECT * FROM CATEGORY
END

-- SPCATEGORYBYID --
CREATE PROCEDURE SPCATEGORYBYID
(
	@CategoryId INT
)
AS
BEGIN
SELECT * FROM CATEGORY WHERE CategoryId=@CategoryId;
END

-- SPADDCATEGORY --
CREATE PROCEDURE SPADDCATEGORY
(
	@CategoryName VARCHAR(255)
)
AS
BEGIN
INSERT INTO CATEGORY VALUES(@CategoryName);
END

-- SPEDITCATEGORY --
CREATE PROCEDURE SPEDITCATEGORY
(
	@CategoryId INT,
	@CategoryName VARCHAR(255)
)
AS
BEGIN
UPDATE CATEGORY SET CategoryName=@CategoryName WHERE CategoryId=@CategoryId;
END

-- SPDELETECATEGORY --
CREATE PROCEDURE SPDELETECATEGORY
(
	@CategoryId INT
)
AS
BEGIN
DELETE FROM CATEGORY WHERE CategoryId=@CategoryId;
END

--PROCEDURES FOR PRODUCT
-- SPJOINPRODUCTANDCATEGORY
CREATE PROCEDURE SPJOINPRODUCTANDCATEGORY
AS
BEGIN
SELECT P.ProductId,P.ProductName,C.CategoryId,C.CategoryName FROM PRODUCT AS P
INNER JOIN CATEGORY AS C ON P.CategoryId=C.CategoryId
END

EXEC SPJOINPRODUCTANDCATEGORY

-- SPGETPRODUCT --
CREATE PROCEDURE SPGETPRODUCT
AS
BEGIN
SELECT * FROM PRODUCT
END

-- SPPRODUCTBYID --
CREATE PROCEDURE SPPRODUCTBYID
(
	@ProductId INT
)
AS
BEGIN
SELECT * FROM PRODUCT WHERE ProductId=@ProductId;
END

-- SPADDPRODUCT --
CREATE PROCEDURE SPADDPRODUCT
(
	@ProductName VARCHAR(255),
	@CategoryId INT
)
AS
BEGIN
INSERT INTO PRODUCT VALUES(@ProductName,@CategoryId);
END

-- SPEDITPRODUCT --
CREATE PROCEDURE SPEDITPRODUCT
(
	@ProductId INT,
	@ProductName VARCHAR(255),
	@CategoryId INT
)
AS
BEGIN
UPDATE PRODUCT SET ProductName=@ProductName,CategoryId=@CategoryId WHERE ProductId=@ProductId;
END

-- SPDELETEPRODUCT --
CREATE PROCEDURE SPDELETEPRODUCT
(
	@ProductId INT
)
AS
BEGIN
DELETE FROM PRODUCT WHERE ProductId=@ProductId;
END

