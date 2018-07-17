# Testing Express with MongoDB

To write API tests for an Express app that uses MongoDB as the database, we are going to use a library called [mongodb-memory-server](https://github.com/nodkz/mongodb-memory-server). It spins up an in-memory instance of MongoDB, which is faster than running a separate MongoDB instance.

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

## An advanced example \(uses Express, MongoDB, and Passport\)

We have created a sample project in the course material repository. Let's clone this repository and study the codes related to tests.

```text
git clone https://github.com/thoughtworks-jumpstart/express_passport_mongoose_example
cd express_passport_mongoose_example
npm install
```

In this project we mainly rely on Contract Tests.

Take a look at the tests in the `integration-test` folder.

* For those test cases we are using the [mongodb-memory-server](https://github.com/nodkz/mongodb-memory-server) to create an empty database before each test case.
* We write our own helper function to load fixtures to the database. Check out the `fixtures.js` file in `test_helper` folder. We could use a proper library to load fixtures if we have more complicated fixtures to load.
* We use `supertest` library to send requests and verify responses.
* We separate `app.js` and `server.js` to make it easier to test API endpoints. This best practice is explained [here](https://github.com/i0natan/nodebestpractices/blob/master/sections/projectstructre/separateexpress.md)

We also have some unit test for the models. You can find them in the `models` folder. Note that for those model tests, they depend on the in-memory instance of MongoDB too. When the cost of depending on a real database is cheap, I didn't bother to mock the database dependency, even for unit tests.

Currently, we don't have unit test for middlewares yet, because the Contract Test already covers the behavior of those middlewares. If we do have some logic that's hard to verify with Contract Test, we could write unit test for middlewares as well, but we would need libraries to mock the interactions with the Mongoose API.

