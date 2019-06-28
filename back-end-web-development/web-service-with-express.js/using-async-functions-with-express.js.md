# Using Async Functions with Express.js

We often need to implement some asynchronous operations in an API. As we learnt earlier on, the common choices for implementing asynchronous logics are:

* callbacks
* promises
* async/await

In this section, we are going to learn how to use async/await feature to make async code easier to manage.

Note: async/await feature is supported by Node since version 7.6.0. If you are using an older version of Node, you cannot use it without transpilers like Babel.

To play with the examples in this workshop, you need to clone a project from our course's github repository:

```text
git clone https://github.com/thoughtworks-jumpstart/express-playground.git
```

After you clone the project, get into the project directory, and run

```text
npm install
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

```text
node async_await_example.js
```

If you send a request to [http://localhost:3000/users/gordon](http://localhost:3000/users/gordon), you should see a successful response. If you send a request to [http://localhost:3000/posts/1](http://localhost:3000/posts/1), you should see error returned from server side.

## Recommended Readings

* [Using Async Await in Express](https://medium.com/@Abazhenov/using-async-await-in-express-with-node-8-b8af872c0016)
* [80/20 guide to express error handling](http://thecodebarbarian.com/80-20-guide-to-express-error-handling)

## Lab 7: Refactor Songs API to be Asynchronous with Async and Await

In all the previous labs we have been developing synchronous code in our songs route handlers.

This is not ideal as synchronous code is blocking. eg: when if we connect to a DB or other I/O task like reading a file from disk, synchronous code blocks other requests until it has completed its execution of the task. This will slow down the performance of your server.

In this lab you will need to refactor your code to be asynchronous so that while there is an I/O operation ongoing, Express can still handle other requests.

### Requirements

To simulate a real DB access using Mongoose we have refactored the code which reads or writes data to the songs array, into functions which return promises that only execute after a delay of 10 milisec.

* getSongs\(\)
* createSong\(\)
* getSong\(\)
* updateSong\(\)
* deleteSong\(\)

Your task is to refactor the 5 route handlers to use async and await together with these functions to access the songs array.

**Note:**

* Remember to run your tests to ensure that your API still works correctly after the refactoring
* You can choose to either use the `wrapAsync` function as shown in example above OR to wrap the code in your route handler with a try/catch like shown below. Both styles are equivalent. 

```javascript
router.get('/', async (req, res, next) => {
    try{
      let songs = await getSongs()
      //success logic here
    }
    catch(error){
      //error logic here
    }
});
```

### Instructions

* Navigate to the express-songs-api project folder
* Ensure that the work from your previous lab is already commited
* checkout to branch `13-add-async` to get started

```text
git checkout 13-add-async
```

### Solution

* After you have completed Lab 7, please commit all your work.
* You may optionally install the plugin **Git History Diff** for viewing the difference between git branches. This will allow you to easily compare your work with the sample solution
* [https://marketplace.visualstudio.com/items?itemName=huizhou.githd](https://marketplace.visualstudio.com/items?itemName=huizhou.githd)
* Next checkout to the solution branch and we will now walk through the sample solution

  ```text
  git checkout 14-add-async-solution
  ```

* To view the difference between your work and the sample solution go to the VS Code file explorer, right click your folder and select `GitHD: View Folder Diff` and select compare with `13-add-async` branch
* The diff sidebar will popup and you can click on the files to view the difference between your work and the sample solution.
* When viewing the diff you can temporarily toggle the sidebar with `cmd + B` to hide it.

