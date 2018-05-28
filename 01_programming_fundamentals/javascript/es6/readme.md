# ES6

ECMAScript 6, also known as ECMAScript 2015 or ES6, is the version of the ECMAScript standard defined in year 2015. ES6 is a significant update to the Javascript language, and the first update to the language since ES5 was standardized in 2009.

ES6 features offer solutions to many of the pains and quirks of working with Javascript prior to ES6, and makes Javascript a much nicer language to work with.

Are you confused by the terms like "ES6", "ECMAScript 2015"? Are they the same thing as "Javascript"? Read on [article](https://medium.freecodecamp.org/whats-the-difference-between-javascript-and-ecmascript-cba48c73a2b5) to find more details.

In this section, we are going to cover the following ES6 features

- let and const
- new methods on String
- template strings
- arrow functions
- default function parameters
- destructuring
- rest and spread operator
- ES6 module system
- using ES6 features in your codes

## Resources

- https://github.com/DrkSephy/es6-cheatsheet
- https://kangax.github.io/compat-table/es6/
- https://bytearcher.com/articles/how-to-check-if-node-implements-es6-language-feature/

## Assignments

### Assignment 1

Refactor past assignment to use ES6 syntax:
  - https://github.com/thoughtworks-jumpstart/javascript-basics
  - https://github.com/thoughtworks-jumpstart/tdd-with-jest
  - https://github.com/thoughtworks-jumpstart/dom-todo-list (be careful with `this`! Remember when (not) to use ES6 arrow functions)

### Bonus: Assignment 2

For each topic that we've covered in class, complete the corresponding topic's katas at [ES6 katas](http://es6katas.org/)

Instructions
  - Task: make all tests pass, without changing the assertions.
  - Tips:
    - read the assertion carefully to see what the test case is expecting
    - read the error/failure messages clearly and understand why it's failing.
    - you can `console.log()` when in doubt. output will be in the Chrome console
    - to skip test, use `it.skip()`
    - the assertion syntax is slightly difference because the author is using `mocha` as the test runner and `chai` as the assertion library. Fret not - fundamentally the structure of the assertion is still `assert.equal(actual, expected)`
  - Do the following exercises only
    - Block scope
      - let
      - const
    - Template strings
      - basics
    - Arrow functions
      - basics
    - Destructuring
      - array
      - assign
    - String methods
      - string.includes()
      - string.repeat()
          - skip the last 2 describe blocks - `describe('for my own (string) class') {...}` & `describe('accepts everything that can be coerced to a string') {...}`
    - Rest operator
      - as parameter
      - with destructuring
    - Spread operator
      - with arrays
    - Default parameters
      - basics
