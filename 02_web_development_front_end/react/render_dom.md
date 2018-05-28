### Rendering elements on the DOM

* To render our React components, we need to
  1. Find a **single "root" DOM node** to attach our component, and
  2. Call `ReactDOM.render()` once.
* Thereafter we need not manipulate the DOM ourselves because everything will be managed by React DOM.
* Try the following example in `index.js` of your `create-react-app` app

```javascript
// javascript
import ReactDOM from 'react-dom'
const element = <h1>Hello, world</h1>
      
ReactDOM.render(
    element,
    document.getElementById('root')
)

// html
<div id='root'></div>
```
