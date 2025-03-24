 # Real-Time Data Streaming using Apache Nifi, AWS, Snowpipe, Stream & task
 ## What is it ?
This project has been created to implement real-time data analysis for customer data in Snowflake, handling incremental data loads through Change Data Capture and Slowly Changing Dimensions.

## Why ?
Real time data analysis has an abundance of practical usecases. It is essential essential for businesses needing to make swift, informed decisions in dynamic environments. It enables immediate access to current information, allowing for rapid responses to market shifts and operational issues. customer experiences through personalized interactions and proactive problem-solving. This project aims to implement a real time data ETL pipeline for customer data analysis


## How does it work ?

<img width="1126" alt="image" src="https://github.com/user-attachments/assets/d6007227-113c-418b-86cd-834d95a7daba" />

### Data Generation

Dummy data generated using faker, having naming convention: <table_name>_<currrent_timestamp>.csv

### Data Ingestion

Data generated is then ingested to s3 buckets using Apache Nifi. The data is scheduled to be ingested at an interval of 1 minute, a new file generated in this interval, will be ingested in the S3 bucket. Through snowpipe, a staging table, customer_raw is created on top of this file.

### Data Transformation and Data Load
Utilizing Snowflake Task, procedures are created to load this data into the final target tables:
- customer: Task tsk_scd_customer loads the latest data into customer table employing the SCD1 strategy,
- customer_history table: Task tsk_scd_customer_history tracks the changes in the customer table with the help of stream customer_table_changes created on top of the customer table.

## Conclusion
In conclusion, this project successfully implemented a real-time data ETL pipeline, demonstrating the efficacy of Snowflake and Apache Nifi, in handling incremental data loads and providing up-to-the-minute insights





