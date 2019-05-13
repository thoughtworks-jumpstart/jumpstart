# React component\(s\)

* Components let you \(i\) split the UI into **independent, reusable pieces**, \(ii\) think about each piece in isolation, \(iii\) test each component in isolation.
* Conceptually, components are like JavaScript functions. They accept arbitrary inputs \(called **“props”** - more on this later\) and return React elements describing what should appear on the screen.
* React gives us **two ways** to create components: functional components and class components.
  * Functional components ~ stateless/dumb/presentational components
  * Class components ~ stateful/smart components

## Functional components

You create a component by **defining a function**. Example:

```javascript
  // Define a component Welcome using ES6 function syntax
  const Welcome = (props) => {
      return <h1>Hello world! I like {props.name}</h1>;
  }

  // Use the <Welcome/> component
  ReactDOM.render(
      <Welcome name="cats" />,
      document.getElementById('root')
  );
```

The function takes in **one argument**, which is the `props` object. It contains all the properties passed down from the containing component.

A common variation of the example is to apply object-destructuring on the `props` argument to extract the properties you are interested,e.g.

```javascript
  const Welcome = ({name}) => {
      return <h1>Hello world! I like {name}</h1>;
  }
```

Note that usually the variable names in JavaScript start with lower case letter. However, in JSX syntax, the name of components **must** start with upper case letter (`Welcome` instead of `welcome`).

**Note: If you define a function that takes in more than one argument, React won't treat it as a React component!!!**

The following definition of React component is wrong:

```javascript
  const Welcome = (petName1, petName2) => {
      return <h1>Hello world! I like {petName1} and {petName2}</h1>;
  }
```

## Class components

You create a component by **defining a class**. Example:

```javascript
  import React, { Component } from "react";

  class Welcome extends Component {
      constructor(props) {
        super(props);
        this.state = {};// initialize local state
      }
      render() {
        return <h1>Hello world! I like {this.props.name}</h1>; // notice the that we're using this.props instead of props
      }
  }

  ReactDOM.render(
      <Welcome name="cats" />,
      document.getElementById('root')
  );
```

Note that in this case the `props` are passed to the constructor. Typically you should also call `super(props)` to initialize the `React.Component` class properly. In contrast, the `render` function does not take any arguments. If you need to refer to the `props` of the component, you need to refer to it via `this.props`.

When you don't have much logic inside the constructor, you can choose to skip it and put the `state` initialization in the class property fields, e.g.

```javascript
  class Welcome extends Component {
      state = {};// initialize local state

      render() {
        return <h1>Hello world! I like {this.props.name}</h1>; // notice the that we're using this.props instead of props
      }
  }
```

Note that this relies on [an experimental feature in JavaScript](https://tc39.github.io/proposal-class-public-fields/), which is currently enabled by the Babel plugin.

## When to use which?

* When there is **no need for a component to maintain its local state, make it a functional component**.
  * Many components in your apps can be written as functional components: these components tend to be easier to write and maintain.
  * When you initially defined your component using the class component syntax, but find that it only consist of a render method, you can refactor them to be a functional component
* For more on when and why you should use stateless functional components instead of stateful class components, read [this article](https://hackernoon.com/react-stateless-functional-components-nine-wins-you-might-have-overlooked-997b0d933dbc)

## The `render` function can only return one element

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

In latest React, you can also wrap the elements in [React.Fragment](https://reactjs.org/docs/fragments.html)

```javascript

// good
const Welcome = () => {
    return (
      <React.Fragment>
        <h1>Hello world!</h1>
        <p>I come in peace</p>
      </React.Fragment>
    ); // wrapping multiple JSX elements in an enclosing tag (i.e. brackets () + <div></div>)
}
```

## A note on multi-line element

If an element span-across multiple lines, you need to wrap it with a bracket (e.g. what you see in the example above)

## Create React Components with VS Code Plugin

You can quickly create new components using [VS Code Plugin](https://marketplace.visualstudio.com/items?itemName=dsznajder.es7-react-js-snippets)

## Resources

* [Why React's stateless functional components are awesome](https://hackernoon.com/react-stateless-functional-components-nine-wins-you-might-have-overlooked-997b0d933dbc)
* [Why do I see this kind of pattern: ({...})](https://stackoverflow.com/questions/39629962/arrow-function-without-curly-braces)