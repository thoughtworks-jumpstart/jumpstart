# Testing handlers and routers

Testing Express handlers can be done by following these steps:

1. Start a test server
2. Invoke a handler by making an HTTP request to a specific API endpoint
3. Assert based on the expected response status code and body

We can use [supertest](https://github.com/visionmedia/supertest) for steps 1 and 2, and [Jest](https://jestjs.io/) for running the tests and making assertions.

This demo shows how to write Express API tests using supertest and Jest: [https://github.com/thoughtworks-jumpstart/express-testing-demo](https://github.com/thoughtworks-jumpstart/express-testing-demo)

## Labs

* [https://github.com/thoughtworks-jumpstart/express-pizza-app-with-tests](https://github.com/thoughtworks-jumpstart/express-pizza-app-with-tests)
* [https://github.com/thoughtworks-jumpstart/express-api-with-tests](https://github.com/thoughtworks-jumpstart/express-api-with-tests)

## Reference

* [SuperAgent API for making requests](http://visionmedia.github.io/superagent/), which is used by supertest
* [Unit testing express routers](http://evanshortiss.com/development/javascript/2016/04/15/express-testing-using-ioc.html)

