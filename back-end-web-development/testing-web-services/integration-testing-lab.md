# Integration Testing Lab

## Lab 2: Adding integration tests with models

### Getting started

* Fork and clone [https://github.com/thoughtworks-jumpstart/express-blog-api-mongoose-and-tests](https://github.com/thoughtworks-jumpstart/express-blog-api-mongoose-and-tests)
* Go into directory: `cd express-blog-api-mongoose-and-tests`
* Install dependencies: `npm install`
* Start mongoDB: `mongod` \(or the equivalent of this command on windows\)
* Run tests: `npm run test:watch` and all tests should pass

### Task

The key differences between this repo and the previous repo you just worked on are summarized here: [https://gist.github.com/davified/06092be48e3b0b9645f069af999dcee3](https://gist.github.com/davified/06092be48e3b0b9645f069af999dcee3)

Your task is to read the gist and the code in the new repo:

* Read the tests in `tests/integration-tests/books.test.js` to understand how integration tests are written and how DB connections are made
* Understand the changes in `app.js` and `server.js`
* Reimplement the tests without looking at the solution.

Steps:

* Rename the current file so that jest won't run it: `mv tests/integration-tests/books.test.js tests/integration-tests/books.solution.js`
* Create a test file: `touch tests/integration-tests/books.test.js`
* One by one, write a test for each route handler, without changing the implementation in `routes/books.js`

