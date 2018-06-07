# props

* `props` is is short-form for **properties**
* `props` is **the way** to pass data into a component
* Remember React components are just plain ol' javascript objects? As such, think of a component's props as a plain javascript object's properties \(i.e. key-value pairs\)
* How to define props:

  ```javascript
  const Welcome = (props) => {
    console.log(props); // see props for yourself!
    return (            // note: for multiline return statements, we need to wrap them in brackets and a <div></div>
        <div>
            <h1>hello, here are my props</h1>
            <p>{props.name}</p>
            <p>{props.prop1}</p>
            <p>{props.iCanNameThisAnything}</p>
        </div>
        );
    }
  ReactDOM.render(
      <Welcome name="bob" prop1='something' iCanNameThisAnything='anything' />
      document.getElementById('root')
  )
  ```

  * a few things to note:

    * `props` itself is an object
    * props are **read-only**. Any attempt to change any keys/values will result in an error
    * in a **function component**, props must be passed in as a function parameter
    * in a **class component**, `props` is accessible via `this.props`. Example:

    ```javascript
    class Welcome extends React.Component {
        render() {
            return <h1>Hello, {this.props.name}</h1>;
        }
    }
    ```

