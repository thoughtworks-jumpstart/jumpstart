# State Management in React Applications

## Local State vs Global State

Any non-trivial React application needs to maintain certain state information, such as the current user in session, data retrieved from backend API, etc.

The question is: where to keep those state information in the React application?

One of the choice is to use local state:

- Define stateful components to keep the state
- Lifting the state up when multiple components need the same state (and pass the state down as props)

In this course, you have been practicing how to implements local state.

Another choice is to use global state:

- Create a single state object that maintains all application state related data
- Every component that needs state information needs to subscribe to the global state object in order to get/update the application state.

The React Context feature mentioned in the previous section helps to implement global state.

## Libraries for State Management

For simple React applications, local state and React Context are probably suffice already.

For more complicated applications, you can consider to use the more powerful (and more complicated solutions).

Some of the solutions are conceptually similar to React Context (or built on top of the React Context feature). It would be easier for you to pick up:

- [unstated](https://github.com/jamiebuilds/unstated)
- [react-copy-write](https://github.com/aweary/react-copy-write)

Other libraries are more complicated:

- [redux](https://redux.js.org/)
- [mobx](https://mobx.js.org/getting-started.html)

If you would like to compare those libraries, you can visit [React State Museum](https://github.com/GantMan/ReactStateMuseum), where people demonstrate how to implement a ToDo application with various state management solutions.
