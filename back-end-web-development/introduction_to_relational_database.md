# Introduction to Relational Database

## Learning checklist

* Concepts of Relational Database
* Database Modeling
* Common Brands
* SQL
* Installing PostgreSQL Database
* Lab: Sequelize

## Concepts of Relational Database

* Concepts
  * Table/Row/Column
  * Schema
    * Schema Migration
  * Primary Key, Foreign Key
  * View
  * Index
  * SQL Query
    * Selection
    * Join
  * Transactions
    * ACID property
  * Lock
* Object Relational Mapping \(ORM\) Libraries

## Database Modeling

### A sample database

Here is a sample database which models a DVD rental business. It's created by the author of [this postgres tutorial](http://www.postgresqltutorial.com/postgresql-sample-database/).

This kind of data base model is also called ER model or [Entity Relationship Model](https://en.wikipedia.org/wiki/Entity–relationship_model)

In this diagram, the funny annotations in the link follows [Crow Foot Notation](https://www.codeproject.com/Articles/878359/Data-modelling-using-ERD-with-Crow-Foot-Notation) to represent different types of relationships \(one-to-one, one-to-many, etc\) between the entities.

![image](../.gitbook/assets/dvd-rental-sample-database-diagram.png)

## Common SQL Server

* SQL Server
* Oracle
* MySQL
* [PostgreSQL](https://www.postgresql.org/)
* [SQLite](https://www.sqlite.org/index.html)

## SQL

Tutorials to learn SQL

* [SQL Tutorial](http://www.sqltutorial.org/)
* [A step-by-step tutorial to try SQL with SQLite](http://swcarpentry.github.io/sql-novice-survey/)
* [SQL Introductory Course](http://www.sqlcourse.com/)

Test your SQL knowledge

* [SQL Exercises](https://en.wikibooks.org/wiki/SQL_Exercises)

Reference for SQL Command

* [SQL Cheat Sheet](http://www.sqltutorial.org/sql-cheat-sheet/)
* [More Comprehensive Reference on SQL](https://goalkicker.com/SQLBook/)

## PostgreSQL Database

PostgreSQL is a powerful, open source object-relational database system with over 30 years of active development that has earned it a strong reputation for reliability, feature robustness, and performance.

### Installation

#### Installation On Mac

Remove previous versions of PostgreSQL(if installed previously)
```
brew uninstall --force postgresql

rm -rf /usr/local/var/postgres
```
Use this link and follow the 3 steps to install [Postgres.app](https://postgresapp.com/)

To connect directly from the command line, type `psql`

##### Install pgAdmin4(GUI client for Postgres) for Mac
* Click on this link [PGAdmin4](https://www.postgresql.org/ftp/pgadmin/pgadmin4/v3.4/macos/)
* Download the file `pgadmin4-3-4.dmg`

##### Configure pgAdmin4
* Ensure your `PostgreSQL` app service is running in the background
* On the dashboard page, click on `Add new server`
* Enter `localhost` as name on the `General` tab
* Click on the `Connection` tab and enter
  * `localhost` as the `Host name/address`
  * Leave the rest as default and click `save`
* Now `pgAdmin4` should be connected to your `postgres db server`

#### Installation On Windows
Follow the instructions from this link to install postgres on Windows. This will install `PostgreSQL`, `pgAdmin4` through a packaged installer from Enterprise DB
[install-postgresql-windows](http://www.postgresqltutorial.com/install-postgresql/)
Ensure by the end you are able to connect `pgAdmin` to your `postgres db server`

### Verify your installation
Ensure to close any open session of terminal before verifying
```text
postgres --version
```

### Start/Stop the PostgreSQL Server

* For Mac
  * Use the Postgres.app icon in your status bar to start and stop your server

* For Windows
  * Use the `pgAdmin` tool to manage your server


### Using terminal for PostgreSQL
* For Mac
  * Use your terminal and type in `psql`

* For Windows
  * Search for a tool called `psql`
  * It will prompt your for additional inputs to connect to the terminal
  * All will be default. Just keep clicking enter until the password. This password comes from when you installed the `PostgreSQL` with the installer previously

  * Another way is using through `gitbash`. Ensure to set the environment variable path for the psql/bin folder
  * `psql -U <username> <database-name>`
    * if you have installed with all the defaults username will be `postgres`
    * `psql -U postgres test-db-1`
    * This will trigger the password authentication which you must provide with the password created earlier

### Create a Database

```text
createdb test-db-1
```

For windows, you might need to create the database from the tool `pgAdmin`

### Connect to the Database

```text
psql test-db-1
```
 For windows, you will need to connect to the created database using the tool `psql`. Upon clicking you will need to make a few choices
 * `localhost` is default - hit enter
 * `database` is the newly created database - type `test-db-1`
 * `port` is `5432` by default - hit enter
 * `username` is `postgres` by default - hit enter
 * `password` - Enter your created password

This would open a shell for you to interact with the database. You can type `help` at the shell to see which commands you can use.

Here are a few sample commands

* `\list` : List all of your actual databases.
* `\c my-database-name` : Connect to another database.
* `\d` : List the tables in your currently connected database.
* `\d my-table-name` : Shows information for a specific table.

### Create Tables

Let's create a table to store some user records.

```sql
create table users(id serial, name varchar(25));
```

### Insert Data to Tables

```sql
insert into users(name) values('gordon');
insert into users(name) values('david');
```

### Query Data

```sql
select * from users;
```

### Disconnect

Just type `\q` command to disonnect from the database.

### Drop the Database

Later, when you don't need this database, you can drop it by

```text
dropdb test-db-1
```

### Restoring sample DB
We will be restoring a sample database provided [here](http://www.postgresqltutorial.com/postgresql-sample-database/) so that we have an ample set of data to go through the fundamental of SQL

Download the DVD rental sample database and extract it to get `dvdrental.tar`. On `Mac` you might need to use the `unzip` command to retrieve it in this format

Open your `pgAdmin` tool
  * Right-click on the server connection and `Create Database`
  * Name it `dvdrental`
  * Right-click on `dvdrental` db and choose `restore`
  * Choose the extracted tar from your file system and click restore
  * This will restore all the tables created in your `dvdrental` database

### Other GUI Client for PostgreSQL

If you prefer to work with GUI tools, you can try out the following ones:

* [pgAdmin](https://www.pgadmin.org/)
* [DBeaver](https://dbeaver.io/)
* [TeamSQL](https://teamsql.io/)

### Tutorials for PostgreSQL

Here is a [tutorial](http://www.postgresqltutorial.com/) for learning PostgreSQL. It's written for windows users, but the same commands \(like `psql`\) is available in other platforms too.

You can find another [guide for beginner here](http://postgresguide.com/)

### Exercises
* [Postgres Exercises](https://pgexercises.com/)

## Object Relational Mapping \(ORM\) Tool: Sequelize

If you are tired of using SQL to interact with your database, you can also use [Object Relational Mapping\(ORM\)](https://en.wikipedia.org/wiki/Object-relational_mapping) tools, which helps to convert your information from the database to your JavaScript application without performing SQL statements yourself.

[Sequelize](https://github.com/sequelize/sequelize) is such an ORM which supports multiple dialects whereas PostgreSQL is one of those dialects.

### Tutorials for Sequelize

You can follow the tutorial at [How to use Sequelize with Node and Express](https://www.codementor.io/mirko0/how-to-use-sequelize-with-node-and-express-i24l67cuz) to learn how to use Sequelize to build a CRUD REST API.

Note:

* The author forgot one step: you need to run `npm init` after you get into the `sequelize_example` directory.
* You need to keep your PostgreSQL server running when doing this tutorial

The sample codes after completing the tutorial can be found at \[[https://github.com/thoughtworks-jumpstart/sequelize\_example](https://github.com/thoughtworks-jumpstart/sequelize_example)\]

More Tutorials on Sequelize

* [Setup PostgreSQL with Sequelize in Express Tutorial](https://www.robinwieruch.de/postgres-express-setup-tutorial/)
* [Sequelize CRUD 101](https://lorenstewart.me/2016/10/03/sequelize-crud-101/)
* [Object-Relational Mapping in Node.js with Sequelize](https://www.codementor.io/hari577/object-relational-mapping-in-nodejs-with-sequelize-du1088h3l)

## Resources

* [Reference on PostgreSQL](https://goalkicker.com/PostgreSQLBook/)
* [SQL Learning Track on Bento.io](https://bento.io/topic/sql)