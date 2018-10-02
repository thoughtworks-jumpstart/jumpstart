# Testing React Components

## Terminology

To start with, let's define the terms below:

- System Under Test
- Unit Test
- Integration Test
- Dependency
- Mocking
- Testing Framework/Harness

## Guidelines

### Bad Practices

The following practices are considered bad because they tie your test cases to the implementation details of the React component under testing and make test cases harder to maintain:

- get/set state of the React component in your tests
- get an instance of the React component and call instance methods (which usually should be triggered by some browser events)

### Good Practices

In general, the principles followed by the [react-testing-library](https://github.com/kentcdodds/react-testing-library#guiding-principles) are good:

> The more your tests resemble the way your software is used, the more confidence they can give you.

This basically requires your test cases treat the component under test as a black box and interact with it in the same way how real users interact with it.

## Useful Libraries and Tricks

### About Enzyme

[Enzyme](https://github.com/airbnb/enzyme) is a library developed by Airbnb for testing React components. It's still quite popular now but its API encourages some bad practices for testing (e.g. setting the state of the component under testing directly).

In this course, we recommend to use `react-testing-library` instead.

### Snapshot Testing with Jest

Jest provides a feature called [snapshot testing](https://jestjs.io/docs/en/snapshot-testing). You can use snapshot testing to prevent unexpected changes to the DOM structure of a React component.

Here is roughly how it works:

- When you know your component under testing looks good, you can save a snapshot of it.
- Next time, if you make some changes to the component and it renders differently, the test case would fail.
- You have a chance to check if the change is intended. If yes, accept the change and update the snapshot. Otherwise, fix the issue.

Note that the snapshot are usually saved into a directory (like `__snapshots__`). You should check these snapshots into your code repository as well.

#### Exercise for SnapShot Testing

Add a snapshot tests for some components you wrote before, e.g. the ones in [React Todo List](https://github.com/thoughtworks-jumpstart/react-todo-list)

### Test Driven Development with react-testing-library

- [react-testing-library]
- [jest-dom]

#### Exercises for Testing with react-testing-library

- Extend the [React Todo List](https://github.com/thoughtworks-jumpstart/react-todo-list) and add unit tests for your components. After you finish adding unit tests to the components, you can start from scratch again by implementing the components following Test Driven Development style.

- [Here is a project](https://github.com/pinglinh/tutorial-the-guardian-search-app/tree/functional-app). The author showed how you can write unit test with a library called Enzyme. You can try to convert the unit tests to use `react-testing-library`.

### Testing Async Functions with Jest

In previous sections, we have learned that some of the functions can be async (e.g. a function that tries to retrieve some data from another web server on the Internet). If we need to write test cases for those functions, we need to be careful.

Let's go through [jest documentation on how to test asynchronous functions](https://jestjs.io/docs/en/tutorial-async).

#### Exercise for Async Function Testing

[Here is a project](https://github.com/pinglinh/tutorial-the-guardian-search-app/tree/functional-app). The application allows you to search articles on Guardian.

Your task is to write a test case for the App.js:

- You need to mock the implementation of `fetchArticles()` in `api/index.js` to control what articles are return
- You need to write a test case to verify the returned articles are displayed properly by the App.js component
