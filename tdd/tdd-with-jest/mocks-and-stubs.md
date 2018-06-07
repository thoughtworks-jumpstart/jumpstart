# Mocks and stubs

## Learning checklist

* What are the different types of mock objects?
  * mock
  * stub
  * spy
* Why do we need them?
* When to use the different mock objects
* Common libraries for creating mock objects

## Definitions

**Spies** provide us with information about functions- How many times were they called, in what cases, and by whom?

They are used in integration tests to make sure that the side effects of a process are as expected. For example, how many times was a calculation function called during some process?

```javascript
it('should call method once with the argument 3', () => {

  // create a sinon spy to spy on object.method
  const spy = sinon.spy(object, 'method')

  // call the method with the argument "3"
  object.method(3)

  // make sure the object.method was called once, with the right arguments
  assert(spy.withArgs(3).calledOnce)

})
```

**Stubs** replaces selected functions with selected functions to ensure an expected behavior on selected modules.

If we want to ensure user.isValid\(\) will always return true during a test, where you test a different component, for example, you can do this:

```javascript
// Sinon
sinon.stub(user, 'isValid').returns(true)
```

**Mocks** provides same features as **Stubs** and additionally it allows you to set your expectations on how the mock-objects are called and verify those expectations after the tests finish running.

```javascript
  var database = sinon.mock(Database);
  database.expects('save').once().withArgs(expectedUser);

  setupNewUser(info, function() { });

  database.verify();
  database.restore();
```

**Fakes** are faking certain modules or behaviors to test different parts of a processes.

Sinon can, for example, fake a server to ensure offline, fast and expected responses when testing a process.

```javascript
it('returns an object containing all users', done => {

  // create and configure the fake server to replace the native network call
  const server = sinon.createFakeServer()
  server.respondWith('GET', '/users', [
    200,
    { 'Content-Type': 'application/json' },
    '[{ "id": 1, "name": "Gwen" },  { "id": 2, "name": "John" }]'
  ])

  // call a process that includes the network request that we mocked
  Users.all()
    .done(collection => {
      const expectedCollection = [
        { id: 1, name: 'Gwen' },
        { id: 2, name: 'John' }
      ]
      expect(collection.toJSON()).to.eql(expectedCollection)
      done()
    })

  // respond to the request
  server.respond()

  // remove the fake server
  server.restore()
})
```

Sources: [an overview of javascript testing in 2018](https://medium.com/welldone-software/an-overview-of-javascript-testing-in-2018-f68950900bc3)

## Why do we need mocks and stubs?

What happens if you want to test the behaviour of an object \(let's say a `fluffykitty`, which is a `Cat`\), but it has a dependency on 10 other objects?

```text
const cat = new Cat(brain, eyeballs, coatOfFur, tail, kittyAttitude)
```

Now we need to instantiate 5 other objects - `brain`, `eyeballs`, `coatOfFur`, `tail`, `kittyAttitude`! What if brain has even more dependencies on other objects?

```text
const brain = new Brain(prefontalCortex, hippocampus, cerebrum, brainStem)
```

You see where we're going with this. In our `cats.test.js`, we have 9 different other objects that have nothing to do with cats. This is bad for 3 reasons:

1. it makes the tests long and difficult to write/refactor
2. it makes cats tightly coupled with all these other objects
3. we will have no easy way of making the dependencies return specific values for the purposes of testing `cat`'s functions/behaviour
4. it makes our test dependent on external and unreliable things. 

## Common Libraries

* sinon
* enzyme

## Resources

### Recommended reading

* [How dependency injection makes testing eaiser](https://blog.risingstack.com/dependency-injection-in-node-js/)
* [https://thejsguy.com/2015/01/12/jasmine-vs-mocha-chai-and-sinon.html](https://thejsguy.com/2015/01/12/jasmine-vs-mocha-chai-and-sinon.html)
* [Test doubles](https://martinfowler.com/bliki/TestDouble.html)
* [Mocks aren't stubs](https://martinfowler.com/articles/mocksArentStubs.html)
* [You can mock the passing of time - what?!?!](https://facebook.github.io/jest/docs/en/timer-mocks.html)
* [Mocking remote resources - e.g. databases or web services](https://facebook.github.io/jest/docs/en/manual-mocks.html)

## Lab: Learning Sinon.js Library

Sinon.JS is a very useful library when you need spy/stub/mock-objects in your unit tests.

In this lab, you will read some documentation and tutorials about this library by yourself.

Firstly, read the [Sinon documentation on spy/stub/mock-objects](http://sinonjs.org/releases/v4.4.5/)

Then, read this tutorial [Best Practices for Spies, Stubs and Mocks in Sinon.js](https://semaphoreci.com/community/tutorials/best-practices-for-spies-stubs-and-mocks-in-sinon-js) and try out the sample codes.

After this, you should be able to explain:

* What's the difference between spy/stub/mock-objects?
* When should you use each of them?

