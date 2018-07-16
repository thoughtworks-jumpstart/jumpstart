# Useful Libraries

## Useful Tools/Libraries For Unit Testing

Depending on your test framework, you may need to use external libraries for
certain operations e.g. mocking, replacing `require`d modules with fake ones,
intercepting HTTP requests, and so on if your test framework does not include
support for those, or if you need to do something more advanced.

### Create Mocking Objects \(spy/mock/stub\)

When you write unit tests, often you need to mock out some of the dependencies.
The following tools may be useful for this purpose:

* [Jest mock functions](https://jestjs.io/docs/en/mock-functions)
* [sinon](http://sinonjs.org/): a popular dedicated library for mocks and stubs
  that can be used with Jest or other test frameworks

### Fool Node.JS require\(\) to load mock objects

* [Jest manual mocks](https://jestjs.io/docs/en/manual-mocks)
* [proxyrequire](https://github.com/thlorenz/proxyquire)

### Intercept HTTP requests from your code and generate mock responses

* [fetch-mock](https://github.com/wheresrhys/fetch-mock): allows mocking http requests made using fetch
* [nock](https://github.com/node-nock/nock): test modules that perform HTTP requests in isolation

### Mock the request and response parameters in Express route-handlers/middlewares

* [express-unit](https://github.com/thebearingedge/express-unit)
* [node-mocks-http](https://github.com/howardabrams/node-mocks-http)

### Intercept calls to MongoDB \(via Mongoose API\) and generate mock results

* [sinon-mongoose](https://github.com/underscopeio/sinon-mongoose): mocking Mongoose model objects
* [mongoose-mock](https://github.com/JohanObrink/mongoose-mock)
* [mockgoose](https://github.com/alonronin/mockingoose)

### Generate Test Data

* [Faker.js](https://github.com/marak/Faker.js/): generate massive amounts of fake data in the browser and node.js

## Useful Tools/Libraries For Integration Testing

### Generating Fixtures in Test Database

When you test with a real database, usually you need to populate the database
with some data to meet the pre-condition for running your tests.

The following libraries help to create fixtures:

* [monky](https://www.npmjs.com/package/monky)
* [devhouse-fixtures](https://www.npmjs.com/package/devhouse-fixtures)

But sometimes it's not difficult to load data to database just using the
`save()` API provided by Mongoose.

### Creating a Dedicated MongoDB Instance for Each Test

If you are using MongoDB, the following libraries help you to create a
dedicated MongoDB instance just for your tests. Then you have full control on
the data in the database, and you can throw away the database after running the
test.

* [mongodb-memory-server](https://github.com/nodkz/mongodb-memory-server)
* [mongodb-prebuilt](https://github.com/winfinit/mongodb-prebuilt)

### Sending HTTP Requests and Verify Responses

To verify your API works as expected, usually you need to send some requests to
a running instance of your application, and check the responses.

This can be done manually using tools like postman or insomnia, but we prefer
to automate those tests.

To automate those tests, the tests need to act as API consumers, issuing
requests and verify responses. For this purpose, you can use library like
[supertest](https://github.com/visionmedia/supertest).
