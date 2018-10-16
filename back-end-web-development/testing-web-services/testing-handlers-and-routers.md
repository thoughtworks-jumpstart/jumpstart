# Testing handlers and routers

Testing Express handlers can be done by following these steps:

1. Start a test server
2. Invoke a handler by making an HTTP request to a specific API endpoint
3. Assert based on the expected response status code and body

We can use [supertest](https://github.com/visionmedia/supertest) for steps 1 and 2, and [Jest](https://jestjs.io/) for running the tests and making assertions.

This demo shows how to write Express API tests using supertest and Jest: [https://github.com/thoughtworks-jumpstart/express-testing-demo](https://github.com/thoughtworks-jumpstart/express-testing-demo)

## Tips

### Restarting Express application before each test case runs

If you need to restart your Express-based application before each test case (e.g. so that your test cases do not interfere with each other), you can follow the steps in [this tutorial](https://glebbahmutov.com/blog/how-to-correctly-unit-test-express-server/)

There are 3 steps in the trick:

* Use a library called [really-need](https://github.com/bahmutov/really-need) so that `require` does not reuse cached modules 
* Start a new server before each test case
* Stop the server after each test case

## Labs

* [https://github.com/thoughtworks-jumpstart/express-pizza-app-with-tests](https://github.com/thoughtworks-jumpstart/express-pizza-app-with-tests)
* [https://github.com/thoughtworks-jumpstart/express-api-with-tests](https://github.com/thoughtworks-jumpstart/express-api-with-tests)

## Reference

* [SuperAgent API for making requests](http://visionmedia.github.io/superagent/), which is used by supertest
* [Unit testing express routers](http://evanshortiss.com/development/javascript/2016/04/15/express-testing-using-ioc.html)

