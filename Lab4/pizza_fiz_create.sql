-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-11-17 19:22:28.251

-- tables
-- Table: DIM_Customers
CREATE TABLE DIM_Customers (
    cust_id int  NOT NULL,
    first_name varchar(255)  NOT NULL,
    last_name varchar(255)  NOT NULL,
    street varchar(255)  NOT NULL,
    city varchar(255)  NOT NULL,
    state varchar(255)  NOT NULL,
    country varchar(255)  NOT NULL,
    phone int  NOT NULL,
    email int  NOT NULL,
    CONSTRAINT DIM_Customers_pk PRIMARY KEY  (cust_id)
);

-- Table: DIM_Date
CREATE TABLE DIM_Date (
    date_id int  NOT NULL,
    year int  NOT NULL,
    month int  NOT NULL,
    week_nr int  NOT NULL,
    quarter int  NOT NULL,
    CONSTRAINT DIM_Date_pk PRIMARY KEY  (date_id)
);

-- Table: DIM_PizzaTypes
CREATE TABLE DIM_PizzaTypes (
    pizza_id int  NOT NULL,
    name varchar(255)  NOT NULL,
    category varchar(255)  NOT NULL,
    ingredients varchar(255)  NOT NULL,
    CONSTRAINT DIM_PizzaTypes_pk PRIMARY KEY  (pizza_id)
);

-- Table: FACTS_SALES
CREATE TABLE FACTS_SALES (
    sale_id int  NOT NULL,
    transact_timestamp int  NOT NULL,
    order_amt int  NOT NULL,
    DIM_Customers_cust_id int  NOT NULL,
    DIM_PizzaTypes_pizza_id int  NOT NULL,
    DIM_Date_date_id int  NOT NULL,
    CONSTRAINT FACTS_SALES_pk PRIMARY KEY  (sale_id)
);

-- foreign keys
-- Reference: FACTS_SALES_DIM_Customers (table: FACTS_SALES)
ALTER TABLE FACTS_SALES ADD CONSTRAINT FACTS_SALES_DIM_Customers
    FOREIGN KEY (DIM_Customers_cust_id)
    REFERENCES DIM_Customers (cust_id);

-- Reference: FACTS_SALES_DIM_Date (table: FACTS_SALES)
ALTER TABLE FACTS_SALES ADD CONSTRAINT FACTS_SALES_DIM_Date
    FOREIGN KEY (DIM_Date_date_id)
    REFERENCES DIM_Date (date_id);

-- Reference: FACTS_SALES_DIM_PizzaTypes (table: FACTS_SALES)
ALTER TABLE FACTS_SALES ADD CONSTRAINT FACTS_SALES_DIM_PizzaTypes
    FOREIGN KEY (DIM_PizzaTypes_pizza_id)
    REFERENCES DIM_PizzaTypes (pizza_id);

-- sequences
-- Sequence: DIM_Customers_seq
CREATE SEQUENCE DIM_Customers_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DIM_Date_seq
CREATE SEQUENCE DIM_Date_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DIM_PizzaTypes_seq
CREATE SEQUENCE DIM_PizzaTypes_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: FACTS_SALES_seq
CREATE SEQUENCE FACTS_SALES_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

