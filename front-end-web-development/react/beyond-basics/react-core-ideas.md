# Ideas and principles behind React

## Core Principles of React

* **DRY \(Don't Repeat Yourself\)**. If you spot duplicate code, extract the duplicated bits into a component that can be reused
* **Single Responsibility Principle \(SRP\)**. If a component is doing more than 1 thing and if it's getting large, it should be decomposed into multiple smaller components
* **Encapsulation**: A component's state should be known/accessible only by itself \(unless the component chooses to pass state down to its children\). Neither parent nor child components can know if a certain component is stateful or stateless, and neither should they care
* **The data flows down**: A component may choose to pass its state down as props to its child components. React is all about one-way data flow down the component hierarchy. It may not be immediately clear which component should own what state.
* **Lift state up**: When you want to aggregate data from multiple children or to have two child components communicate with each other, move the state upwards so that it lives in the parent component. The parent can then pass the state back down to the children via props, so that the child components are always in sync with each other and with the parent. 
* [**Favour composition over inheritance**](https://reactjs.org/docs/composition-vs-inheritance.html) \(i.e. put components when defining a new component in your `render()` definition. Avoid `extend`ing your own components to make new components.\) \([https://www.codementor.io/imbhargav5/extending-react-components-inheritance-composition-qo59dqili](https://www.codementor.io/imbhargav5/extending-react-components-inheritance-composition-qo59dqili)\)

## Some rules of thumb

* Use functional components \(instead of class components\) if the component doesn't need to have state
* `props` are read-only. don't update/change the value of `props` \(that's what `state` is for\)
* Never modify `this.state` directly. Use `this.setState({x: x + 1})` instead of `this.state.x = x + 1`. The only place where you can assign `this.state` is the constructor. `this.setState()` can also take in a function
* Use ternary conditional operators if possible. Example:

```javascript
// bad:
if (skyColor === 'grey') {
    <GreySkyComponent />
} else {
    <BlueSkyComponent />
}

// good:
skyColor === 'grey' ? <GreySkyComponent /> : <BlueSkyComponent />
```

* Inline `if` statement with `&&` operator:

```javascript
// bad
render() {
    if (skyColor === 'grey') {
        <GreySkyComponent />
    }
}

// good
render() {
    skyColor === 'grey' && <GreySkyComponent />
}
```

## Resources

* [React.js Frequently Faced Problems](https://dev.to/samerbuna/reactjs-frequently-facedproblems--l5g)
* [Tips to learn React and Redux](https://www.robinwieruch.de/tips-to-learn-react-redux/)

