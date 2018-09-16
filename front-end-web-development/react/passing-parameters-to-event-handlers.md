# Passing parameters to event handlers

Most of the event handlers only need to take in one argument, which is the event to be handled. That argument is usually supplied by React when the handler function is called, so you don't need to worry about it.

However, there are scenarios where you want to pass some additional parameters to an event handler function. The code sample below demonstrates how you can achieve this.

Note:

* Both event handlers are doing the same thing, just using slightly different syntax for 
  * \(i\) using `.bind()` 
  * \(ii\) using an ES6 arrow function

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

Read more discussions: [ReactJS - Parameterized Event Handlers](https://medium.freecodecamp.org/reactjs-pass-parameters-to-event-handlers-ca1f5c422b9) 
