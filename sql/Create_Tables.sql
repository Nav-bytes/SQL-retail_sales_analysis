-- SQL script to create tables for retail sales analysis 1) Fact table  2) Dimension table

-- Creating Database
 Create database retail_sales;
 use retail_sales;

-- Create Tables

-- 1) Fact table
Drop Table if exists Factsales;
Create Table Factsales
(
           transactions_id VARCHAR(20) PRIMARY KEY,
           sale_date DATE,
		   sale_time TIME,
           customer_id	VARCHAR(10),
           gender VARCHAR(10),
           age	INT,
           category VARCHAR(15),
		   quantity INT,
           price_per_unit FLOAT,
           cogs FLOAT,
           total_sale FLOAT
);


-- 2) Dimensions Table
Drop Table if exists DimCustomer;
CREATE TABLE DimCustomer (
    customer_id VARCHAR(10) PRIMARY KEY,
    gender VARCHAR(10),
    age INT
);
Drop Table if exists DimDate;
CREATE TABLE DimDate (
    date_id INT PRIMARY KEY,
    sale_date DATE,
    day INT,
    month INT,
    year INT,
    weekday VARCHAR(15)
);

Drop Table if exists DimProduct;
 CREATE TABLE DimProduct (
    product_id INT PRIMARY KEY,
    category VARCHAR(50),
    price_per_unit DECIMAL(10, 2)
);

Drop Table if exists DimTime;
CREATE TABLE DimTime (
    time_id INT PRIMARY KEY,
    sale_time TIME,
    time_of_day VARCHAR(15)
);
