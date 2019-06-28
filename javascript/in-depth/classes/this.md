# Understanding this

`this` is **a reference** to **an object**. The question is, which object? The answer is, it depends...

## 5 rules to resolve `this`

Although it's confusing, there are actually just a few rules you need to remember, in order to resolve the value of `this` in a given context.

1. When `this` is used in a function and the function bound to an object with `object.function()`
2. When `this` is used in a function and the function is NOT bound to an object explicitly
3. When `this` is used in a class constructor
4. When `this` is used in arrow functions
5. When `this` is explicitly bound to an object using `bind` / `call` / `apply`.

### Rule \#1: When `this` is bound to an object during invocation

This rule applies when:

* `this` is used in a function that is NOT defined using arrow-function syntax, and
* the function is called with `object.function-name()` format.

In this case, the value of `this` binds to the object that appears before the `.`

Example:

```javascript
// Example 1: value of this in a method
var cat = {
  sound: 'meow!',
  whatIsThis: function() {
    console.log(this)
  }
}

cat.whatIsThis() // this === the cat object
```

### Rule \#2: When `this` is NOT bound to an object during invocation

This rule applies when:

* `this` is used in a function that is NOT defined using arrow-function syntax, and
* the function is called with `function-name()` format \(note there is no object and the dot\)

In this case, `this` points to the global object in the running environment.

```javascript
// Example 2: value of this in a function
function whatIsThis() {
  console.log(this)
}
whatIsThis() // this === global, when run in node
whatIsThis() // this === window, when run in browser
// go ahead and try it in node or in your browser console (e.g. this === window)
```

### Rule \#3: When `this` is used in a constructor

This rule applies when `this` is used in a constructor.

In this case, `this` refers to the object that is being created and that will be returned from the constructor.

### Rule \#4: When `this` is used in arrow functions

This rule applies when:

* `this` is used in a function that is defined using arrow-function syntax

In this case, `this` is resolved by following the same lexical scoping rule that we use to resolve other variables.

* Arrow functions do not have their own `this` value. The value of `this` inside an arrow function is always inherited from the value of `this` in its enclosing scope.
* This is known as **lexical scoping**, which just means that it uses the 'author-time' value of `this`, rather than a dynamically determined value of `this` during 'invoke-time' \(or runtime\).
* This particular way of treating `this` makes arrow functions an elegant solution to problems relating to `this` becoming undefined at runtime.

```javascript
// problem - when used in a closure, `this` no longer refers to the helper object
var helper = {
  add: function() { console.log('executing .add(piece)') },

  addAll: function(pieces) {
    console.log("this is bound to ", this); // 'this' is correctly set to the calling object at this time
    pieces.forEach(function (piece) {
      this.add(piece);    // TypeError: this.add is not a function  (shocking!)
    });
  }
}

helper.addAll([1,2,3]);
```

Before ES6, you can fix this problem by introducing an alias to `this`:

```javascript
var helper = {
  add: function(piece) { console.log('executing .add(piece)') },

  addAll: function(pieces) {
    var that = this;                   // old school hack to fix the problem of `this` losing its reference
    pieces.forEach(function (piece) {
      that.add(piece);                 // old school hack to fix the problem of `this` losing its reference
    });
  }
}
```

In ES6, arrow functions to the rescue!

```javascript
var helper = {
  add: function(piece) { console.log('executing .add(piece)') },

  addAll: function(pieces) {
    pieces.forEach(piece => {
      // this is now lexically scoped. it refers to the `this` in `addAll` function
      this.add(piece);
    });
  }
}
```

More discussion can be found in [arrow-functions, `this` follows lexical scope rules](https://hackernoon.com/javascript-es6-arrow-functions-and-lexical-this-f2a3e2a5e8c4).

### Rule \#5: `this` can be bound to an object explicitly with `bind` / `call` / `apply` functions

JavaScript offers some API \(e.g. [bind](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind), [apply](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/apply), [call](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/call) \) for binding `this` to a specific object of your choice.

What does these functions do?

For call/apply, it's easy to understand. Basically they allow you to specify the value of `this` to a function when you call it.

For bind, it's a bit tricky because it returns another function whose `this` is bound to a given object. It sounds tricky but we can understand it by taking some analogy:

> If I have a pen and I give that pen to you, and you pass that pen to your friend. Later, your friend would not know who is the owner of the pen \(assuming you don't tell him and you are not around when he has this question\). This issue can be avoided if I label my pen with my name. Then whoever holds the pen later knows that I am the owner.

The `bind` function does the same job as labeling the pen with my name. The function returned by `bind` has its `this` value bound to the object you specified in the `bind` call.

More examples of using bind/apply/call is given in the next section.

## Resources

* [Understanding this](http://javascript.info/object-methods)
* [this All Makes Sense Now!](https://maximdenisov.gitbooks.io/you-don-t-know-js/content/this_&_object_prototypes/this_all_makes_sense_now.html)
* [What is 'this' in JavaScript](https://blog.bitsrc.io/what-is-this-in-javascript-3b03480514a7)
* [Understand JavaScript’s “this” With Clarity, and Master It](http://javascriptissexy.com/understand-javascripts-this-with-clarity-and-master-it/)

