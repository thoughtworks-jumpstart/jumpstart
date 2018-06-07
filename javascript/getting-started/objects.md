# Objects

Objects offer us a way to store data in a rich way - in a way that numbers/strings/booleans/arrays cannot. Objects allow us to model Real World Things \(e.g. a user, a cat, a car\) in our applications.

Objects can store 2 types of things: **data** \(i.e. values - like strings, numbers, booleans, arrays\) and **behaviour** \(functions\)

> An object is a hard shell that hides the gooey complexity inside it and instead offers us a few knobs and connectors \(such as methods\) that present an interface through which the object is to be used. The idea is that the interface is relatively simple and all the complex things going on inside the object can be ignored when working with it. \(Eloquent JavaScript\)

![](../../.gitbook/assets/oven_object.jpg)

## Syntax

How to define an object

```javascript
const myObject = {};

const myOtherObject = {
    myKey: 'someValue',                     // this is known as a key-value pair
    myOtherKey: 'someOtherValue'         // this is another key-value pair
};
```

Getting values by keys

```javascript
// using dot notation
myOtherObject.myKey; // returns 'someValue'

// using square bracket notation
myOtherObject['myKey']; // returns 'someValue'

// NOTE: dot notation will NOT work if you are using a variable as a key.
// You will have to use the square bracket notation if you want to use
// variables as a key
```

Defining object methods

```javascript
const yetAnotherObject = {
    myKey: 'someValue',
    myOtherKey: 'someOtherValue',

    printMessage() {
        console.log('wow, you can define functions(a.k.a. methods) in objects!');
    }
};

// Invoke a method
yetAnotherObject.printMessage();
```

* Use the `this` keyword to refer to the object \(e.g. `this.myKey`\)

```javascript
const someObject = {
    myKey: 'someValue',
    myOtherKey: 'someOtherValue',

    logValues: function() {                // alternative syntax for defining methods
        console.log(this.myKey)           // print 'someValue'
        console.log(this.myOtherKey)      // print 'someOtherValue'
    }
};

// Invoke
someObject.logValues();
```

Setting values by keys \(after object has been created\)

```javascript
const cat = {};

// Add a new property
cat.name = 'Fluffy';

// Add a new method
myObject.awesomeMethod = function () {
    console.log("i'm an awesome method!");
}
```

## Resources

* [Object Explorer](https://sdras.github.io/object-explorer/)
* [Understanding the `this` keyword](https://hackernoon.com/understanding-javascript-the-this-keyword-4de325d77f68)
* [MDN Object docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/prototype)

