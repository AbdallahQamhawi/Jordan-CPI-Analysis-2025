This folder contains the SQL scripts used to build and validate the CPI data warehouse in PostgreSQL.

Script execution order:
01 cpi.schema.sql  
Creates the CPI schema.

02 cpi.tables.sql  
Creates dimension and fact tables following a star schema design.

03 cpi.validation.sql  
Runs data quality and validation checks after loading.

All scripts were executed on PostgreSQL and align with the datasets generated in the Python notebooks.
