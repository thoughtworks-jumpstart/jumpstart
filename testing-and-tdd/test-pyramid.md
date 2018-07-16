# Test Pyramid

## Learning checklist

* **Unit Testing** - validate that each unit of the software performs as expected
* **Integration Testing** - ensure that the units work good together
* **User Interface Testing \(End-to-end Testing\)** - test the application interfaces from the user's perspective
* **Regression Testing** - verify that a previously developed and tested software hasn't regressed. \(Snapshot testing is a kind of regression testing\)
* **Manual testing** - verify by hand that the software works/looks as you expect. This is time-consuming, non-repeatable and unscalable type of testing, and should be the least in proportion to the other types of tests

On almost all of the projects, we have limited time and budget, and we don't
have a lot of time to spend on writing and maintaining tests. So sometimes we
need to make a choice on what kind of tests to write and maintain by
considering the cost and benefits of those tests. The test pyramid is a model
that helps illustrate this.

![](../.gitbook/assets/testing_pyramid.jpg)

## Unit Test vs Integration Test / Contract Test

### Unit tests

Usually we prefer to have a lot of unit tests because they are easier to write,
fast to run and easier to troubleshoot when they fail. However, one challenge
of writing unit tests is to isolate the function/class under test from their
environment.

Typically this requires us to mock the dependencies, but too many mock
objects lead to its own problems.

* Setting up mock objects for each test case could be tedious and makes the test cases harder to read
* Setting up mock objects sometimes requires knowledge on internal implementation of the functions under test \(e.g. the implementation depends on some global object that is not passed as function arguments\). If a test case is tightly coupled with the implementation, then we are forced to change the test case when implementation changes. 
  * One way to address this concern is to follow [dependency injection](https://en.wikipedia.org/wiki/Dependency_injection) approach, by declaring all dependencies in the function arguments or constructor arguments.

### Integration tests

Usually we prefer to have fewer integration tests, especially those that
depends on external systems \(e.g. dependency on a real database or another web
service\). Because of those external dependencies, it could be difficult to
setup the test environment, and the test cases may fail because of external
reasons.

Having said that, one type of integration test for a web service is very
helpful: the **Contract Test**. These test cases basically define how the APIs
should behave under each scenario. Whenever we make new changes, as long as
all contract tests pass, we can be pretty confident that the API consumers are
not affected by the change.

When you build a system of multiple web services \(e.g. using the
[micro-service](https://en.wikipedia.org/wiki/Microservices) architecture\),
it's critical that each service has its own API contract test so that every
service can be released/upgraded independently and be confident that their
changes do not break existing API consumers. In that scenario, the contract
tests can also be written as [Consumer Driven
Contracts](https://www.martinfowler.com/articles/consumerDrivenContracts.html)

### Mock database vs real database

If we are writing unit tests, by definition we need to mock the interaction
with database and we don't depend on a real database.

For integration test/contract test \(e.g. on web service build using Express +
MongoDB\), we need to make the server up and running before we can send
requests to it. Most of the time, that would require us to have a real
database.

If somehow your tests need to depend on a real database, you need to make sure
each test case has a clean database to start with. One solution is to set up
and tear down all the collections in the database is necessary for ensuring
there are no side effects between unit tests. In practice, this means a
beforeEach\(\) where you reconnect to the database and drop all collections,
and an afterEach\(\) where you disconnect from the database.

Another solution is to set up an in-memory database for each test case
programmatically to avoid some of the issues with setting up a real database
and sharing one database with all tests.

## Resources

* [Testing pyramid](https://martinfowler.com/bliki/TestPyramid.html)
