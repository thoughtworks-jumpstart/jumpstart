# Testing Express with MongoDB

## An Example Project

We have created a sample project in the course material repository. Let's clone
this repository and study the codes related to tests.

```text
git clone https://github.com/thoughtworks-jumpstart/express_passport_mongoose_example.git
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

