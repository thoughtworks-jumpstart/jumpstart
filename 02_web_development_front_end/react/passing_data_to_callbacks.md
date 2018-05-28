### Passing data to callbacks

There are scenarios where you want to pass data to a callback. Whether you use `.bind()` or using an ES6 arrow function, you can pass data and variables to the handlers.

Note: in the first example below, `event` need not be passed in explicitly when you bind the function. You just need to pass `event` as a parameter when defining the function.

```javascript
import React, { Component } from "react";
import logo from "./logo.svg";
import "./App.css";

class App extends Component {
  render() {
    return (
      <div
        className="App"
        // you need to pass in `this`, and you need not pass in `event`
        onClick={this.handleClick.bind(this, "pizzas", "tacos", "nachos")}
      />
    );
  }

  handleClick(a, b, c, event) {
    console.log(a, b, c, event);
  }
}

export default App;

```


```javascript
import React, { Component } from "react";
import logo from "./logo.svg";
import "./App.css";

class App extends Component {
  render() {
    const pizzas = "pizzas";
    const tacos = "tacos";
    const nachos = "nachos";
    return (
      <div
        className="App"
        // you need to pass in `event`, and you need not pass in `this`
        onClick={event => this.handleClick(pizzas, tacos, nachos, event)}
      />
    );
  }

  handleClick(a, b, c, event) {
    console.log(a, b, c, event);
  }
}

export default App;

```

read more: https://medium.freecodecamp.org/reactjs-pass-parameters-to-event-handlers-ca1f5c422b9