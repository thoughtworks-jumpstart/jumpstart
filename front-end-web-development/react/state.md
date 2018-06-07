# state

* `state` is a plain javascript object \(`{}`\) where we store data that is internal to the component

```javascript
class SuggestedFriendsPage extends React.Component {
  constructor() {
    super();
    this.state = {    // `state` is the internal data store of a component. it's just a plain ol' javascript object
      friends: ["alice", "tim", "june", "bob"];
    };
  }

  render() {
    return friends.map(friend => <FriendProfileCard friend={friend} />)
  }
}
```

## How to work with `state`

* React components can initialize state by setting **this.state** in the **constructor\(\)**
* The only way to change state is by calling `this.setState()`
  * Whenever `this.setState()` is called, an update to the component is scheduled, causing React to merge in the passed state update and rerender the component along with its descendants
* State should be considered private to the component. When we violate this principle of **encapsulation** \(e.g. another component \(e.g. Navbar\) knows about another component's state \(e.g. Article\), we will end up with tightly coupled code that is hard to \(i\) understand, \(ii\) change, \(iii\) extend. **Don't do it.**
* State is reserved only for interactivity, that is, data that changes over time.

Try the following code snippet in `index.js` of your `create-react-app` app:

```javascript
class Welcome extends React.Component {
  constructor() {
    super();
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

To update `this.state.name`, we call `this.setState()`. Update your code and try clicking on your `<Welcome/>` component on your browser

```javascript
class Welcome extends React.Component {
  constructor() {
    super();
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
* Temporarily comment out `this.handleClick = this.handleClick.bind(this);` in the constructor. Add `console.log(this)` in `handleClick()` and see what `this` is

## What is the difference between state and props?

`props` \(short for "properties"\) and `state` are both plain JavaScript objects. While both hold information that influences the output of render, they are different in one important way: `props` get passed to the component \(similar to function parameters\) whereas `state` is managed within the component \(similar to variables declared within a function\).

To find out whether a piece of data should reside in `state` or in `props`, simply ask three questions about the piece of data:

* Is it passed in from a parent via props? If so, it probably isn’t state.
* Does it remain unchanged over time? If so, it probably isn’t state.
* Can you compute it based on any other state or props in your component? If so, it isn’t state.

## Resources

* [https://reactjs.org/docs/faq-state.html](https://reactjs.org/docs/faq-state.html)

