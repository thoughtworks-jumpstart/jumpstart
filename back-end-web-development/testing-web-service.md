# Testing Web Services

In this section, we are going to learn how to test web services built with
Express.

## What should we test

In a web service implemented using Express framework, there are the following components:

* route handlers
* middlewares
* models

We can write **unit tests** for each of those components. However, there are
some challenges we need to address when writing unit tests:

* The models usually have a dependency on some database API \(e.g. Mongoose\). How do we handle that dependency during testing?
* The route handlers or middlewares usually have dependencies on the models \(and some of them may have dependency on other web services\). How can we handle those dependencies?

We should also write tests to verify our API endpoints work as we designed
\(e.g. sending requests to those API endpoints and verify the responses are the
same as expected.\) This kind of tests can be considered as **Contract Tests**
because they check if the APIs work according to the contract agreed with the
API consumers. They can also be considered as **Integration Test** because we
usually test all the components \(route handlers, middlewares, models, and even
databases\) as a whole and see if they work correctly together.

## References

Here are more articles talking about different ways to testing Express based web APIs. They may have different opinions regarding on the unit test vs integration test. There is no absolute right or wrong answer.

### Unit Testing Express Middleware

* [How to test express middleware](https://codeburst.io/unit-testing-in-express-with-promise-based-middleware-and-controllers-7d3d59ae61f8)
* [How to mock the dependencies of middleware](https://www.terlici.com/2015/09/21/node-express-controller-testing.html)

### Unit Testing Data Models

* [Mongoose Models and Unit Tests](https://codeutopia.net/blog/2016/06/10/mongoose-models-and-unit-tests-the-definitive-guide/)
* [A TDD Approach to Building a Todo API Using Node.js and MongoDB](https://semaphoreci.com/community/tutorials/a-tdd-approach-to-building-a-todo-api-using-node-js-and-mongodb)

### Unit Test Express Routes

* [How to unit test express routes](http://www.marclittlemore.com/how-to-unit-test-express-routes/)
* [Unit testing express routes](http://shakytakes.com/2016/04/04/unit-testing-express-routes/)
* [Express Testing using IoC](http://evanshortiss.com/development/javascript/2016/04/15/express-testing-using-ioc.html)

### Integration Testing with real database

* [Test your model via Jest and Mongoose](http://www.albertgao.xyz/2017/06/19/test-your-model-via-jest-and-mongoose/)
* [Writing Good Tests for NodeJS APIs](http://lucasfcosta.com/2017/04/06/Testing-NodeJS-APIs.html)
* [Create test data for mongoose.js backed MEAN stack applications](https://lostechies.com/johnteague/2014/07/23/create-test-data-for-mongoose-js-backed-mean-stack-applications/)

### Integration Testing with a mock database

* [Using Mockgoose in express app integration test](https://github.com/Mockgoose/Mockgoose/issues/43)

### Test Express API with Jest and Supertest

* [How to test Express.js with Jest and Supertest](http://www.albertgao.xyz/2017/05/24/how-to-test-expressjs-with-jest-and-supertest/)
* [How to correctly unit test Express server](https://glebbahmutov.com/blog/how-to-correctly-unit-test-express-server/)

### Misc References

[A workshop for learning how to test JavaScript applications](https://github.com/kentcdodds/testing-workshop)
