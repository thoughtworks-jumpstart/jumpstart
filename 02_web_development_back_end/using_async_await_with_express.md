# Using Async/Await in Express API

We often need to implement some asynchronous operations in an API. As we learnt earlier on, the common choices for implementing asynchronous logics are:

* callbacks
* promises
* async/await

In this section, we are going to learn how to use async/await feature to make async code easier to manage.

Note: async/await feature is supported by Node since version 7.6.0. If you are using an older version of Node, you cannot use it without transpilers like Babel.

To play with the examples in this workshop, you need to clone a project from our course's github repository:

```shell
git clone https://github.com/thoughtworks-jumpstart/express-playground.git
```

After you clone the project, get into the project directory, and run

```shell
yarn install
```

## Example

Take a look at the sample codes in `async_await_example.js`.

The usage of async/await is straight-forward. The only thing we need to highlight is how to handle the errors that may throw from the async functions.

Remember, the async/await function always implicitly returns a Promise. If there are any error happens within that function, someone needs to call the `catch` function on the returned promise and handle the potential error.

That's why we declare the `wrapAsync` helper function to handle this error scenario.

```javascript
const wrapAsync = fn => (req, res, next) => {
  Promise.resolve(fn(req, res, next)).catch(err => next(err));
};
```

This function takes an async function as argument, and invoke it with the request/response. If there are any error happens, the error would be passed to `catch` function and eventually passed to `next` function.

Remember, once `next` is called with an argument, Express Framework would treat the argument as an error and trigger the error handling flow.

This function is re-usable, and we can use it to wrap any async/await function. Actually, someone has already created an npm module for this purpose: [express-async-wrap](https://github.com/Greenfields/express-async-wrap)

To see this example in action, run

```shell
node async_await_example.js
```

If you send a request to <http://localhost:3000/users/gordon>, you should see a successful response.
If you send a request to <http://localhost:3000/posts/1>, you should see error returned from server side.

## Recommended Readings

* [Using Async Await in Express](https://medium.com/@Abazhenov/using-async-await-in-express-with-node-8-b8af872c0016)
* [80/20 guide to express error handling](http://thecodebarbarian.com/80-20-guide-to-express-error-handling)
