![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Lab | SQL - Lab 3.01

In this lab, you will be using the [Sakila](https://dev.mysql.com/doc/sakila/en/) database of movie rentals. You have been using this database for a couple labs already, but if you need to get the data again, refer to the official [installation link](https://dev.mysql.com/doc/sakila/en/sakila-installation.html).

The database is structured as follows:
![DB schema](https://education-team-2020.s3-eu-west-1.amazonaws.com/data-analytics/database-sakila-schema.png)

<br><br>

## Instructions

### Activity 1
1. Drop column `picture` from `staff`.
2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the `rental_date` column in the `rental` table.
   **Hint**: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need `customer_id` information as well. To get that you can use the following query:

```sql
select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
```

Use similar method to get `inventory_id`, `film_id`, and `staff_id`.

4. Delete non-active users, but first, create a _backup table_ `deleted_users` to store `customer_id`, `email`, and the `date` for the users that would be deleted. Follow these steps:

   - Check if there are any non-active users
   - Create a table _backup table_ as suggested
   - Insert the non active users in the table _backup table_
   - Delete the non active users from the table _customer_

### Activity 2
In this activity we are going to do some database maintenance. In the current database we only have information on movies for the year 2006. Now we have received the film catalog for 2020 as well. For this new data we will create another table and bulk insert all the data there. Code to create a new table has been provided below.

```sql
drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;
```

<br>

We have just one item for each film, and all will be placed in the new table. For 2020, the rental duration will be 3 days, with an offer price of `2.99€` and a replacement cost of `8.99€` (these are all fixed values for all movies for this year). The catalog is in a CSV file named **films_2020.csv** that can be found at `files_for_lab` folder.

##### Instructions

- Add the new films to the database.
- Update information on `rental_duration`, `rental_rate`, and `replacement_cost`.

##### Hint

- You might have to use the following commands to set bulk import option to `ON`:

```sql
show variables like 'local_infile';
set global local_infile = 1;
```

- If bulk import gives an unexpected error, you can also use the `data_import_wizard` to insert data into the new table.

### Activity 3
In this activity we will find the customers who were active in consecutive months of May and June. Follow the steps to complete the analysis.

- Create a table `rentals_may` to store the data from rental table with information for the month of May.
- Insert values in the table `rentals_may` using the table rental, filtering values only for the month of May.
- Create a table `rentals_june` to store the data from rental table with information for the month of June.
- Insert values in the table `rentals_june` using the table rental, filtering values only for the month of June.
- Check the number of rentals for each customer for May.
- Check the number of rentals for each customer for June.
- Create a Python connection with SQL database and retrieve the results of the last two queries (also mentioned below) as dataframes:

  - Check the number of rentals for each customer for May
  - Check the number of rentals for each customer for June

    **Hint**: You can store the results from the two queries in two separate dataframes.
    
### Activity 4
1. Use [dbdiagram.io](https://dbdiagram.io/home) or [draw.io](https://draw.io) to propose a new structure for the `Sakila` database.
2. Define primary keys and foreign keys for the new database.

![Sakila database](https://education-team-2020.s3-eu-west-1.amazonaws.com/data-analytics/3.4-lab-sakila-normalization.png)
