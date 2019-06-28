# Binding this

You have to be careful about the meaning of `this` in JSX callbacks.

Remember, in a normal JavaScript function, the value of `this` is resolved at run time \(i.e. "Dynamic Scoping"\) \(see the chapter on `this` at JavaScript -&gt; Functions -&gt; `this` and arrow functions\).

In such cases, if you forget to bind the value of `this` when passing the `handleClick` function to `onClick` property, `this` will be undefined when the function is actually called.

This is not React-specific behavior; it is a part of how functions work in JavaScript.

Generally, you must bind `this` to the event handler functions in the constructor if: 1. you are passing functions/methods around \(instead of invoking them\) \(e.g. `onClick={this.handleClick}`\), **and** 2. your function/method uses `this` in its implementation.

## Three ways of ensuring that `this` doesn't become `undefined`

1\) bind `this` in the constructor

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

2\) bind `this` in the render function

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

The drawback of this approach is the `bind()` function is called every time when the `render` function is called. There are some performance concern with this approach.

3\) Use ES6 arrow functions

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

The drawback of this approach is a new event handler function is created each time when the `render()` function is called. Again, there are some performance concern with this approach, when [the new event handler function is passed as props to a PureComponent](https://medium.freecodecamp.org/why-arrow-functions-and-bind-in-reacts-render-are-problematic-f1c08b060e36)

## Actually, there is yet another way

You could define `handleClick()` function as an arrow function. As we know, the value of `this` in arrow functions follow Lexical Scoping rule \(which is the value of this where the arrow function is defined\).

With lexical scoping rule, the value of `this` in arrow function is already bound when it's defined. You don't need to bind it anymore.

However, this implementation relies on [some experimental feature in JavaScript](https://github.com/tc39/proposal-class-fields).

```javascript
class MyComponent extends Component {
  constructor() {
    // no need to bind here
  }

  render() {
    return <div onClick={this.handleClick}></div>;
  }

  handleClick = (event) => {
    // do something with `this`, which is resolved to the instance of React component by lexical scoping rule
  }
}
```

## Recommended Readings

* [https://reactjs.org/docs/faq-functions.html](https://reactjs.org/docs/faq-functions.html)
* [5 Approaches for handling `this` in React](https://medium.freecodecamp.org/react-binding-patterns-5-approaches-for-handling-this-92c651b5af56)

