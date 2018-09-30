# Closures

Official definition on MDN: A **closure** is the combination of **a function** and **the lexical environment within which that function was declared** \(e.g. another function, or a .js file\).

> Human readable definition: A closure === **a function** + **the variables defined outside of itself** \(like the 'enclosure' around the function, e.g. another function, or a .js file\)
>

```javascript
// Example: b() is a closure because it's a function that has access to variable (`message`) outside its function scope 
function a() {
  var message = 'hello world'
  return function logMessage() {
    console.log(message) 
  }
}

console.log(message) // undefined
const logMessage = a()
logMessage() // prints 'hello world'
```

Fun trivia: By the official definition of closures on MDN, even the function below is a closure! \#shook

```javascript
var name = "alice"
function greeting() {
  console.log("hi " + name)
}
// greeting() is a closure because it's a function with access to 'name', which was defined outside itself
```

## Use cases of closures

Closure is a very important concepts in functional programing paradigm. It allows a function to remember its context where it's defined.

One of the use case is to implement the `private variable`. In the example above, the variable `message` is considered private in the function and only accessible by the `logMessage` function.

## Lab

[http://www.codewars.com/kata/functional-addition](http://www.codewars.com/kata/functional-addition)

## Resources

* [JavascriptInfo: Closure](http://javascript.info/closure)
* [Understanding Javascript closures with ease](http://javascriptissexy.com/understand-javascript-closures-with-ease/)
* [Let's learn closures](https://medium.freecodecamp.org/lets-learn-javascript-closures-66feb44f6a44)
* [Understanding Javascript: Closures](https://hackernoon.com/understanding-javascript-closures-4188edf5ea1b)
* [MDN docs on closures](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures)
* [A Beginner’s Guide to Closures in JavaScript](https://blog.bitsrc.io/a-beginners-guide-to-closures-in-javascript-97d372284dda)

