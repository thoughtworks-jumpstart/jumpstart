# React Hooks

In this chapter we will introduce Hooks (not the same as an older feature called `Lifecycle Methods/Hooks`). This a new feature rolled out in React 16.8. The hooks allow us to use state and other React features in a `Stateless Functional Component` (SFC). Previous to 16.8, state was only avaliable to `Class components`.

There are a total of 10 hooks provided in the API but we will only go through `useState()` and `useEffect()` as they are the most commonly used. 

## Learning Checklist
- Learn how `useState()` can help us to create a state in a SFC 
- Learn how `useEffect()` can work like 3 `Lifecycle methods` in a SFC :
    - `componentDidMount()`
    - `componentDidUpdate()`
    - `componentWillUnmount()`
- What are the benefits of using Hooks?
- Custom Hooks: How to reuse state and handler logic, by extracting from a SFC

## Lab

Clone the repository [React-hooks-demo](https://github.com/thoughtworks-jumpstart/react-hooks-demo)

This repo contains code from the blog post [5 Ways to convert react class components to functional components with hooks](https://scotch.io/tutorials/5-ways-to-convert-react-class-components-to-functional-components-w-react-hooks)

The blog posts discuses how to convert 5 types of React component classes and its state, to a stateless functional component with Hooks

In class we will mount each of the components to App, to check that it has the same behaviour, next we will view the code side by side and discuss the changes made  

## Scenario 1 : Class without state or lifecycle methods
## Scenario 2 : Class with state
## Scenario 3 : Class with multiple state properties
## Scenario 4 : Class with state and componentDidMount and componentWillUnmount
## Scenario 5 : Class with state, componentDidMount and componentDidUpdate


Next we will go to another blog [Why react hooks and how did we get here](https://medium.freecodecamp.org/why-react-hooks-and-how-did-we-even-get-here-aa5ed5dc96af) to understand 
- The benefits of using Hooks as opposed to classes in your new components. 
- Some rules we need to keep in mind when using Hooks

The last blog article [Simple code reuse with react hooks](https://blog.bitsrc.io/simple-code-reuse-with-react-hooks-432f390696bf) is another example of how to build your own custom hook


