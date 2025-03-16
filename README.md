 # Real-Time Data Streaming using Apache Nifi, AWS, Snowpipe, Stream & task
 ## What is it ?
This project has been created to implement real-time data analysis for customer data in Snowflake, handling incremental data loads through Change Data Capture and Slowly Changing Dimensions.

## Why ?
Real time data analysis has an abundance of practical usecases. It is essential essential for businesses needing to make swift, informed decisions in dynamic environments. It enables immediate access to current information, allowing for rapid responses to market shifts and operational issues. customer experiences through personalized interactions and proactive problem-solving. 


## How does it work ?

<img width="1126" alt="image" src="https://github.com/user-attachments/assets/d6007227-113c-418b-86cd-834d95a7daba" />

Dummy data generated using faker, having naming convention: <table_name>_<currrent_timestamp>.csv is ingested to s3 buckets using Apache Nifi. The data is scheduled to ingested at an interval of 1 minute. If a new file is generated in the interval, then it will be ingested in the S3 bucket. Through snowpipe, a staging table, customer_raw is created on top of this file. Utilizing Snowflakre Task, procedures are crrated to load this data into the final target tables: customer and customer_history table. Task tsk_scd_customer loads the latest data into customer table employeing the SCD1 strategy, while task tsk_scd_customer_history tracks the changes in the customer table with the help of stream customer_table_changes created on top of the customer table. 




