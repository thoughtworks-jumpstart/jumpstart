# More about classes

## Learning checklist

* how to define class \(static\) methods
* the difference between **instance** methods and **static** methods

> Factoid: Classes are in fact "special functions", and just as you can define function expressions and function declarations, the class syntax has two components: class expressions and class declarations. JavaScript classes, introduced in ECMAScript 2015, are primarily syntactical sugar over JavaScript's existing prototype-based inheritance.

### Static methods

```javascript
class Person {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }

    introduceSelf() {
        console.log('hi! i am', this.name);
    }

    static thisIsAClassMethod() {
        console.log('i am a class method!');
    }
}
```

### Getters and setters

```javascript
// exposing data without getters
class Circle {
  constructor(r) {
    this.r = r
  }

  area() {
    return Math.PI * this.r ** 2
  }
}

var c = new Circle(10)
c.area()  // data is exposed as a function

// exposing data with getters
class Circle {
  constructor(r) {
    this.r = r
  }

  get area() {
    return Math.PI * this.r ** 2
  }
}

var c = new Circle(10)
c.area    // data is exposed as a property
```

