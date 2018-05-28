### [binding `this`](https://reactjs.org/docs/handling-events.html)

You have to be careful about the meaning of `this` in JSX callbacks. In JavaScript, the value of `this` is not bound in class methods (see gitbook chapter on `this` at ES6 -> Javascript -> `this` and arrow functions). If you forget to bind this.handleClick and pass it to onClick, this will be undefined when the function is actually called.

This is not React-specific behavior; it is a part of how functions work in JavaScript. Generally, you must bind that method in the constructor if:
1. you are passing functions/methods around (instead of invoking them) (e.g. `onClick={this.handleClick}`), **and** 
2. your function/method uses `this` 

- Think about "Gordon's Marker" example

#### Three ways of ensuring that `this` doesn't become `undefined`

1) bind `this` in the constructor
```javascript
class MyComponent extends Component {
  constructor() {
    this.handleClick = this.handleClick.bind(this) // bind `this` to handleClick() here
  }

  render() {
    return <div onClick={this.handleClick}></div>
  }

  handleClick() {
    // do something with `this`
  }
}
```

2) bind `this` in the render function

```javascript
class MyComponent extends Component {
  constructor() {
    // no need to bind here
  }

  render() {
    return <div onClick={this.handleClick.bind(this)}></div> // bind `this` to handleClick() here
  }

  handleClick() {
    // do something with `this`
  }
}
```

3) Use ES6 arrow functions

```javascript
class MyComponent extends Component {
  constructor() {
    // no need to bind here
  }

  render() {
    return <div onClick={() => console.log(`do something with ${this} here`)} ></div> // use arrow function instead
  }
}
```



Further reading:
* https://reactjs.org/docs/faq-functions.html