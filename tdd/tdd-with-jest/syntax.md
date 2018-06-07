# Syntax

### Understanding some Javascript syntax

* `require()` and `module.exports`

```javascript
// in somefile.js
function add() {
  // assuming we have a function `add()`
}
module.exports = add

// in anotherfile.test.js
const add = require('./somefile')
```

* callback functions

### Writing tests and assertions

* Create a test file. Naming convention:
  * `someName.js`
  * `someName.test.js`
* Defining a test with the `test()` function:

```javascript
// Syntax:
test('a descriptive message to describe this test', function() {
  // this is an anonymous callback function where we will specify our assertions
})

// Example:

test('2 + 2 should return 4', function() {
  expect(2 + 2).toEqual(4)
})
```

* Another way of defining a test, using the `it()` function

```javascript
it('2 + 2 should return 4', function() {
  expect(2 + 2).toEqual(4)
})
```

* Grouping related tests into a block

```javascript
describe('Addition', function() {
  it('2 + 2 should return 4', function() {
    expect(2 + 2).toEqual(4)
  })

  it('2 + -1 should return 1', function() {
    expect(2 + -1).toEqual(1)
  })

  // more tests related to Addition
})

describe('Subtraction', function() {
  it('2 - 2 should return 0', function() {
    expect(2 - 2).toEqual(0)
  })

  it('2 - 3 should return -1', function() {
    expect(2 - 3).toEqual(-1)
  })

  // more tests related to Subtraction
})
```

### Pro-tip:

* When writing the first test in the new project, start with a simple assertion as a 'smoke' test, just to verify that everything's working. Once it works, you can replace it a real test

```javascript
it('should work', function() {
    expect(1).toEqual(1)
})
```

## Assertion syntax

### Basic matcher methods

* `expect()` returns an 'expectation' object, which has several `matcher` methods \(see full list of matcher methods on the [jest docs](https://facebook.github.io/jest/docs/en/using-matchers.html)\)
  * `expect(actual).toEqual(someValue)`
  * `expect(actual).toHaveLength(number)`
  
### Some other matcher methods (which you won't need for the first session on jest)

* `expect(actual).not.toEqual(someValue)` & `expect(actual).not.toBe(someObject)`
* `expect(actual).toBeGreaterThan(number)`
* `expect(actual).toBeLessThan(number)`
* `expect(actual).toContain(item)`
* `expect(actual).toContainEqual(item)`
* `expect(actual).toHaveProperty(keyPath, value)`
* `expect(actual).toBe(someObject)`
  * Note: `toBe()` uses `Object.is` to test object equality. If you want to check the value of an object, use `toEqual()` instead:
  * Example:

```javascript
it('we should use toEqual() when checking object value equality', function() {
  let dog1 = {
      name: 'dog'
  }
  let dog2 = {
      name: 'dog'
  }
  expect(dog1).toEqual(dog2)
  // expect(dog1).toBe(dog2)  // this will fail
})
```

* truthiness tests

```javascript
it('null', function() {
  const n = null;
  expect(n).toBeNull();
  expect(n).toBeDefined();
  expect(n).not.toBeUndefined();
  expect(n).not.toBeTruthy();
  expect(n).toBeFalsy();
});
```

