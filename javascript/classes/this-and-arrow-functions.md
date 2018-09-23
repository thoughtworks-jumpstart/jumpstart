# Caveats when using `this` with arrow functions

Although in general arrow functions make it easy to resolve the value of `this`, there are some special situations that you should not use arrow functions (because you need `this` to be bound at run-time instead of authoring time.)

## We shouldn't use arrow functions in object literal

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

## We shouldn't use arrow functions in DOM event handler functions

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

## Rule of thumb

* Use ES5 functions when:
  * your function is a method that will be called using the `object.method()` syntax. Those are the functions that will receive a meaningful `this` value from their caller.
  * When you need `this` to refer to the object that calls the function at run-time \(e.g. in event handlers\) 
* Use ES6 arrow functions for everything else.
