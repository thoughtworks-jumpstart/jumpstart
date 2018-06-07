# Event listeners and event handlers

* Handling events with React elements is very similar to handling events on DOM elements. There are some syntactic differences though:
  * React events are named using camelCase
  * With JSX you pass a function as the event handler
* naming convention:
  * Event listeners - on**Event** \(e.g. `onClick`, `onDoubleClick`\)
  * Event handler functions - handle**Event** \(e.g. `handleClick`, `handleDoubleClick`\)
* handler functions/methods can also be passed via `props` \(because in javascript, functions/methods are just values\)

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

