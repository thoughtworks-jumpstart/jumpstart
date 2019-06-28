# React Element\(s\)

* Elements are the smallest building blocks of React apps
* Each React element is a **real JavaScript object** that you can store in a variable or pass around \(i.e. export, import, use, reuse\) your program.
* Example: `const myElement = <h1>Hello, world</h1>;`
* When you define `myElement` as such in JSX, underneath the syntactic sugar, it's just calling `React.createElement()`
* Try the following code snippet on [Babel website](https://babeljs.io/repl/)

```javascript
function hello() {
  return <div name="value">Hello world!</div>;
}
```

