# Event listeners and event handlers

* Handling events with React elements is very similar to handling events on DOM elements. There are some syntactic differences though:
  * React events are named using camelCase
  * You pass a function as the event handler, instead of calling the event handler function directly
* Naming convention:
  * Event listeners - on**Event** \(e.g. `onClick`, `onDoubleClick`\)
  * Event handler functions - handle**Event** \(e.g. `handleClick`, `handleDoubleClick`\)
* Handler functions/methods can also be passed via `props` \(because in javascript, functions/methods are just values\)

## Functional components syntax

```javascript
// functional component example
const Welcome = () => {
  return <h1 onClick={handleClick}>Welcome</h1>
}

const handleClick = (event) => {
  console.log('Welcome has been clicked!') 
  console.log(event.target) 
  // note: like in DOM, event handlers will receive an event as the first parameter
}

// the same thing, with the click handler inlined with an ES6 arrow function
const Welcome = () => {
  return <h1 onClick={() => console.log('Welcome has been clicked!'))}>Welcome</h1>
}
```

* Some examples of DOM events
  * onClick
  * onDoubleClick
  * onCopy
  * onDrag
  * onMouseDown
  * onMouseLeave
  * onScroll
  * [list of all events](https://reactjs.org/docs/events.html)

## Class components syntax

```javascript
// class component example
class Welcome extends React.Component {
  constructor() {
    super();        // this is required by React
    this.handleClick = this.handleClick.bind(this);
  }

  render() {
    return <h1 onClick={this.handleClick}>Welcome</h1>;
  }

  handleClick() {
    console.log("Welcome has been clicked!");
  }
}
```

Why do we need the following line in the constructor?

```javascript
this.handleClick = this.handleClick.bind(this);
```

This is a convention in case your event handler need to refer to `this` within its implementation. We will cover the details in the next section.

## Deboucing and Throttling the event handlers

Sometimes, the event handlers can be called too frequently due to fast input rate from the user. If you would like to reduce the rate that your event handlers are called, you can use some library to do debouncing and throttling.

Here are some articles explaining the concept:

* https://css-tricks.com/debouncing-throttling-explained-examples/
* http://demo.nimius.net/debounce_throttle/

And some articles showing you the usage of this technique:

* https://arianacosta.com/js/react/easy-event-throttling-in-react/

For React applications, you can use libraries like:

* https://github.com/nkbt/react-debounce-input
* https://github.com/niksy/throttle-debounce
