# Testing Async Functions with Jest

In previous sections, we have learned that some of the functions can be async (e.g. a function that tries to retrieve some data from another web server on the Internet). If we need to write test cases for those functions, we need to be careful.

Check out [jest documentation on how to test asynchronous functions](https://jestjs.io/docs/en/tutorial-async).

## Lab

[Here is a project](https://github.com/pinglinh/tutorial-the-guardian-search-app/tree/functional-app). The application allows you to search articles on Guardian.

Your task is to write a test case for the App.js:

- You need to mock the implementation of `fetchArticles()` in `api/index.js` to control what articles are return
- You need to write a test case to verify the returned articles are displayed properly by the App.js component

## Recommended Reading

* [Testing Async JavaScript & API Calls](http://frontend.turing.io/lessons/module-3/testing-async.html)