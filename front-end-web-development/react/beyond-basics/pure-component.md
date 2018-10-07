# React.PureComponent

By default, React components (both the function type and the class type, if it extends React.Component) will re-render whenever their parent re-renders, or whenever you change their state with setState.

An easy way to optimize a React component for performance is to make it a class, and make it extend React.PureComponent instead of React.Component. This way, **the pure component will only re-render if it’s state is changed or if it’s props have changed.** It will no longer mindlessly re-render every single time its parent re-renders; it will ONLY re-render if one of its props has changed since the last render.

## More detailed explanation on the need for PureComponent

By default, a plain React.Component has shouldComponentUpdate set to always return true. This is good because it means React errs on the side of always updating the component in case there’s any new data to show. However, it’s bad because it means React might trigger unnecessary re-renders. 

[This tutorial](https://medium.com/front-end-hacking/using-a-purecomponent-in-reacts-262972f9f1e0) includes some sample codes that triggers re-render unnecessarily. For ease of reference, I copied it below:

```javascript
import React, { Component } from "react"

export default class App extends Component {
  constructor() {
    super()
    this.state = { messages: [] }

    // binds
    this._getLastMessage = this._getLastMessage.bind(this)
    this._onMessageChange = this._onMessageChange.bind(this)
  }

  _getLastMessage() {
    const lastMessage = this.state.messages[this.state.messages.length - 1]
    return lastMessage === undefined ? "" : lastMessage
  }

  _onMessageChange(event) {
    const messages = [...this.state.messages]
    messages.push(event.target.value)
    this.setState({ messages })
  }

  render() {
    return (
      <div className="App">
        <input
          type="text"
          value={this._getLastMessage()}
          onChange={this._onMessageChange}
          style={{ margin: "10px" }}
        />
        <MessageList messages={this.state.messages} />
      </div>
    )
  }
}

class MessageList extends Component {
  render() {
    return (
      <ul>
        {this.props.messages.map((m, i) => <Message key={i} message={m} />)}
      </ul>
    )
  }
}

class Message extends Component {
  render() {
    return <li style={{ margin: "10px" }}> {this.props.message} </li>
  }
}
```

## Solve the problem with PureComponent

One way to deal with these extra re-renders is to change the shouldComponentUpdate function to check when your component needs to update.

For example,

```javascript

class Message extends Component {
  shouldComponentUpdate(nextProps) {
    if (this.props.message === nextProps.message) {
      return false
    }

    return true
  }

  render() {
    return <li style={{ margin: "10px" }}> {this.props.message} </li>
  }
}
```

Another way to stop extra re-renders is to use a PureComponent.

The issue in the codes above can be fixed by changing Message to a PureComponent.

```javascript

class Message extends PureComponent {
  render() {
    return <li style={{ margin: "10px" }}> {this.props.message} </li>
  }
}

```

## Immutable props/state should be used when PureComponent is used

if you’re passing props into a PureComponent, you have to make sure that those props are updated in an immutable way. That means, if they’re objects or arrays, you’ve gotta replace the entire value with a new (modified) object or array. 

If you modify the internals of an object or array – by changing a property, or pushing a new item, or even modifying an item inside an array – then the object or array is referentially equal to its old self, and a PureComponent will not notice that it has changed, and will not re-render. Weird rendering bugs will ensue.

This is explained in more details in [this article](https://daveceddia.com/react-redux-immutability-guide/)

## References

- [React JS: what is a PureComponent?](http://lucybain.com/blog/2018/react-js-pure-component/)
- [When to use Component or PureComponent](https://codeburst.io/when-to-use-component-or-purecomponent-a60cfad01a81)
- [Why and How to Use PureComponent in React.js](https://60devs.com/pure-component-in-react.html)