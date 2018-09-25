# Arrow functions

ES6 arrow functions give us several benefits over ES5 functions:

* shorter syntax
* default function arguments \(makes function more readable\)

## Syntax

This is how we used to declare functions before ES6:

```javascript
function awesomeFunction(someParam) { ... }

var awesomeFunction = function(someParam) { ... }
```

ES6 introduced arrow-function:

```javascript
const awesomeFunction = (someParam, anotherParam) => { ... }
```

e.g.

```javascript
const add = (x,y) => x + y;
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
['a', 'b', 'c'].map((alphabet, index) => {[alphabet]:index})

// good. will return the object as we expected
['a', 'b', 'c'].map((alphabet, index) => ({[alphabet]:index}))
```

* You don't need brackets \(`()`\) when there is only one argument to the function.

* Brackets \(`()`\) are needed when your function has one of the following:
  * multiple arguments
  * no arguments
  * rest parameters
  * default parameters
  * a destructuring argument

## Recommended reading

* [Arrow functions in depth](https://hacks.mozilla.org/2015/06/es6-in-depth-arrow-functions/)
* [MDN docs on arrow functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions)
* [http://exploringjs.com/es6/ch\_arrow-functions.html](http://exploringjs.com/es6/ch_arrow-functions.html) \(explains `this` and ES6 arrow functions very well\)
* On the use of arrow functions in React, see [https://reactjs.org/docs/handling-events.html](https://reactjs.org/docs/handling-events.html)

