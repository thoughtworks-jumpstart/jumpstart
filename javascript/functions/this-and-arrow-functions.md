# this & arrow functions

## When not to use arrow functions and why

**Rule of thumb**:

* Use ES5 functions when:
  * your function is a method that will be called using the `object.method()` syntax. Those are the functions that will receive a meaningful `this` value from their caller.
  * When you need `this` to refer to the object \(e.g. in event handlers\) 
* Use ES6 arrow functions for everything else.

## Looking deeper into `this` in arrow functions

Before we see examples of when we should **not** use arrow functinos, let's go through an example that explains the value of `this` in arrow functions

### The 'this' in arrow functions is inherited from the containing scope

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

### Why we shouldn't use arrow functions in object methods

In the example below, the `this` reference in `whatIsThis` function becomes `undefined` when you assign it to `whatAmI` variable.

```javascript
const dog = {
    name: 'fluffy', 
    type: 'dog', 
    sound: 'woof!', 
    makeSound: function () {
      return this.sound;
    },

    whatIsThis: function() {
      return this;
    }
}

console.log(dog.makeSound()); // returns 'woof!' 
console.log(dog.whatIsThis()); // this is bound to the dog object

const whatAmI = dog.whatIsThis;
console.log(whatAmI()); // this becomes an global object (https://nodejs.org/api/globals.html)
```

What if you try to define those methods with arrow function? It's worse. The value of `this` is always bound to an empty object.

```javascript
const dog = { name: 'fluffy', 
    type: 'dog', 
    sound: 'woof!', 
    makeSound: () => {          // this line is changed to use arrow function syntax
        // value of this is {}
        return this.sound
    },

    whatIsThis: () => {         // this line is changed to use arrow function syntax
        // value of this is {}
        return this
    }
}

console.log(dog.makeSound()) // returns 'undefined'
console.log(dog.whatIsThis()) // returns {}
```

#### Why we shouldn't use arrow functions in DOM event handler functions

If you use arrow function in event handlers like the one below, `this` would not be bound to the HTML element that triggers the event!

```javascript
// good
const button = document.querySelector('#button-class')
button.addEventListener('click', function() {
    console.log(this)       // prints the button HTML element 
})

// bad
const button = document.querySelector('#button-class')
button.addEventListener('click', () => {
    console.log(this)       // prints the HTML window global object!
})
```

