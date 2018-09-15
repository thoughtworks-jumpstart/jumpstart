# JSX

## What is JSX

* JSX is a syntax extension to JavaScript. It allows us to write HTML-like syntax that compiled to React elements \(i.e. real javascript objects\)

Create a new React app with `create-react-app` and try out the following examples. 

### First React App: Hello World!

Firstly, let's print Hello World on the page!

* edit `App.js` with the example given below 
* starting the React app with `npm run start` or `yarn start`, 
* see what's rendered on [http://localhost:3000](http://localhost:3000)

```javascript
// App.js

class App extends Component {
  render() {
    return <h1>Hello World!</h1>; // HTML-like syntax 
  }
}
```

This looks simple but there are lots of the things going on behind the sense:

In public/index.html, the line below defines the root of a DOM tree that React manipulate according to what you declare in index.js. 

```html
  <div id="root"></div>
```

In index.js, we declare the React app should be rendered in the <div> element with id="root".

```javascript
ReactDOM.render(<App />, document.getElementById('root'));
```

What is this `App`? It's the React component you define in App.js

### Your First React Component

We can extract the reusable JSX snippets into their own React component. 

Edit `App.js` with the example below:

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

Here, we define a new React component called `HelloWorld` (note that the first letter `H` needs to be capitalized) and display it in App.

We can make the `HelloWorld` component more complicated.

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

### One separate file for each React component

Components are usually placed in their own files so that our code is neatly organized. Let's move the `HelloWorld` component into it's own file `HelloWorld.js`.

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

## JSX Syntax Rules

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

For more details of JSX, checkout the official guide:

* [JSX Introduction](https://reactjs.org/docs/introducing-jsx.html)
* [JSX in Depth](https://reactjs.org/docs/jsx-in-depth.html)

## Babel compiles JSX to regular JavaScript codes

JSX is an extension to regular JavaScript syntax? How can browsers recognize this new syntax? The answer is: they don't need to know about JSX at all.

Babel compiles JSX down to React.createElement\(\) calls. To see what JSX compiles to in ES5, try out your JSX syntax here: [https://babeljs.io/repl/](https://babeljs.io/repl/)

For example, the JSX snippets above gets compiled to the following javascript code without JSX. I hope you will agree JSX syntax reads more naturally.

```javascript
const ComponentOne = React.createElement("div", null, "Hello World");
const ComponentTwo = React.createElement("div", { className: "red" }, "Children Text");
const ComponentThree = React.createElement(MyCounter, { count: 3 + 5, startingPoint: someFunction() });
```