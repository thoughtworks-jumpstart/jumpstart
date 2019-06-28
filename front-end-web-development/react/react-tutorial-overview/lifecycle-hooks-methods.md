# Lifecycle hooks/methods

* Each class based React component has 11 “lifecycle methods” which you can override to run your own code at particular times in the process.
* React's lifecycle hooks
  * **Mounting**: These methods are called when an instance of a component is being created and inserted into the DOM
    * `constructor()`
    * `getDerivedStateFromProps()`
    * `render()`
    * `componentDidMount()`
  * **Updating**: An update can be caused by changes to props or state. These methods are called when a component is being re-rendered
    * `getDerivedStateFromProps()`
    * `shouldComponentUpdate()`
    * `render()`
    * `getSnapshotBeforeUpdate()`
    * `componentDidUpdate()`
  * **Unmounting**: This method is called when a component is being removed from the DOM
    * `componentWillUnmount()`
  * **Error handling**: This method is called when there is an error during rendering, in a lifecycle method, or in the constructor of any child component
    * `componentDidCatch()`
* Methods prefixed with **will** are called right **before** something happens
* Methods prefixed with **did** are called right **after** something happens.

![react lifecycle hooks](../../../.gitbook/assets/react_lifecycle_hooks.jpeg)

## Resources

* [Understanding React Component Life Cycle](https://medium.com/@baphemot/understanding-reactjs-component-life-cycle-823a640b3e8d)
* [2 new React lifecycle methods in React 16.3+](https://medium.com/@baphemot/understanding-react-react-16-3-component-life-cycle-23129bc7a705)
* [The \(new\) React lifecycle methods in plain, approachable language](https://blog.logrocket.com/the-new-react-lifecycle-methods-in-plain-approachable-language-61a2105859f3)
* [How and when to use lifecycle hooks](https://engineering.musefind.com/react-lifecycle-methods-how-and-when-to-use-them-2111a1b692b1)

