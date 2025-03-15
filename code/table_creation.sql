-- Database and Schema Creation
create database if not exists scd_demo;
use database scd_demo;
create schema if not exists scd2;
use schema scd2;

-- Customer_raw table to store temporary data     
create or replace table customer_raw (
     customer_id number,
     first_name varchar,
     last_name varchar,
     email varchar,
     street varchar,
     city varchar,
     state varchar,
     country varchar);

-- customer table creation to store the latest data 
create or replace table customer (
     customer_id number,
     first_name varchar,
     last_name varchar,
     email varchar,
     street varchar,
     city varchar,
     state varchar,
     country varchar,
     update_timestamp timestamp_ntz default current_timestamp());

-- customer_history table creation to track historical changes
create or replace table customer_history (
     customer_id number,
     first_name varchar,
     last_name varchar,
     email varchar,
     street varchar,
     city varchar,
     state varchar,
     country varchar,
     start_time timestamp_ntz default current_timestamp(),
     end_time timestamp_ntz default current_timestamp(),
     is_current boolean
     );

-- stream creation on table customer to track changes
create or replace stream customer_table_changes on table customer;