# More about classes

## Getters and setters

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

