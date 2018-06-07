# Passing data to callbacks

There are scenarios where you want to pass data to a callback function. The code sample below demonstrates how you can achieve this.

Note:
- Both event handlers are doing the same thing, just using slightly different syntax for 
  - (i) using `.bind()` 
  - (ii) using an ES6 arrow function

```javascript
import React, { Component } from "react";
import "./App.css";

class App extends Component {
  render() {
    return (
      <div>

        {/* using .bind()*/} 
        <h1 onClick={this.handleClick.bind(this, "pizzas", "tacos", "nachos")}>
          Click me!
        </h1>

        {/* using an arrow function*/} 
        <h1 onClick={event => this.handleClick("pizzas", "tacos", "nachos", event)}>
          Click me!
        </h1>

      </div>
    );
  }

  handleClick(a, b, c, event) {
    console.log(a, b, c, event);
  }
}

export default App;
```


read more: [https://medium.freecodecamp.org/reactjs-pass-parameters-to-event-handlers-ca1f5c422b9](https://medium.freecodecamp.org/reactjs-pass-parameters-to-event-handlers-ca1f5c422b9)

