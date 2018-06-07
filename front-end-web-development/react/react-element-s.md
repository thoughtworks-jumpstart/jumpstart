# React Element\(s\)

* Elements are the smallest building blocks of React apps
* Each React element is a **real JavaScript object** that you can store in a variable or pass around \(i.e. export, import, use, reuse\) your program.
* Example: `const myElement = <h1>Hello, world</h1>;`
* When you define `myElement` as such in JSX, underneath the syntactic sugar, it's just calling `React.createElement()`
* Try the following code snippet in `App.js`

```javascript
// App.js
const HelloWorld = <h1>Hello World!</h1>; // HTML-like syntax

class App extends Component {
  render() {
    return <HelloWorld />; // console.log(<HelloWorld />) before returning and see what it is!
  }
}
```

