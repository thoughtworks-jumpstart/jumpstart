# More about Jest

## beforeEach and afterEach

* if you find repeated code in each test case, you can extract them into the `beforeEach()` function. This will be run before each test.
* Note:
  * Because of javascript's variable coping mechanism, you will need to initialize the variable at the top of the file in order for it to be available in `beforeEach()`, `afterEach()`, and the test functions
* A contrived example:

```javascript
let someVar
let someOtherVar

beforeEach(function() {
  // do stuff to someVar and someOtherVar
})

afterEach(function() {
  // do any necessary teardown
})

it('should do x y z', function() {
  // do some assertion with someVar and someOtherVar
})
```

## beforeAll and afterAll

* For one time setups, you can use `beforeAll()` and `afterAll()`

```javascript
beforeAll(function() {
  return initializeCityDatabase();
});
```

## Temporary selecting/disabling tests with `it.only(...)` and `it.skip(...)`

* `it.only()`

```javascript
it.only('this will be the only test that runs', function() {

})
```

* `it.skip()`

```javascript
it.skip('this test will not run', function() {

})
```

## Jest search path

Jest uses the following matchesr to identify tests in your project:

* `./src/**/**tests**/**/_.{js,jsx,mjs}`
* `./src/\*\*/?(_.)(spec|test).{js,jsx,mjs}`

## Jest plugins

* [jest-extended](https://github.com/jest-community/jest-extended)

