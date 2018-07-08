# Testing with Mocks

Mocking is a technique to isolate test subjects by replacing dependencies with objects that you can control and inspect. The goal for mocking is to replace something we don’t control \(e.g. a http request which may or may not succeed\) with something we do. 

Mock and stubs enable a different style of testing. They encourage testing based on behaviour verification.

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

### Recommended reading

* [A great explanation on how to use mocks in jest](https://medium.com/@rickhanlonii/understanding-jest-mocks-f0046c68e53c)
* [What are mocks, stubs, spies, dummies?](https://martinfowler.com/articles/mocksArentStubs.html)

### References

* [Jest getting started guide for mock](https://facebook.github.io/jest/docs/en/mock-functions.html)
* [Jest Mocks API docs](https://facebook.github.io/jest/docs/en/mock-function-api.html)
* [The `jest` object \(good documentation on mocks\)](https://jestjs.io/docs/en/jest-object.html)



