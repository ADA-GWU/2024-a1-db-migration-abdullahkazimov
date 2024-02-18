# Database Migration and Rollback

This repository contains SQL scripts to initialize, migrate, and rollback changes to a PostgreSQL database involving tables named `STUDENTS` and `INTERESTS`. After every change, you will see the full list of entities in both tables.

## Prerequisites
- Git installed on your system. You can download it from here: https://git-scm.com/downloads
- PostgreSQL installed on your system. You can download it from here: https://www.postgresql.org/download/
- Make sure you have access to the PostgreSQL database where you want to apply the changes.

## Initial Setup

Clone the Repository:

```bash
git clone https://www.github.com/ADA-GWU/2024-a1-db-migration-abdullahkazimov
cd 2024-a1-db-migration-abdullahkazimov
```
   
## Initialization

Run the following command if no corresponding data exist in your database:

```bash
psql -d <your_database> -f init.sql
```

This script creates the initial structure of the STUDENTS and INTERESTS tables and inserts sample data:
```
 st_id | st_name |  st_last   
-------+---------+------------
     1 | Konul   | Gurbanova
     2 | Shahnur | Isgandarli
     3 | Natavan | Mammadova
(3 rows)

 student_id |  interest  
------------+------------
          1 | Tennis
          1 | Literature
          2 | Math
          2 | Tennis
          3 | Math
          3 | Music
          2 | Football
          1 | Chemistry
          3 | Chess
(9 rows)
```

## Migration
To apply the migration and modify the tables, run:

```bash
psql -d <your_database> -f migration.sql
```

This script renames columns, changes data types, and creates a new table to store aggregated interests:
```
 student_id | st_name |  st_last   
------------+---------+------------
          1 | Konul   | Gurbanova
          2 | Shahnur | Isgandarli
          3 | Natavan | Mammadova
(3 rows)

 student_id |           interests           
------------+-------------------------------
          1 | {Tennis,Literature,Chemistry}
          2 | {Math,Tennis,Football}
          3 | {Math,Music,Chess}
(3 rows)
```

## Rollback
If you need to revert the changes made by the migration, run:

```bash
psql -d <your_database> -f rollback.sql
```

This script reverts the schema modifications and restores the original structure:
```
 st_id | st_name |  st_last   
-------+---------+------------
     1 | Konul   | Gurbanova
     2 | Shahnur | Isgandarli
     3 | Natavan | Mammadova
(3 rows)

 student_id |  interest  
------------+------------
          1 | Tennis
          1 | Literature
          1 | Chemistry
          2 | Math
          2 | Tennis
          2 | Football
          3 | Math
          3 | Music
          3 | Chess
(9 rows)
```
