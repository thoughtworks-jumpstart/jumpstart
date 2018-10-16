# Testing Express with MongoDB

To write API tests for an Express app that uses MongoDB as the database, we are going to use a library called [mongodb-memory-server](https://github.com/nodkz/mongodb-memory-server). It spins up an in-memory instance of MongoDB, which is faster than running a separate MongoDB instance.

The library helps to give us a clean/empty database for each test case, so that the test cases do not interfere with each other (e.g. if a test case fail and leave some garbage data in its copy of database, that failure will not affect other test cases because each test case starts with a clean database). 

Here is an example on using it with Jest: [https://github.com/nodkz/mongodb-memory-server\#simple-jest-test-example](https://github.com/nodkz/mongodb-memory-server#simple-jest-test-example)

## Adding tests to the Books API

In this example, we'll be adding tests to the [express-books-api](https://github.com/thoughtworks-jumpstart/express-books-api).

Install the testing libraries as dev dependencies:

```text
npm install --save-dev jest supertest mongodb-memory-server
```

Create an `app.test.js` file and initialize Mongodb Memory Server:

```javascript
// app.test.js
const express = require("express");
const request = require("supertest");

// Initialize MongoDB Memory Server
const MongodbMemoryServer = require("mongodb-memory-server").default;
const mongod = new MongodbMemoryServer();
const mongoose = require("mongoose");
const Author = require("./models/author");

const app = require("./app");

async function addFakeAuthors() {
  const author1 = new Author({
    name: "paulo",
    age: 49
  });

  await author1.save();

  const author2 = new Author({
    name: "john",
    age: 50
  });

  await author2.save();
}

beforeAll(async () => {
  // Increase timeout to allow MongoDB Memory Server to be donwloaded
  // the first time
  jest.setTimeout(120000);

  const uri = await mongod.getConnectionString();
  await mongoose.connect(uri);
});

afterAll(() => {
  mongoose.disconnect();
  mongod.stop();
});

beforeEach(async () => {
  // Clean DB between test runs
  mongoose.connection.db.dropDatabase();

  // Add fake data to the DB to be used in the tests
  await addFakeAuthors();
});

test("GET /authors", async () => {
  const response = await request(app).get("/authors");

  expect(response.status).toBe(200);

  // Assert based on the fake data added
  expect(response.body.length).toBe(2);
});
```

Each test should be independent of the others - importantly, the order in which the tests run shouldn't affect whether they pass or fail.

## Another strategy for doing integration testing with database

In the example above, we make use of the `mongodb-memory-server` to automatically give us a fresh database in each test case. 

Without that library, another possible solution is to explicitly delete all data in the test database after each test finishes running. That's a bit tedious but still works. Here is a [sample project](https://github.com/thoughtworks-jumpstart/express-blog-api-mongoose-and-tests) showing this approach. Checkout the test cases in `tests/integration-tests` to see the sample tests.
