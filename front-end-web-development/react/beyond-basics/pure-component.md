# React.PureComponent

## What problem does it solve?

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

## References

- [React JS: what is a PureComponent?](http://lucybain.com/blog/2018/react-js-pure-component/)
- [When to use Component or PureComponent](https://codeburst.io/when-to-use-component-or-purecomponent-a60cfad01a81)
- [Why and How to Use PureComponent in React.js](https://60devs.com/pure-component-in-react.html)