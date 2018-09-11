# Bind Apply Call

`.bind()`, `.apply()` and `.call()` help us fix the problems when `this` loses its reference due to its dynamic scoping rules. These few functions allows us to **fix the value of** `this` before those functions are invoked.

### .bind\(\)

The `.bind()` method creates a new function that, when called, has its `this` keyword set to a specific object provided by us.

How to use it: `var newFunction = someFunction.bind(someSpecificObject)` Example:

```javascript
// problem:
var tom = {
  name: 'tom',
  introduceSelf: function() {
    console.log('hi i am', this.name);
  }
};

introduceFunction = tom.introduceSelf;
introduceFunction(); // prints 'hi i am undefined'

// solution:
introduceFunction = tom.introduceSelf.bind(tom);
introduceFunction(); // prints 'hi i am tom'
```

This example is contrived, but when you encounter problems with `this` losing its reference \(e.g. when you work with callback functions\), think about using `bind()`!

### .call\(\)

The `.call()` method allows us to execute a function with \(i\) a specific value of `this`, and \(ii\) the parameters to be passed into the function.

How to use it: `func.call(thisArg, arg1, arg2, ..., argn)`

```javascript
function greet(greeting, punctuation) {
  console.log(greeting, this.name, punctuation);
}

var dino = {
  name: 'barney'
};

greet.call(dino, 'howdy', '!!!!!!');  // prints 'howdy barney !!!!!!'
```

### .apply\(\)

Now, `.apply()` serves the exact same purpose as `.call()` \(repeat after me: to allow us to call a function with **a specific object of our choice** as `this`\). The only difference between how they work is that `.call()` expects all parameters to be passed in individually, whereas `.apply()` expects **an array** of all of our parameters.

How to use it: `func.apply(thisArg, [arg1, arg2, ..., argn])`

```javascript
function greet(greeting, punctuation) {
  console.log(greeting, this.name, punctuation);
}

var dino = {
  name: 'barney'
};

greet.apply(dino, ['howdy', '!!!!!!']);  // prints 'howdy barney !!!!!!
greet.call(dino, 'howdy', '!!!!!!');  // see the (small) difference between apply() and call()?
```

### Resources

* [MDN Docs on `.bind()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind)
* [MDN Docs on `.apply()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply)
* [MDN Docs on `.call()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call)
* [https://medium.com/@omergoldberg/javascript-call-apply-and-bind-e5c27301f7bb](https://medium.com/@omergoldberg/javascript-call-apply-and-bind-e5c27301f7bb)

## Assignment

* Go through the 4 tasks here: [http://javascript.info/bind\#bound-function-as-a-method](http://javascript.info/bind#bound-function-as-a-method) \(15 minutes\)

