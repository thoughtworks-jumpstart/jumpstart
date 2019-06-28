# Testing REST API without database

In this section, we will learn how to test the REST API using a library called supertest and jest.

The tests can be done by following these steps:

1. Start a test server
2. Invoke a handler by making an HTTP request to a specific API endpoint
3. Assert based on the expected response status code and body

We can use [supertest](https://github.com/visionmedia/supertest) for steps 1 and 2, and [Jest](https://jestjs.io/) for running the tests and making assertions.

This demo below shows how to write Express API tests using supertest and Jest:

[https://github.com/thoughtworks-jumpstart/express-pizza-app-with-tests](https://github.com/thoughtworks-jumpstart/express-pizza-app-with-tests)

## Tips

### Restarting Express application before each test case runs

If you need to restart your Express-based application before each test case \(e.g. so that your test cases do not interfere with each other\), you can follow the steps in [this tutorial](https://glebbahmutov.com/blog/how-to-correctly-unit-test-express-server/)

There are 3 steps in the trick:

* Use a library called [really-need](https://github.com/bahmutov/really-need) so that `require` does not reuse cached modules 
* Start a new server before each test case
* Stop the server after each test case

## About Integration Test

The type of tests we write here with supertest is called integration test.

Integration tests, as the name suggests, tests that the different layers of your application \(e.g. app, router, request handlers, any middleware, models and database\) works as expected when integrated together.

In contrast, there is another type of tests, called Unit Test, which focus on testing a module/class/function works alone.

## Lab: A REST API for books

### Getting started

* Fork and clone [https://github.com/thoughtworks-jumpstart/express-books-api](https://github.com/thoughtworks-jumpstart/express-books-api) 
* Go into directory: `cd express-books-api`
* Install dependencies: `npm install`
* Smoke test: `npm start` and you should see a valid response on [http://localhost:3000](http://localhost:3000)

### Task

Your task is to implement tests for the books router without changing the behaviour in `routes/books.js`

Steps:

* Create a test directory: `mkdir -p tests/integration-tests`
* Create a test file: `touch tests/integration-tests/books.test.js`
* Install test dependencies:
  * `npm install jest --save-dev`
  * `npm install supertest --save-dev`
* One by one, write a test for each route handler. An example for GET /books is written below

```javascript
const app = require("../../app");
const request = require("supertest");

describe("routes/books", () => {
  it("GET /books should return a list of books", () => {
    return request(app)
      .get("/books")

      .then(response => {
        expect(response.status).toEqual(200);
        expect(response.body.message).toEqual("Whatever the route handler returns in the message field");
      });
  });
})
```

## Reference

* [Testing asynchronous functions with `jest`](https://facebook.github.io/jest/docs/en/asynchronous.html)
* [Using `supertest` to make http requests](https://github.com/visionmedia/supertest)
* `supertest`'s documentation are almost non-existent, so we can also refer to [`superagent`](http://visionmedia.github.io/superagent/). Many of `supertest`'s methods \(e.g. `.get()`, `.post()`, `.send()`, etc\) come from `superagent`
* [Unit testing express routers](http://evanshortiss.com/development/javascript/2016/04/15/express-testing-using-ioc.html)

