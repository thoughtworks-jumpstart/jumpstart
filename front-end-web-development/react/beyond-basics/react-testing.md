
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
