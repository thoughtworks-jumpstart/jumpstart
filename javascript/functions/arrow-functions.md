# Arrow functions

ES6 arrow functions give us several benefits over ES5 functions:

* shorter syntax
* default function arguments \(makes function more readable\)

## Syntax

Named functions:

```javascript
// ES6
const awesomeFunction = (someParam) => { ... }

// ES5
function awesomeFunction(someParam) { ... }
// also ES5
var awesomeFunction = function(someParam) { ... }
```

Anonymous functions \(usually you use them when you need to pass them as callback functions\):

```javascript
// ES5
function(someParam) {
    // do something
}

// ES6
(someParam, someOtherParam) => { ... }

someParam => { ... } // brackets are optional when there's only 1 argument

someParam => do something   // for single-line statements, the curly braces {} and return keyword can be removed thanks to implicit returns
```

## Pro-tips

* **Implicit return**. if you have a single line arrow function, you can remove the curly brackets and `return` statement, and it will work just the same. Example:

```javascript
// a simple callback to return an array with each element multiplied by 2
// ES5
[1, 2, 3].map(function(element) {
    return element * 2
})

// ES6
[1, 2, 3].map((element) => {
    return element * 2
})

// ES6 (optional curly braces removed + implicit return)
[1, 2, 3].map(element => element * 2)
```

* To implicit return object literals, you need to surround the object's braces \(`{}`\) with brackets\(`()`\). Example:

```javascript
// bad. won't work
['a', 'b', 'c'].map((alphabet, index) => {alphabet:index})

// good. will return the object as we expected
['a', 'b', 'c'].map((alphabet, index) => ({alphabet:index}))
```

* Brackets \(`()`\) are needed when your function has one of the following:
  * multiple arguments
  * no arguments
  * rest parameters
  * default parameters
  * a destructuring argument

## Recommended reading

* [Arrow functiosn in depth](https://hacks.mozilla.org/2015/06/es6-in-depth-arrow-functions/)
* [MDN docs on arrow functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions)
* [http://exploringjs.com/es6/ch\_arrow-functions.html](http://exploringjs.com/es6/ch_arrow-functions.html) \(explains `this` and ES6 arrow functions very well\)
* On the use of arrow functions in React, see [https://reactjs.org/docs/handling-events.html](https://reactjs.org/docs/handling-events.html)

