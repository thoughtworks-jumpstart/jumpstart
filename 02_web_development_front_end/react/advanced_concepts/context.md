# Context

A new feature in React@16.3 that allows us to share state with any descendent (even if they are not direct descendents). A solution to props drilling. 

### Steps to using React.Context
- create-react-app my-app
- concepts:
  - `Context`
    - Instantiate a context object: `const MyContext = React.createContext()`
  - `<Context.Provider value={someValue}>{this.props.children}</Context.Provider>` 
    - A provider provides a root upon which all its descendents can access variables 
    - Where we define the data that we want to pass around (i.e. **provide** to our descendents)
  - `<Context.Consumer> aFunction </Context.Consumer>` 
    - Wherever we want to access data, we wrap it in a `Context.Consumer` component
    - Note: `Context.Consumer`'s child **must** be a function. In this function, you can return your component

### Resources
- Tutorial: https://www.youtube.com/watch?v=9Ilq6G-VMyQ
- [Awesome React Context](https://github.com/diegohaz/awesome-react-context)
- Docs: https://reactjs.org/docs/context.html
- Simple demo: https://github.com/thoughtworks-jumpstart/context-demo
- Less simple demo: https://github.com/thoughtworks-jumpstart/react-context-demo/commits/master
  - Commit #1 demonstrates the old way of passing data: props drilling
  - Commit #2 demonstrates the new way of passing data: using Context API
  - Commit #3 demonstrates how we can access data anywhere by using `MyContext.Consumer`
  - Commit #3 moves each component into its own file


### Further reading
- https://medium.com/dailyjs/reacts-%EF%B8%8F-new-context-api-70c9fe01596b