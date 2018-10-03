# Testing with Mocks

Mocking is a technique to isolate test subjects by replacing dependencies with objects that you can control and inspect. The goal for mocking is to replace something we don’t control \(e.g. a http request which may or may not succeed\) with something we do. 

## Use Case: Mocking Dependencies

Every system/module has its dependencies: it could be another module written by you, or it could be a module loaded from some 3rd party libraries.

When you try to test this system/module, sometimes you need to simulate some test scenarios where the dependencies need to behave in a controlled way. For this purpose, you need to mock the behavior of those modules/functions that your current module depend on.

## Use Case: Mocking Callbacks

There are also cases when you need to pass a callback to the function you need to test, and you need to check if the callback is indeed invoked by the function. In this case, you can also pass a mock function as callback and verify it's called correctly.

## Creating and using mock functions

### Creating a mock

* Creating a mock: `const myMockFunction = jest.fn()`
* Creating a mock with a name: `const mockFn = jest.fn().mockName('mockedFunction')`
  * You can optionally provide a name for your mock functions, which will be displayed instead of "jest.fn\(\)" in test error output. Use this if you want to be able to quickly identify the mock function reporting an error in your test output.

### Verifying that the mock function has been called

* `expect(myMockFunction).toBeCalled()`
* Checking the specific number of times that a mock function has been called: `expect(myMockFunction).toHaveBeenCallTimes(2)`

### Verifying the arguments that were supplied to the mock

* `expect(mockFunc).toBeCalledWith(arg1, arg2)`

### Stubbing a mock function's return value

* `const myMockFunction = jest.fn(() => 42)`
* `myMockFunction.mockReturnValue(42)`
  * make `myMockFunction()` return 42 everytime you call myMockFunction\(\)
* `myMockFunction.mockReturnValueOnce('you can return anything!')` 
  * make `myMockFunction()` return this value only once \(it returns `undefined` the next time it's called\)

### Sharing the same mock across test cases

#### Clearing a mock

Each mock functions keep track of various things \(e.g. how many times it has been called\). 

You'll need to clear those information beforeEach test case, so that each test case is kept independent. You can achieve this by calling `myMockFunction.mockClear()` in beforeEach.

If you find yourself calling .mockClear\(\) on multiple mocks, there is a command that let you clear all mocks in one line: `jest.clearAllMocks()`.

#### Resetting a mock 

Sometimes, a mock function needs to behave differently in each test case, then you can call `myMockFunction.mockReset()` to remove the current mock return values / implementations. Then you can provide new mocked behavior.

## Creating and using mock modules

### Mocking a module

* Mocking the contents of a module

```javascript
const myMockFunction = jest.fn();
jest.doMock("./someModule", () => {
  return myMockFunction; 
  // Note: what you return here should match the exports in './someModule.js'
});

// Note: it's crucial that you put this next line after jest.doMock() statements
const anotherModule = require("./anotherModule.js"); 

/*
now, inside anotherModule.js, any line that says `const x = require('./someModule')
will be replaced with whatever you return from the factory function inside
jest.doMock('./someModule', factoryFunction)
*/
```

* The exact same thing that can be done, even for external libraries that we install!

```javascript
jest.doMock("mathjs", () => {
  return {
    randomInt: () => 42 // always return 42 when math.randomInt() is called
  }; 
});

// Note: it's crucial that you put this next line after jest.doMock() statements
const anotherModule = require("./anotherModule.js"); 

/*
// inside anotherModule.js:

const math = require('mathjs')
math.randomInt() // this will always return the stubbed value of 42
*/
```

* You can also put the mock implementations into a __mocks__ directory

Besides putting the mock implementation in the test case itself, you can also put some mock implementation in a directory `__mocks__` and inform jest to load that mock implementation when `require` is called to load the module.

The benefit of this approach is that the mock implementation can be shared/reused by multiple test cases.

More details can be found in [Jest documentation on manual mocks](https://jestjs.io/docs/en/manual-mocks)

## Putting it altogether

Lab: [https://github.com/thoughtworks-jumpstart/mocks-and-stubs-lab](https://github.com/thoughtworks-jumpstart/mocks-and-stubs-lab)

Solutions: [https://github.com/thoughtworks-jumpstart/mocks-and-stubs-lab/tree/solution](https://github.com/thoughtworks-jumpstart/mocks-and-stubs-lab/tree/solution)  \(don't peek unless you have to!\)

In the solutions repo, you can find examples on how to 

1. Create mock functions 
   * Using `jest.fn()`
2. Make mock functions return specific values \(i.e. stubbing\)
   * Using `myMockFunction.mockReturnValue('any value')` 
   * or       `myMockFunction.mockReturnValueOnce('any value')`
3. Make expectations/assertions on mock functions
   * Using `expect(myMockFunction).toBeCalled()`
   * or       `expect(myMockFunction).toHaveBeenCalledTimes(42)`
4. Clear mocks
   * Using `myMockFunction.mockClear()`
   * or       `jest.clearAllMocks()`
5. Mock functions imported from another module \(i.e. javascript file or javascript library\)
   * Using 
   * ```text
     jest.doMock("../src/queueService.js", () => {
       return mockGenerateQueue;
     });
     ```
   * or
   * ```text
     const mockRandomInt = jest.fn()
     jest.doMock("mathjs", () => {
       return {
         randomInt: mockRandomInt
       };
     });
     ```

## Resources

### Recommended reading

* [A great explanation on how to use mocks in jest](https://medium.com/@rickhanlonii/understanding-jest-mocks-f0046c68e53c)
* [Understanding Jest Mocks](https://medium.com/@rickhanlonii/understanding-jest-mocks-f0046c68e53c)

### References

* [Jest documentation on mocking functions](https://jestjs.io/docs/en/mock-functions)
* [Jest documentation on manual mocks](https://jestjs.io/docs/en/manual-mocks)
* [Jest documentation on mocking ES6 classes](https://jestjs.io/docs/en/es6-class-mocks)
* [Jest Mock API reference](https://jestjs.io/docs/en/mock-function-api.html)
* [The `jest` object API](https://jestjs.io/docs/en/jest-object.html)

### Mocks, stubs, dummies, spies, whaaaat?

**Mocks** are objects/functions that can be used to \(i\) replace actual object/functions in test cases and \(ii\) verify that objects/functions are called/used \(optionally with a specific number of calls and specific arguments\) 

**Stubs** provide canned answers to calls made during the test, usually not responding at all to anything outside what's programmed in for the test.

**Dummy** objects are passed around but never actually used. Usually they are just used to fill parameter lists. 

**Spies** are objects which are wrapped around the actual object of interest. Spies allow us to to "spy on" actual objects and record some information on how they were called \(e.g. specific number of calls and specific arguments\)

Continue reading: [What are mocks, stubs, spies, dummies?](https://martinfowler.com/articles/mocksArentStubs.html)