# Context

## What is React Context?

A React feature that allows us to share global state with any descendent \(even if they are not direct children\).

## Why do we need this feature? / When should we use this feature?

This is a solution to solve the "props drilling" issue.

In a typical React application, data is passed top-down (parent to child) via props, but this can be cumbersome for certain types of "global" props (e.g. current user in session, UI theme) that are required by many components within an application. 

Before the Context feature was introduced, people were forced to pass those props layer by layer, which is referred as the "props drilling" anti-pattern.

Context provides a way to share values like these between components without having to explicitly pass a prop through every level of the tree.

## API Syntax

Refer to the [official documentation](https://reactjs.org/docs/context.html)

## Examples

* [Change color theme via context](https://codesandbox.io/s/q7onr9zww6)
* [Access global user information from deeply nested components](https://github.com/thoughtworks-jumpstart/context-demo)
* Sharing the global state as well as callback to update the state, [example 1](https://reactjs.org/docs/context.html#updating-context-from-a-nested-component) and [example 2](https://github.com/thoughtworks-jumpstart/react-context-demo)

## Further reading

* [https://www.youtube.com/watch?v=9Ilq6G-VMyQ](https://www.youtube.com/watch?v=9Ilq6G-VMyQ)
* [https://medium.com/dailyjs/reacts-️-new-context-api-70c9fe01596b](https://medium.com/dailyjs/reacts-️-new-context-api-70c9fe01596b)
* [Avoiding unnecessary renders with React context](https://frontarm.com/articles/react-context-performance/)

## Resources

* [Awesome React Context](https://github.com/diegohaz/awesome-react-context)
