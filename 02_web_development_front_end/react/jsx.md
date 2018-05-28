### [JSX](https://reactjs.org/docs/introducing-jsx.html)

* JSX is a syntax extension to JavaScript. It allows us to write HTML-like syntax that compiled to React elements (i.e. real javascript objects)
* Babel compiles JSX down to React.createElement() calls. To see what JSX compiles to in ES5, try out your JSX syntax here: https://babeljs.io/repl/

* Try out the following examples in `App.js` and see what's rendered on http://localhost:3000


```javascript
// App.js
const HelloWorld = () => {
  return <h1>Hello World!</h1>; // HTML-like syntax
};

class App extends Component {
  render() {
    return <HelloWorld />; // console.log(<HelloWorld />) before returning and see what it is!
  }
}
```

This allows us to use javascript logic in creating UI elements

```javascript
// App.js
const HelloWorld = () => {
  const people = ["alice", "tim", "jane"];
  return people.map(person => <h1>Hello {person.toUpperCase()}</h1>); // We can put any JavaScript expression within braces `{}`
};

class App extends Component {
  render() {
    return <HelloWorld />;
  }
}
```

Components are usually placed in their own files so that our code is neatly organised

```javascript
// HelloWorld.js
import React from 'react'

const HelloWorld = () => {
    return (
        <h1>Hello World!</h1>
    )
}

export default HelloWorld

// App.js
// remove definition of HelloWorld from App.js
class App extends Component {
  render() {
    return <HelloWorld />;
  }
}
```

#### JSX Syntax Rules

Here are the JSX syntax rules that you should be aware of

```jsx
// Rule #1: All Javascript syntax rules about variables, functions, classes, etc. apply
// Rule #2: You can write "HTML-like" syntax
const ComponentOne = <div>Hello World</div>  

// Rule #3: To add a HTML class, we use the `className` attribute
const ComponentTwo = <div className="red" id="some-awesome-id">Children Text</div>; 

// Rule #4: To write javascript expressions inside HTML-like tags, use braces `{}`
const ComponentThree = <MyCounter count={3 + 5} startingPoint={someFunction()}/>; 
```

The above gets compiled to the following javascript code without JSX. I hope you will agree JSX syntax reads more naturally.
```javascript
const ComponentOne = React.createElement("div", null, "Hello World");
const ComponentTwo = React.createElement("div", { className: "red" }, "Children Text");
const ComponentThree = React.createElement(MyCounter, { count: 3 + 5, startingPoint: someFunction() });
```