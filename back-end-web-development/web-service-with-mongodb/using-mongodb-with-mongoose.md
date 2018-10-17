# Using MongoDB with Mongoose

**Make sure your MongoDB server is running!**

## Learn Mongoose API

[Mongoose](http://mongoosejs.com/) is an **Object Document Mapper \(ODM\)**. This means that Mongoose allows you to define objects with a strongly-typed [schema](http://mongoosejs.com/docs/guide.html) that is mapped to a MongoDB document.

Let's explore a few common operations using Mongoose:

1. Creating schemas
2. Creating models
3. Using models to query and save data

This code is similar to the ['Getting Started' section on Mongoose Documentation](http://mongoosejs.com/docs/index.html) but uses modern JS syntax including `async/await`.

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

- There are some syntax error in the code \(in the part that create new instance of models\)
- Many Mongoose APIs are asynchronous in nature. We need to refactor the codes with async/await syntax to avoid callback hell

A copy of the codes for the tutorial is checked into [our course material repository as well](https://github.com/thoughtworks-jumpstart/mongoose-basics). You can take it as a reference.

There are a few other good tutorials on Mongoose, you can try them out as well:

- [Object Modeling in Node.JS with Mongoose](https://devcenter.heroku.com/articles/nodejs-mongoose)
- [Easily Develop Node.js and MongoDB Apps with Mongoose](https://scotch.io/tutorials/using-mongoosejs-in-node-js-and-mongodb-applications)

## Useful Mongoose API to be aware of

### Concept: Schema, Model, Document

Read Mongoose API documentation to answer the following questions:

- Why do we need to define schema for a collection?
- What's the difference between schema vs model vs document?
- How to define a schema?
- How to define a model from a schema?
- How to create a document?
- How to define index on a document?

Reference

- [Schema](https://mongoosejs.com/docs/guide.html#definition)
- [Model](https://mongoosejs.com/docs/models.html)
- [Document](https://mongoosejs.com/docs/documents.html)

### Concept: Queries

Read Mongoose API documentation to answer the following questions:

- How to process the result of a query? (There are two approaches, you can either provide a callback, or treat the result as a promise)

Reference

- [Queries](https://mongoosejs.com/docs/queries.html)

### Concept: Schema Validation

If we define schema validation rules in Mongoose schema, we can validate a document before it's saved/updated in the database. That helps to ensure all documents in the database confirm to well defined schema.

Read Mongoose API documentation to answer the following questions:

- What are the built-in validators?
- When does schema validation happen?
- What's the difference between ValidationError and ValidatorError?
- What's the structure of a ValidationError object?

Reference

- [Schema validation](https://mongoosejs.com/docs/validation.html)

Caveats:

- [The unique option is not a validator](https://mongoosejs.com/docs/validation.html#the-unique-option-is-not-a-validator). If you need to validate some document field contains unique values, you can use some Mongoose plugins like [mongoose-unique-validator](https://github.com/blakehaswell/mongoose-unique-validator).
- There are [quite a few caveats](https://mongoosejs.com/docs/validation.html#update-validators) when you need to do schema validation when updating a document.

#### Alternatives to schema validation

Besides using the schema validation capability from Mongoose, we can also use other libraries for validating object schema in general. One of the good libraries is called [JOI](https://github.com/hapijs/joi).

### How to "join" documents from multiple collections

Each document may have some field that refers to documents in other collections. Using those references, we can retrieve the related documents when we retrieve a specific document.

This is documented under a Mongoose feature called [populate](https://mongoosejs.com/docs/populate.html).

### API: Create/Update/Delete/Find Documents

When you define a model, there are many functions available for you to use, such as:

- [findById](https://mongoosejs.com/docs/api.html#model_Model.findById)
- [findByIdAndUpdate](https://mongoosejs.com/docs/api.html#model_Model.findByIdAndUpdate)
- [findOne](https://mongoosejs.com/docs/api.html#model_Model.findOne)
- [remove](https://mongoosejs.com/docs/api.html#model_Model.remove)

When you create a document (i.e. creating an instance of a model), there are many functions on that document object as well:

- [save](https://mongoosejs.com/docs/api.html#document_Document-save)
- [update](https://mongoosejs.com/docs/api.html#document_Document-update)

In case you need to do some operation before a model is saved:

- [pre](http://mongoosejs.com/docs/api.html#schema_Schema-pre)

## Tips

### Remember to start your MongoDB server before you start your Express application

Tips: If you are trying to run the express application locally, you need to start the local MongoDB instance before you call `npm start`. Otherwise, you will see the following error on your console when you try to call `mongoose.connect()`.

```text
UnhandledPromiseRejectionWarning: MongoNetworkError: failed to connect to server [localhost:27017] on first connect [MongoNetworkError: connect ECONNREFUSED 127.0.0.1:27017]
```

### 3 Ways to Call Mongoose API

Most of the Mongoose APIs allow you to call them with callbacks. But if you don't pass in callback, those APIs would return either a Promise or a Query instead. Both Promise and Query have `.then()` function, which means you can get the resolved value \(from the Promise or the Query\) by calling them with `await`.

More details can be found in [the documentation](http://mongoosejs.com/docs/promises.html)

We recommend using the `async/await` style.

### Difference between document.\_id and document.id

Every document stored in MongoDB has a field called `_id`, which is automatically generated by MongoDB (if not provided explicitly by developers) and it's unique for all documents.

For ease of use, Mongoose also provide an `id` field for each document, which is the string representation of the `_id` field.

In short:

- When you call `document._id`, you get a number.
- When you call `document.id`, you get a string.

### How does model names map to collection names in MongoDB?

When you define a model using Mongoose API and try to save some documents, Mongoose will automatically create a collection in MongoDB. The name of that collection is always a plural form of the model name (which is singular by default).

For example:

| Model Name | Collection Name |
| :--------- | :-------------- |
| User       | users           |
| City       | cities          |
| Book       | books           |

### Do I need to wait for connection to be established?

Before you start running any operation against a database, you need to establish a connection to it. Using Mongoose API, this can be done using the [connect](https://mongoosejs.com/docs/api.html#mongoose_Mongoose-connect) API.

This `connect` API is asynchronous, which means the call to `connect` will return right away, before the connection is truely established.

If you try to do some operation (e.g. saving a document), the operation will be buffered by the Mongoose library until the connection is done. This feature is called [operation buffering](https://mongoosejs.com/docs/connections.html#buffering)

This is a relatively new feature in Mongoose. If you look at some old tutorials on Mongoose, they still show you that you need to provide a callback function to `connect`, in which you provide the operations to be executed after the connection is established.

For example:

```javascript
let uri = 'mongodb://nonexistent.domain:27000';
mongoose.connect(uri, function(error) {
  if (error) {
    // if error is truthy, the initial connection failed.
  }
  // run some operation when initial connection is done
})
```

 That callback parameter is still supported, but not required with this `operation buffering` feature.

### Monitor connection status changes

If you would like to be notified when there is a status change in the underlying connection (e.g. connection established, dis-connected, etc), you can register some event handlers.

For example:

```javascript
const mongoose = require("mongoose");
mongoose.connect("mongodb://localhost/jumpstart");
const conn = mongoose.connection;

conn.on('connected', callback);
conn.on('disconnected', callback);
conn.on('error', callback);
```

## Lab: Adding MongoDB to a CRUD REST API

In this lab, you will start from a project without a database. There are some skeleton codes written for an API to create/update/read/delete books. You need to implement those APIs and store the data in a local Mongo database.

Here is the [project repo](https://github.com/thoughtworks-jumpstart/express-books-api) for you to fork and work on.

Tasks:

- Fork and clone the project
- Create a new branch `checkout -b with_mongodb`
- Make sure your local MongoDB is up and running
- Install Mongoose package in your project `npm install mongoose`
- Create a Mongoose schema/model for `Book`, and implement the API using this model
- Create another model called `Author`, and update the `Book` schema to include one author for each book.
- Implement new REST APIs for author, e.g. creating a new author, search author by name, getting books written by an author, etc

## Resources

- [M101JS: MongoDB for Node.js Developers](https://university.mongodb.com/courses/M101JS/about)
- Try this tutorial: [How to Build a URL Shortener with Node.js and MongoDB](https://scalegrid.io/blog/how-to-build-a-url-shortener-with-node-js-and-mongodb/).
