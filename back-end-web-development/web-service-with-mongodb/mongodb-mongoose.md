**Make sure your MongoDB server is running!**

## Learn Mongoose API

[Mongoose](http://mongoosejs.com/) is an **Object Document Mapper \(ODM\)**. This means that Mongoose allows you to define objects with a strongly-typed [schema](http://mongoosejs.com/docs/guide.html) that is mapped to a MongoDB document.

Let's explore a few common operations using Mongoose:

1. Creating schemas
2. Creating models
3. Using models to query and save data

This code is similar to the ['Getting Started' section on Mongoose Documentation](http://mongoosejs.com/docs/index.html)
but uses modern JS syntax including `async/await`.

```javascript
const mongoose = require("mongoose");

mongoose.connect("mongodb://localhost/jumpstart");
const db = mongoose.connection;

// Add an error handler to show mongo errors in the Node.js console
db.on("error", error => {
  console.error("An error occurred!", error);
});

// Create a schema
const pizzaSchema = mongoose.Schema({
  name: String,
  flavour: String
});

// Use the schema to create a model
const Pizza = mongoose.model("Pizza", pizzaSchema);

async function insertData() {
  // Create a new instance of the model
  const margarita = new Pizza({
    name: "margarita"
  });

  // Save it to the DB
  await margarita.save();

  const pepperoni = new Pizza({
    name: "pepperoni"
  });

  await pepperoni.save();
}

async function queryData() {
  // .find without any arguments returns all the data
  const pizzas = await Pizza.find();
  console.log(pizzas);
}

async function init() {
  await insertData();
  await queryData();

  // Close the connection to the db
  db.close();
}

init();
```

Then you can see a few more examples on the API in [this article](https://coursework.vschool.io/mongoose-crud/).

Now, let's follow [this tutorial](https://code.tutsplus.com/articles/an-introduction-to-mongoose-for-mongodb-and-nodejs--cms-29527) to play with the Mongoose API.

Caveat on this tutorial:

* There are some syntax error in the code \(in the part that create new instance of models\)
* Many Mongoose APIs are asynchronous in nature. We need to refactor the codes with async/await syntax to avoid callback hell

A copy of the codes for the tutorial is checked into [our course material repository as well](https://github.com/thoughtworks-jumpstart/mongoose-basics). You can take it as a reference.

There are a few other good tutorials on Mongoose, you can try them out as well:

* [Object Modeling in Node.JS with Mongoose](https://devcenter.heroku.com/articles/nodejs-mongoose)
* [Easily Develop Node.js and MongoDB Apps with Mongoose](https://scotch.io/tutorials/using-mongoosejs-in-node-js-and-mongodb-applications)

### 3 Ways to Call Mongoose API

Most of the Mongoose APIs allow you to call them with callbacks. But if you
don't pass in callback, those APIs would return either a Promise or a Query
instead. Both Promise and Query have `.then()` function, which means you can
get the resolved value \(from the Promise or the Query\) by calling them with
`await`.

More details can be found in [the documentation](http://mongoosejs.com/docs/promises.html)

We recommend using the `async/await` style.

## Lab: Adding MongoDB to a CRUD REST API

In this lab, you will start from a project without a database. There are some skeleton codes written for an API to create/update/read/delete books. You need to implement those APIs and store the data in a local Mongo database.

Here is the [project repo](https://github.com/thoughtworks-jumpstart/express-books-api) for you to fork and work on.

### Tips

#### Remember to start your MongoDB server before you start your Express application

Tips: If you are trying to run the express application locally, you need to start the local MongoDB instance before you call `npm start`. Otherwise, you will see the following error on your console when you try to call `mongoose.connect()`.

```text
UnhandledPromiseRejectionWarning: MongoNetworkError: failed to connect to server [localhost:27017] on first connect [MongoNetworkError: connect ECONNREFUSED 127.0.0.1:27017]
```

#### You will need to use some of the following APIs from Mongoose

Make sure you get familiar with the following APIs before you start doing this assignment.

Methods available on your model class:

* [findById](http://mongoosejs.com/docs/api.html#findbyid_findById)
* [findByIdAndUpdate](http://mongoosejs.com/docs/api.html#findbyidandupdate_findByIdAndUpdate)
* [findOne](http://mongoosejs.com/docs/api.html#findone_findOne)

Methods available on your model objects:

* [save](http://mongoosejs.com/docs/api.html#model_Model-save)
* [remove](http://mongoosejs.com/docs/api.html#model_Model-remove)

In case you need to do some operation before a model is saved:

* [pre](http://mongoosejs.com/docs/api.html#schema_Schema-pre)

## Resources

* [M101JS: MongoDB for Node.js Developers](https://university.mongodb.com/courses/M101JS/about)
* Try this tutorial: [How to Build a URL Shortener with Node.js and MongoDB](https://scalegrid.io/blog/how-to-build-a-url-shortener-with-node-js-and-mongodb/).
