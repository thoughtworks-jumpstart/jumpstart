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

```text
brew install postgresql
```

The binaries for the postgres database are installed at `/usr/local/bin/` folder.

Then you need to configure PostgreSQL and tell it where to store data.

```text
initdb /usr/local/var/postgres -E utf8
```

`initdb` creates a default database called `postgres` and initialize data storage area at `/usr/local/var/postgres`.

#### Installation On Windows

Note that you need to specify the password associated with the `postgres` user.

```text
choco install postgresql --params '/Password:<specify your password here>'
```

The command will install the tool at `C:\Program Files\postgresql\pgsql\bin` folder. All the commands mentioned below \(like `initdb` and `createdb` etc\) can be found in that `bin` folder.

Next, you need to configure PostgreSQL and tell it where to store data.

```text
initdb -U postgres -A password -E utf8 -W -D <location-of-data-directory>
```

The command line parameters of the initdb command are described in following:

* -U postgres means that the superuser account of your database is called ‘postgres’.
* -A password means that password authentication is used.
* -E utf8 means that the default encoding will be UTF-8.
* -W means that you will enter the superuser password manually.
* -D location-of-data-directory specifies the data directory of your PostgreSQL installation.

Then at the prompt, you need to specify the password you used during installation.

### Verify your installation

```text
postgres --version
```

### Start/Stop the PostgreSQL Server

#### Start

```text
pg_ctl -D <location-of-data-directory> start
```

Once started, the PostgreSQL server listens on port `5432` by default.

#### Stop

```text
pg_ctl -D <location-of-data-directory> stop
```

### Create a Database

```text
createdb test-db-1
```

### Connect to the Database

```text
psql test-db-1
```

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

### GUI Client for PostgreSQL

If you prefer to work with GUI tools, you can try out the following ones:

* [pgAdmin](https://www.pgadmin.org/)
* [DBeaver](https://dbeaver.io/)
* [TeamSQL](https://teamsql.io/)

### Tutorials for PostgreSQL

Here is a [tutorial](http://www.postgresqltutorial.com/) for learning PostgreSQL. It's written for windows users, but the same commands \(like `psql`\) is available in other platforms too.

You can find another [guide for beginner here](http://postgresguide.com/)

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

## Assignment

