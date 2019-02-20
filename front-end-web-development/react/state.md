# state

## Why do we need state in a React component?

An React application typically needs to maintain some state information. For example, if you are building the frontend for GrabTaxi for users to book cabs in React, the React application needs to keep a lot of information in its state:

* Who is the customer?
* Location of the customer
* Which driver takes the task?
* Location of the driver

...

Where to store that information? There are typically two strategies:

* **Global State**: Store all the application state in a central place and all React components need to get state information from that single source of truth

* **Local State**: Store some state within a component, so that the component is the owner of that state and it can pass the state information to its children.

Maintaining a global state is a complex topic by itself. We will cover that later.

For now, we will focus on how to maintain local state inside a component.

## What is local state in a React component?

* `state` is a plain javascript object \(`{}`\) where we store data that is internal/local to the component
* Only components declared as a class can have its own state. Functional React components don't have state.
* State should be considered private to the component. When we violate this principle of **encapsulation** \(e.g. another component \(e.g. Navbar\) knows about another component's state \(e.g. Article\), we will end up with tightly coupled code that is hard to \(i\) understand, \(ii\) change, \(iii\) extend. **Don't do it.**
* State is reserved only for interactivity, that is, data that changes over time.

## Regarding the `useState` React hook

The following material in this section assumes you create local state in a class that extends React.Component.

You might be aware that there is an new feature introduced to React 16.8 called [React Hooks](https://reactjs.org/docs/hooks-intro.html) and one of the hooks, [useState](https://reactjs.org/docs/hooks-state.html), makes state management easier. We will discuss React Hooks in a later section and understand the foundation first.

## How to initialize state of a component?

### Initialize component state in its constructor

React components can initialize state by setting **this.state** in the **constructor\(\)**

Try the following code snippet in `index.js` of your `create-react-app` app:

```javascript
class Welcome extends React.Component {
  constructor(props) {
    super(props);
    this.state = {    // `state` is the internal data store of a component. it's just a plain ol' javascript object
      name: "world"
    };
  }
  render() {
    return <h1>Hello, {this.state.name}</h1>;
  }
}

ReactDOM.render(
  <Welcome />,
  document.getElementById("root")
);
```

### Initialize component state in instance property declaration

Another way to initialize state of a component is to declare it as an instance property of the class component.

```javascript
class Welcome extends React.Component {
  state = {
    name: "world"
  };
  render() {
    return <h1>Hello, {this.state.name}</h1>;
  }
}

ReactDOM.render(<Welcome />, document.getElementById("root"));
```

Note that this approach (i.e. declaring fields of a JavaScript class) is still an [experimental feature as of now](https://tc39.github.io/proposal-class-public-fields/). We can use it today in `create-react-app` because of the magic by Babel.

### Initialize component state in `componentDidMount`

Yet another way to initialize state of a component is to call `setState` in the `componentDidMount` lifecycle method.

Warning: according to the [official documentation](https://reactjs.org/docs/react-component.html#componentdidmount), yu should be aware of the potential performance issues caused by this approach. In short, only use this approach in some special use cases, e.g. measure the size of an element and adjust layout without the user seeing any jank. A demo can be found [here](https://codesandbox.io/s/10qy67rqw4).

One variation of this approach is, instead of calling `setState` directly in `componentDidMount`, you initiate an asynchronous operation to retrieve data from your backend API, and in the callback handler of the asynchronous operation, you can call `setState` to save the retrieved data into the component state.

## How to update `state` of a component?

The only way to change state is by calling `this.setState()`.

Warning: never modify `this.state` object directly. We will talk about this in details below.

Where can you call `setState()`? Typically in some event handlers. You can also call it in some React lifecycle methods such as `componentDidUpdate`.

### setState API

The full signature of the `setState()` API is

```setState(updater[, callback])```

Where

* `updater` is either an object with the updated state, or a function that returns updated state
* `callback` is called once `state` is updated and the component is re-rendered

### Example: `updater` can contain the new state information

Let's try the example below.

To update `this.state.name`, we call `this.setState()`. Update your code and try clicking on your `<Welcome/>` component on your browser. You should see the name is changed when you click it.

```javascript
class Welcome extends Component {
  state = {
    name: "world"
  };

  render() {
    return <h1 onClick={this.handleClick}>Hello, {this.state.name}</h1>;
  }

  handleClick = () => {
    this.setState({ name: "bruce willis" });
  };
}
```

Bonus exercise:

* Inspect the HTML elements in your browser devtools and observe that only one line of the DOM is changed when you click on the  component. This is what makes React fast

### Example: `updater` can be a function that returns updated state

Another way to call the `setState` API is to supply the `updater` argument as function with the following signature

```javascript
(state, props) => stateChange
```

We can update the example above with this new approach:

```javascript
class Welcome extends Component {

  state = {
      name: "world"
  };

  render() {
    return (
      <h1 onClick={this.handleClick}>
        Hello, {this.state.name}
      </h1>
    );
  }

  handleClick = () => {
    this.setState((currentState, props) => ({ name: "new " + currentState.name }))
  }
}
```

With this approach, you can derive new state from the current state. Note that `currentState` is a reference to the component state at the time the change is being applied. It should not be directly mutated. Instead, changes should be represented by building a new object based on the input from `curentState` and props of the component.

### A new state object is created after setState is executed

Each time when the `setState` function is executed, React clones the current state object into a new object, then it updates the cloned object with the value provided in the parameter.

Highlights:

* A new state object is created (i.e. `this.state` points to a different object after `setState` is executed)
* The previous state object remains unchanged. It's the newly cloned state object that is updated with new values.

This basically means a state object is immutable once it's created (unless you modify the state object directly).

### The output of the updater is merged with the new state object

The object returned from the `updater` argument is merged with the newly created `state` object.

Conceptually, this is what React does in the previous example

```javascript

this.state = Object.assign(
  this.state, {name: "new world"}
);

```

This means, in the newly created `state` object, only the `name` property is overwritten with the new value provided in the `setState` API. If the `state` object contains any other properties, those are remain unchanged.

### `setState()` API is asynchronous

The API call **schedules** an update to a component’s state object. When state changes, the component responds by re-rendering. 

Note that the update to the `state` may not be done immediately. For performance optimization reasons, React internally buffers a few updates to `state` and flush all the changes in one go.

If you are trying to read the value of `state` object right after calling `setState`, you may not get the latest value.

In short, think of setState() as a request rather than an immediate command to update the component. 
Refer to the [documentation of setState](https://reactjs.org/docs/react-component.html#setstate) for more details.

### How do I know when the state is updated?

Since the `setState` API call is asynchronous, we have a challenge: If we have some logic to run when the state is updated, where should I put that piece of logic?

There are two solutions.

First one, the lifecycle method `componentDidUpdate` would be called when the `state` object is updated. `setState()` will always lead to a re-render unless `shouldComponentUpdate()` returns false. 

Second one, the `setState()` API actually can take in a callback, which is called when the `state` is updated. 

Out of these two solutions, the first solution is preferred.

## Pitfalls 

### Don't update the `state` object directly!!!!

The only way to change state is by calling `this.setState()`. You can't assign value to the `state` variable directly except when you declare the initial value of that variable.

For example, the following code won't work (except in constructor):

```javascript
this.state.value = "new value";
```

Why? 

First reason: because React is not aware that the state is updated if you update the `state` object directly. Hence React won't re-render the component after you update the `state` object by yourself.

In contrast, when you call `setState`, React is aware of the state update and re-render the component correctly.

### Don't mutate existing state object

You might ask: "can I update the state object myself and then call the setState API?", like the following case:

```javascript

let items = this.state.items;
items.push(aNewItem);

this.setState({items: items});

```

With the codes above, the changes in `items` cannot be detected by React because the `items` object is the same object before and after the state update. 

One example is given in [this article](https://daveceddia.com/why-not-modify-react-state-directly/). In the example, a parent component passes some of its state as props to a child component (which happens to be a PureComponent). If you modify the `state.items` of the parent component directly instead of creating a new `items` object, the child component could not detect the change in its `items` prop and does not re-render.

Hence is generally a good practice to **avoid mutating existing state object**. If you need to update any field/value in the state, you should create a new copy of the value and call `setState`.

How can you create new values from the current one? For simple cases, you can make good use of the built-in JavaScript functions like [Object.assign](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign) and [Array's spread operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax).

For more complicated object updates, use the following libraries:

* [immer](https://github.com/mweststrate/immer)
* [microstate](https://github.com/microstates/microstates.js/)

You can find more detailed discussion on different approaches in this blog: [Handling State in React: Four Immutable Approaches to Consider](https://medium.freecodecamp.org/handling-state-in-react-four-immutable-approaches-to-consider-d1f5c00249d5)

Here is another [highly recommended article](https://daveceddia.com/react-redux-immutability-guide/) to help you understand:

* What is immutability?
* What’s a “Side Effect”?
* Why immutability is important in React
* How referential equality works in JS
* Does const enforce immutability?
* Easy state updates with immer.js

You can ignore the parts on Redux if you haven't learnt about it.

### Don't call setState in some React lifecycle methods like `render`

There are some React lifecyle methods where you should not call `setState`. You can find more discussion in [this article](https://itnext.io/react-setstate-usage-and-gotchas-ac10b4e03d60)

## What is the difference between state and props?

`props` \(short for "properties"\) and `state` are both plain JavaScript objects. While both hold information that influences the output of render, they are different in one important way: `props` get passed to the component \(similar to function parameters\) whereas `state` is managed within the component \(similar to variables declared within a function\).

To find out whether a piece of data should reside in `state` or in `props`, simply ask three questions about the piece of data:

* Is it passed in from a parent via props? If so, it probably isn’t state.
* Does it remain unchanged over time? If so, it probably isn’t state.
* Can you compute it based on any other state or props in your component? If so, it isn’t state.

## Resources

* [State FAQ](https://reactjs.org/docs/faq-state.html)
* [setState() API](https://reactjs.org/docs/react-component.html#setstate)
* [Best practices for component state in React](http://brewhouse.io/blog/2015/03/24/best-practices-for-component-state-in-reactjs.html)
* [using props to set initial state is not always an anti-pattern](https://zhenyong.github.io/react/tips/props-in-getInitialState-as-anti-pattern.html)
* [Why immutability is important](https://reactjs.org/tutorial/tutorial.html#why-immutability-is-important)