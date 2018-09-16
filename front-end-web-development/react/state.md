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

The only way to change state is by calling `this.setState()`. You can't assign value to the `state` variable directly except when you declare the initial value of that variable.

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
class Welcome extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: "world"
    };

    // This binding is necessary to make `this` refer to the component in the callback
    this.handleClick = this.handleClick.bind(this);
  }

  render() {
    return (
      <h1 onClick={this.handleClick}>
        Hello, {this.state.name}
      </h1>
    );
  }

  handleClick() {
    this.setState({ name: "bruce willis" })
  }
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
class Welcome extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: "world"
    };

    // This binding is necessary to make `this` refer to the component in the callback
    this.handleClick = this.handleClick.bind(this);
  }

  render() {
    return (
      <h1 onClick={this.handleClick}>
        Hello, {this.state.name}
      </h1>
    );
  }

  handleClick() {
    this.setState((currentState, props) => ({ name: "new " + currentState.name }))
  }
}
```

With this approach, you can derive new state from the current state. Note that `currentState` is a reference to the component state at the time the change is being applied. It should not be directly mutated. Instead, changes should be represented by building a new object based on the input from `curentState` and props of the component.

### The output of the updater is shallowly merged with state

The object returned from the `updater` argument is merged with the current `state` object.

Conceptually, this is what React does in the previous example

```javascript

Object.assign(
  state, {name: "new world"}
);

```

This means, in the `state` object, only the `name` property is overwritten with the new value. If the `state` object cotnains any other properties, those are remain unchanged.

### `setSate()` API is asynchronous

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

## What is the difference between state and props?

`props` \(short for "properties"\) and `state` are both plain JavaScript objects. While both hold information that influences the output of render, they are different in one important way: `props` get passed to the component \(similar to function parameters\) whereas `state` is managed within the component \(similar to variables declared within a function\).

To find out whether a piece of data should reside in `state` or in `props`, simply ask three questions about the piece of data:

* Is it passed in from a parent via props? If so, it probably isn’t state.
* Does it remain unchanged over time? If so, it probably isn’t state.
* Can you compute it based on any other state or props in your component? If so, it isn’t state.

## Resources

* [https://reactjs.org/docs/faq-state.html](https://reactjs.org/docs/faq-state.html)
* [setState() API](https://reactjs.org/docs/react-component.html#setstate)

