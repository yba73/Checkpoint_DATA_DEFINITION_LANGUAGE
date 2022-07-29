-- Checkpoint Data definition language (DDL)
-- In this checkpoint, we have the following relational model: https://i.imgur.com/aZeHhHe.png
-- and their corresponding data types tables: https://i.imgur.com/vx1xFvS.png

-- Objective
    -- You are asked to create the above given relational model using SQL language and 
    --------based on the different mentioned constraints.
    -- After creating tables, write SQL commands to:
    -- Add a column Category (VARCHAR2(20)) to the PRODUCT table. 
    -- Add a column OrderDate (DATE)  to the ORDERS table which have SYSDATE as a default value.


-- Create
    -- Customer
CREATE TABLE Customer (
	Customer_id NUMBER(20) CONSTRAINT CusID_pk PRIMARY KEY, 
	Customer_Name VARCHAR2(20) CONSTRAINT CusName_NotNull NOT NULL,
	Customer_Tel NUMBER 
);
    -- Product
CREATE TABLE Product (
	Product_id NUMBER(20) CONSTRAINT Product_pk PRIMARY KEY,  
	Product_Name VARCHAR2(20) CONSTRAINT ProductName_NotNull NOT NULL,
	Price NUMBER CHECK (Price>0)
);
    -- Orders
CREATE TABLE Orders (
	Customer_id NUMBER(20), 
	Product_id VARCHAR2(20), 
	Quantity NUMBER,
    total_amount NUMBER,
    CONSTRAINT Customer_id_fk FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id)
    CONSTRAINT Product_id_fk FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);
-- Add a column Category (VARCHAR2(20)) to the PRODUCT table. 
Alter TABLE Customer ADD Category VARCHAR2(20);

-- Add a column OrderDate (DATE)  to the ORDERS table which have SYSDATE as a default value.
Alter TABLE Orders ADD OrderDate DATE Default SYSDATE;
------------------------------------------------------











-- Add default sysdate to new rows only ==>

    -- -- You need to first add the column without a default:
    -- Alter TABLE Orders ADD OrderDate DATE DEFAULT NULL;
    -- -- and then add define the default value:
    -- Alter TABLE Orders MODIFY OrderDate DEFAULT SYSDATE;

