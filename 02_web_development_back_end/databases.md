# Databases

## Learning Objectives

- RDBMS
  - Common relational databases
  - SQL queries
  - Modelling - one-to-one, one-to-many, many-to-many, join tables

- ORM (Object Relational Mapping) Libraries
  - waterline
  - sequelize

- NoSQL 
  - MongoDB

- ODM (Object Document Mapping) Libraries
  - Mongoose

- Firebase

### Relational Databases

- Common Brands
  - SQL Server
  - Oracle
  - MySQL 
  - PostgresSQL

- Concepts
  - Table/Row/Column
  - Schema
  - Key
  - Selection
  - Index
  - Join
  - View
  - Transactions
    - ACID property
  - Lock  

- SQL 
  - tutorial: http://www.sqlcourse.com/

- Schema Migration
  
### Firebase

https://www.robinwieruch.de/complete-firebase-authentication-react-tutorial/

### Relational Database access

- Knex

http://knexjs.org/

https://github.com/sheerun/knex-migrate

- Sequelize 

Why using Sequelize? Because it returns data in Promise API. When combined with koa, we can use the async-await syntax to simplify the codes.

Introduction on Sequelize: 
https://tech.luc.id/sequelize-it-part-1-4bb752097861

Database Migration with Sequelize: 
http://docs.sequelizejs.com/manual/tutorial/migrations.html
https://kostasbariotis.com/data-migration-with-nodejs/
https://www.duringthedrive.com/2017/05/06/models-migrations-sequelize-node/

Testing Models with Sequelize + Sqlite
https://www.robotlovesyou.com/bdd-tdd/

A hands-on tutorial with Sequelize
https://www.duringthedrive.com/2017/05/06/models-migrations-sequelize-node/

More tutorials on Sequlize
  - [Setup PostgreSQL with Sequelize in Express Tutorial](https://www.robinwieruch.de/postgres-express-setup-tutorial/)
  - [How to use Sequelize with Node and Express](https://www.codementor.io/mirko0/how-to-use-sequelize-with-node-and-express-i24l67cuz)
  - [Object-Relational Mapping in Node.js with Sequelize](https://www.codementor.io/hari577/object-relational-mapping-in-nodejs-with-sequelize-du1088h3l)
  - [Sequelize CRUD 101](https://lorenstewart.me/2016/10/03/sequelize-crud-101/)
  - [Back-end Basics with Node.js, PostgreSQL, Sequelize, and FeathersJS](https://blog.cloudboost.io/back-end-basics-with-node-js-postgresql-sequelize-and-feathersjs-7ed89b3cd353)
  - [Getting Started with Sequelize for Nodejs Applications](https://hackernoon.com/getting-started-with-sequelize-for-nodejs-applications-2854c58ffb8c)
  - [Getting Started with Node, Express and Postgres Using Sequelize](https://scotch.io/tutorials/getting-started-with-node-express-and-postgres-using-sequelize)
  - [Using Sequelize.js and SQLite in an Express.js App](https://stackabuse.com/using-sequelize-js-and-sqlite-in-an-express-js-app/)


#### Tutorials
https://www.djamware.com/post/58a91cdf80aca748640ce353/how-to-create-rest-api-easily-using-nodejs-expressjs-mongoosejs-and-mongodb
https://scotch.io/tutorials/getting-started-with-node-express-and-postgres-using-sequelize
https://www.packtpub.com/books/content/how-setup-postgresql-nodejs

http://mherman.org/blog/2018/01/22/stubbing-node-authentication-middleware-with-sinon/#.WmskwZP1VE4


## Resources

### Relational Database Migration Tools

https://github.com/db-migrate/node-db-migrate
http://docs.sequelizejs.com/manual/tutorial/migrations.html
https://github.com/flexxnn/sequelize-auto-migrations