### Adding integration tests

Integration tests, as the name suggests, tests that the different layers of your application (e.g. app, router, request handlers, any middleware, models and database) works as expected when integrated together. 

In the next section, we will learn how to do this in two labs (and 2 repos). First, we will add integration tests just to test the application route handlers (this is also known as the controller layer - the C in MVC). Second, we will add tests for the model layer (the M in MVC).

Relevant docs:
- [Testing asynchronous functions with `jest`](https://facebook.github.io/jest/docs/en/asynchronous.html)
- [Using `supertest` to make http requests](https://github.com/visionmedia/supertest)
- `supertest`'s documentation are almost non-existent, so we can also refer to [`superagent`](http://visionmedia.github.io/superagent/). Many of `supertest`'s methods (e.g. `.get()`, `.post()`, `.send()`, etc) come from `superagent`

### Lab 1: Adding integration tests without models

#### Getting started
- Fork and clone https://github.com/thoughtworks-jumpstart/express-books-api 
- Go into directory: `cd express-books-api`
- Install dependencies: `yarn install`
- Smoke test: `yarn start` and you should see a valid response on http://localhost:3000

#### Task
Your task is to implement tests for the books router without changing the behaviour in `routes/books.js`

Steps:
- Create a test directory: `mkdir -p tests/integration-tests`
- Create a test file: `touch tests/integration-tests/books.test.js`
- Install test dependencies:
  - `yarn add jest --dev`
  - `yarn add supertest --dev`
- One by one, write a test for each route handler. An example for GET /books is written below

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

### Lab 2: Adding integration tests with models

#### Getting started
- Fork and clone https://github.com/thoughtworks-jumpstart/express-blog-api-mongoose-and-tests
- Go into directory: `cd express-blog-api-mongoose-and-tests`
- Install dependencies: `yarn install`
- Start mongoDB: `mongod` (or the equivalent of this command on windows)
- Run tests: `yarn test:watch` and all tests should pass

#### Task

The key differences between this repo and the previous repo you just worked on are summarized here: https://gist.github.com/davified/06092be48e3b0b9645f069af999dcee3

Your task is to read the gist and the code in the new repo:
- Read the tests in `tests/integration-tests/books.test.js` to understand how integration tests are written and how DB connections are made
- Understand the changes in `app.js` and `server.js`
- Reimplement the tests without looking at the solution.

Steps:
- Rename the current file so that jest won't run it: `mv tests/integration-tests/books.test.js tests/integration-tests/books.solution.js`
- Create a test file: `touch tests/integration-tests/books.test.js`
- One by one, write a test for each route handler, without changing the implementation in `routes/books.js`