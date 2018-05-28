### [React component(s)](https://reactjs.org/docs/components-and-props.html)

* 1 or more **elements** => a component
* Components let you (i) split the UI into **independent, reusable pieces**, (ii) think about each piece in isolation, (iii) test each component in isolation.
* Conceptually, components are like JavaScript functions. They accept arbitrary inputs (called **“props”** - more on this later) and return React elements describing what should appear on the screen.
* React gives us **two ways** to create components: functional components and class components. 
    * Functional components ~ stateless/dumb/presentational components
    * Class components ~ stateful/smart components

##### Functional components 

You create a component by **defining a function**. Example:

  ```javascript
  // Define a component Welcome using ES6 function syntax
  const Welcome = () => {
      return <h1>Hello world!</h1>;
  }

  // Use the <Welcome/> component
  ReactDOM.render(
      <Welcome />,
      document.getElementById('root')
  )
  ```

##### Class components

You create a component by **defining a class**. Example:

  ```javascript
  import React, { Component } from "react";

  class Welcome extends Component {
      render() {
          return <h1>Hello world!</h1> // notice the that we're using this.props instead of props
      }
  }

  ReactDOM.render(
      <Welcome />,
      document.getElementById('root')
  )
  ```

##### When to use which?
* When there is **no need for your component to have state, create a functional components**.
    * Many components in your apps can be written as functional components: these components tend to be easier to write and maintain.
    * When you initially defined your component using the class component syntax, but find that it only consist of a render method, you can refactor them to be a functional component
* For more on when and why you should use stateless functional components instead of stateful class components, read [this article](https://hackernoon.com/react-stateless-functional-components-nine-wins-you-might-have-overlooked-997b0d933dbc)
* When using a class component, note the difference in syntax when using class components syntax:
    * You’ll need to change `props` to `this.props`
    * Similarly, any reference to variables and methods defined in the class, should be referred to using the `this.` prefix

##### A note on multi-line components 

For both functional and class components, if you're returning more than 1 JSX element, you must wrap them in an enclosing tag

```javascript
// bad. Throws syntax error
const Welcome = () => {
    return <h1>Hello world!</h1><p>I come in peace</p>; // returning 2 JSX elements
}

// good
const Welcome = () => {
    return (
      <div>
        <h1>Hello world!</h1>
        <p>I come in peace</p>
      </div>
    ); // wrapping multiple JSX elements in an enclosing tag (i.e. brackets () + <div></div>)
}
```