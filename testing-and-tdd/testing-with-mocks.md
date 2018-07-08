# Testing with Mocks

Mocking is a technique to isolate test subjects by replacing dependencies with objects that you can control and inspect. The goal for mocking is to replace something we don’t control \(e.g. a http request which may or may not succeed\) with something we do. 

Mock and stubs enable a different style of testing. They encourage testing based on behaviour verification.

### Creating a mock

* Creating a mock: `const myMockFunction = jest.fn()`
* Creating a mock with a name: `const mockFn = jest.fn().mockName('mockedFunction')`
  * You can optionally provide a name for your mock functions, which will be displayed instead of "jest.fn\(\)" in test error output. Use this if you want to be able to quickly identify the mock function reporting an error in your test output.

### Verifying that the mock function has been called

* `expect(mockFunc).toBeCalled()`
* Checking the specific number of times that a mock function has been called: `expect(myMockFunction.mock.calls.length).toBe(2)`

### Verifying the arguments that were supplied to the mock

* `expect(myMockFunction.mock.calls[0][0]).toBe(0)`
  * In this example, the first argument of the **first** call to the function was 0
* `expect(myMockFunction.mock.calls[1][0]).toBe(1)`
  * In this example, the first argument of the **second** call to the function was 1
* `expect(mockFunc).toBeCalledWith(arg1, arg2)` or `expect(mockFunc).lastCalledWith(arg1, arg2)`
  * Another way to verify arguments supplied to the mock function

### Stubbing a mock function's return value

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



