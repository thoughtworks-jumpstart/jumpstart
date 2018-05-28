# Testing Web Service API Built with Express Framework

In this section, we are going to learn how to test the web services built with express framework.

## Learning Checklist

- What should we test?
- Different type of tests
  - Unit Test
  - Integration Test
  - Contract Test
- What are the tools/libraries available for testing?
- Our testing strategy

## What should we test

In a web service implemented using Express framework, there are the following components:

- route handlers
- middlewares
- models

We can write **unit tests** for each of those components. However, there are some challenges we need to address when writing unit tests:

- The models usually have a dependency on some database API (e.g. Mongoose). How do we handle that dependency during testing?
- The route handlers or middlewares usually have dependencies on the models (and some of them may have dependency on other web services). How can we handle those dependencies?

We should also write tests to verify our API endpoints works as we designed (e.g. sending requests to those API endpoints and verify the responses are the same as expected.) This kind of tests can be considered as **Contract Tests** because they check if the APIs work according to the contract agreed with the API consumers. They can also be considered as **Integration Test** because we usually test all the components (route handlers, middlewares, models, and even databases) as a whole and see if they work correctly together.

## Useful Tools/Libraries For Unit Testing

### Creating Mocking Objects (spy/mock/stub)

When you write unit tests, often you need to mock out some of the dependencies. The following libraries could be useful for this purpose

- [sinon](http://sinonjs.org/): this is a very popular library that you need to be familiar with.

### Fool Node.JS require() to load mock objects

- [mockery](https://github.com/mfncooper/mockery)
- [proxyrequire](https://github.com/thlorenz/proxyquire)
- [really-need](https://github.com/bahmutov/really-need)

### Intercepting HTTP requests from your code and generate mock responses

- [fetch-mock](https://github.com/wheresrhys/fetch-mock): allows mocking http requests made using fetch
- [nock](https://github.com/node-nock/nock): test modules that perform HTTP requests in isolation

### Mocking the request and response parameters in Express route-handlers/middlewares

- [express-unit](https://github.com/thebearingedge/express-unit)
- [node-mocks-http](https://github.com/howardabrams/node-mocks-http)

### Intercepting calls to MongoDB (via Mongoose API) and generate mock results

- [sinon-mongoose](https://github.com/underscopeio/sinon-mongoose): mocking Mongoose model objects
- [mongoose-mock](https://github.com/JohanObrink/mongoose-mock)
- [mockgoose](https://github.com/alonronin/mockingoose)

### Generating Test Data

- [Faker.js](https://github.com/marak/Faker.js/): generate massive amounts of fake data in the browser and node.js

## Useful Tools/Libraries For Integration Testing

### Generating Fixtures in Test Database

When you test with a real database, usually you need to populate the database with some data to meet the pre-condition for running your tests.

The following libraries help to create fixtures:

- [monky](https://www.npmjs.com/package/monky)
- [donky](https://www.npmjs.com/package/donky)
- [devhouse-fixtures](https://www.npmjs.com/package/devhouse-fixtures)

But sometimes it's not difficult to load data to database just using the `save()` API provided by Mongoose.

### Creating Dedicated MongoDB Instance for Each Test

If you are using MongoDB, the following libraries help you to create a dedicated MongoDB instance just for your tests. Then you have full control on the data in the database, and you can throw away the database after running the test.

- [mongodb-memory-server](https://github.com/nodkz/mongodb-memory-server)
- [mongodb-prebuilt](https://github.com/winfinit/mongodb-prebuilt)

### Sending HTTP Requests and Verify Responses

To verify your API works as expected, usually you need to send some requests to a running instance of your application, and check the responses.

This can be done manually using tools like postman or insomnia, but we prefer to automate those tests.

To automate those tests, the tests need to act as API consumers, issuing requests and verify responses. For this purpose, you can use library like [supertest](https://github.com/visionmedia/supertest), or [axios](https://github.com/axios/axios)

## Testing Coverage

- [istanbul](https://istanbul.js.org/)
- many test library like [jest](https://facebook.github.io/jest/) has built-in support to generate test coverage reports

## Testing Strategies

On almost all of the projects, we have limited time and budgets, and we don't have a lot of time to spend on writing and maintaining tests. So sometimes we need to make a choice on what kind of tests to write and maintain by considering the cost and benefits of those tests.

### Unit Test vs Integration Test / Contract Test

Firstly, let's talk about unit test.

Usually we prefer to have a lot of unit tests because they are easier to write, fast to run and easier to troubleshoot when they fail. However, one challenge of writing unit tests is to isolate the function/class under test from their environment.

Typically this requires us to mockup the dependencies, but too many mock objects lead to its own problems

- Firstly, setting up mock objects for each test case could be tedious and makes the test cases harder to read
- Secondly, setting up mock objects sometimes requires knowledge on internal implementation of the functions under test (e.g. the implementation depends on some global object that is not passed as function arguments). If a test case is tightly coupled with the implementation, then we are forced to change the test case when implementation changes. 
  - One way to address this concern is to follow [dependency injection](https://en.wikipedia.org/wiki/Dependency_injection) approach, by declaring all dependencies in the function arguments or constructor arguments.

Now, let's consider integration test and contract test.

Usually we prefer to have less integration test, especially integration test that depends on external systems (e.g. dependency on a real database or another web service). Because of those external dependencies, it could be difficult to setup the test environment, and the test cases may fail because of external reasons.

Having said that, one type of integration test for a web service is very helpful, which is called **Contract Test**. Those test cases basically defines how the APIs should behave under each scenario. When ever we make new changes, as long as all contract tests pass, we can be pretty confident that the API consumers are not affected by the change.

When you build a system of multiple web services (e.g. using the [micro-service](https://en.wikipedia.org/wiki/Microservices) architecture), it's critical that each service has its own API contract test so that every service can be released/upgraded independently and be confident that their changes do not break existing API consumers. In that scenario, the contract tests can also be written as [Consumer Driven Contracts](https://www.martinfowler.com/articles/consumerDrivenContracts.html)

### Mock database vs real database

If we are writing unit test, by definition we need to mock the interaction with database and we don't depend on a real database.

For integration test/contract test (e.g. on web service build using Express + MongoDB), we need to make the server up and running before we can send requests to it. Most of the time, that would require us to have a real database.

If somehow your tests need to depend on a real database, you need to make sure each test case has a clean database to start with. One solution is to set up and tear down all the collections in the database is necessary for ensuring there are no side effects between unit tests. In practice, this means a beforeEach() where you reconnect to the database and drop all collections, and an afterEach() where you disconnect from the database.

But we have a better solution: thanks to the libraries like [mongodb-memory-server](https://github.com/nodkz/mongodb-memory-server), we could setup an in-memory database for each test case programmatically, so we can avoid some of the troubles for setting up a real database and sharing one database with all tests.

## An Example Project

We have created a sample project in the course material repository. Let's clone this repository and study the codes related to tests.

```shell
git clone https://github.com/thoughtworks-jumpstart/express_passport_mongoose_example.git
cd express_passport_mongoose_example
yarn install
```

In this project we mainly rely on Contract Tests. 

Take a look at the tests in the `integration-test` folder.

- For those test cases we are using the [mongodb-memory-server](https://github.com/nodkz/mongodb-memory-server) to create an empty database before each test case.
- We write our own helper function to load fixtures to the database. Check out the `fixtures.js` file in `test_helper` folder. We could use a proper library to load fixtures if we have more complicated fixtures to load.
- We use `supertest` library to send requests and verify responses.
- We separate `app.js` and `server.js` to make it easier to test API endpoints. This best practice is explained [here](https://github.com/i0natan/nodebestpractices/blob/master/sections/projectstructre/separateexpress.md)

We also have some unit test for the models. You can find them in the `models` folder. Note that for those model tests, they depend on the in-memory instance of MongoDB too. When the cost of depending on a real database is cheap, I didn't bother to mock the database dependency, even for unit tests.

Currently, we don't have unit test for middlewares yet, because the Contract Test already covers the behavior of those middlewares. If we do have some logic that's hard to verify with Contract Test, we could write unit test for middlewares as well, but we would need libraries to mock the interactions with the Mongoose API.

## References

Here are more articles talking about different ways to testing Express based web APIs. They may have different opinions regarding on the unit test vs integration test. There is no absolute right or wrong answer.

### Unit Testing Express Middleware

- [How to test express middleware](https://codeburst.io/unit-testing-in-express-with-promise-based-middleware-and-controllers-7d3d59ae61f8)
- [How to mock the dependencies of middleware](https://www.terlici.com/2015/09/21/node-express-controller-testing.html)

### Unit Testing Data Models

- [Mongoose Models and Unit Tests](https://codeutopia.net/blog/2016/06/10/mongoose-models-and-unit-tests-the-definitive-guide/)
- [A TDD Approach to Building a Todo API Using Node.js and MongoDB](https://semaphoreci.com/community/tutorials/a-tdd-approach-to-building-a-todo-api-using-node-js-and-mongodb)

### Unit Test Express Routes

- [How to unit test express routes](http://www.marclittlemore.com/how-to-unit-test-express-routes/)
- [Unit testing express routes](http://shakytakes.com/2016/04/04/unit-testing-express-routes/)
- [Express Testing using IoC](http://evanshortiss.com/development/javascript/2016/04/15/express-testing-using-ioc.html)

### Integration Testing with real database

- [Test your model via Jest and Mongoose](http://www.albertgao.xyz/2017/06/19/test-your-model-via-jest-and-mongoose/)
- [Writing Good Tests for NodeJS APIs](http://lucasfcosta.com/2017/04/06/Testing-NodeJS-APIs.html)
- [Create test data for mongoose.js backed MEAN stack applications](https://lostechies.com/johnteague/2014/07/23/create-test-data-for-mongoose-js-backed-mean-stack-applications/)

### Integration Testing with a mock database

- [Using Mockgoose in express app integration test](https://github.com/Mockgoose/Mockgoose/issues/43)

### Test Express API with Jest and Supertest

- [How to test Express.js with Jest and Supertest](http://www.albertgao.xyz/2017/05/24/how-to-test-expressjs-with-jest-and-supertest/)
- [How to correctly unit test Express server](https://glebbahmutov.com/blog/how-to-correctly-unit-test-express-server/)

### Misc References

[A workshop for learning how to test JavaScript applications](https://github.com/kentcdodds/testing-workshop)

### Assignment

Add API contract tests to the `express-url-shortener` project you have developed.

Tips:

- You can use `supertest` to send HTTP requests and verify responses.
- You can use the `mongodb-memory-server` so that every test case has a fresh database to test with.