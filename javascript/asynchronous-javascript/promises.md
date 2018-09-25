# Promises

## What is a Promise?

> The `Promise` object represents the eventual completion \(or failure\) of an asynchronous operation, and its resulting value.

Let's take one example.

This Friday is my wife's birthday. On Monday, I told her "I will have dinner with you on Friday". This is a **Promise**.

Before Friday, this promise is in **pending** state, and on Friday, it will be **resolved**.

At that time, there are two possible outcomes:

* I book a nice restaurant and have dinner with my wife. In that case, the promise is **fulfilled**.
* I got an urgent meeting on Friday evening, so I have to call my wife and tell her I couldn't have dinner with her. In this case, the promise becomes **rejected**.

Knowing that I don't always keep my promise \(based on my previous records\), my wife has the following plans:

* If the promise is **fulfilled**, she will buy me a gift in return.
* If the promise is **rejected**, she will let me sleep on the couch.

And she will observe the outcome of the promise and take actions accordingly.

One important property about the promise is that it can only be either fulfilled, or rejected. There is no 3rd outcome, and it cannot be both fulfilled and rejected at the same time.

Another important property about this promise is, after this Friday, once it's resolved, it will become either "fulfilled" or "rejected" and it would **remain in that resolved state forever**. Even if I look back at this promise after one year, the fact that I keep it \(or I don't\) does not change after this Friday.

It also worths highlighting that there are two parties/roles in this story:

* One party that creates a promise and finally decide if the promise should be fulfilled or rejected.
* The other party that receives the promise, observes on the outcome, and takes actions accordingly.

## ES6 Promise API

Let's write some codes using the promise API in ES6 to represent the example above.

We will first learn:

* How to create a new Promise
* How to notify the observers of the Promise when it's resolved (either fulfilled or rejected)

### Creating a new Promise

```javascript
const dinnerPromise = new Promise(function(resolve, reject) {
  const waitTillThisFriday = 5000;
  setTimeout(() => {
    try {
      finishMyWorkOnFriday();
      const restaurant = bookRestaurant();
      const flower = buyFlower();
      resolve({ restaurant, flower });
    } catch (badNews) {
      reject(badNews);
    }
  }, waitTillThisFriday);
});
```

Note that this Promise constructor takes in one callback function \(called **executor**\). The executor function basically does some **asynchronous task**, and invoke either `resolve` or `reject` based on the result of that asynchronous task.

What is this `resolve` and `reject` parameter? Those two are callbacks supplied by the Promise constructor implementation. When one of those callbacks is called, the promise is changed from `pending` state to either `fulfilled` state, or `rejected` state.

Note that we can pass some parameters to the `resolve` callback. Those parameters would be available to those who subscribe to the success resolution event of the promise. We can also pass the error to the `reject` callback, which is then available to those who subscribe to the error notification of the promise.

Note that this Promise constructor calls the executor function right away \(before the Promise constructor function returns\). So typically you should not call any blocking API inside the executor function implementation. Otherwise, the Promise constructor call would be blocked.

At last, if there are any error thrown from the executor function, the promise is also rejected automatically.

### Observe the outcome of Promise

Now let's see how one can handle the outcome of a promise.

Once an instance of Promise is created, it can be observed and you can register your interests on the outcome via the `then` API.

```javascript
const onFulfilled = ({restaurant, flower}) => {...}
const onRejected = (badNews) => {...}

dinnerPromise.then(onFulfilled, onRejected);
```

The `then` function takes two arguments:

* The first argument is called `onFulfilled`, which is a callback function to handle the case when the promise is resolved. Note that the `onFulfilled` function receives the same list of arguments as received by the `resolve` function in executor function.
* The second argument is called `onRejected`, which is a callback function to handle the case when the promise is rejected. Note that the `onRejected` function receives the same list of arguments as received by the `reject` function in executor function.

Although the `then` function can take in the `onRejected` event handler, sometimes people prefer to call `then` function with one argument only. In that case, the reject event needs to be caught by a call to `catch` function. e.g.

```javascript
dinnerPromise.then(onFulfilled).catch(onRejected);
```

### API calls on a Promise can be chained

You may notice that in the code example above the calls on the promise instance are chained. We call `catch` function on the object returned from the `then` function. Why can we do it this way?

That's because all methods supported by this promise object returns another promise as return value. Specifically, those methods \(e.g. `then` and `catch`\) all behave in this way:

* If it finds a proper handler for the `resolve` or `reject` event, it return a new promise which eventually resolves to the return value of the handler.
* If it does not find a proper handler for the `resolve` or `reject` event \(e.g. when a promise is rejected and a call to `then` function does not supply `onRejected` callback\), the method would return the original promise.

Let's look at another example.

In the example below, the `users.get(userId)` returns an instance of Promise object, so that we can call `then` function on it.

```javascript
function getUserSkills(userId) {
  return users
    .get(userId) 
    .then(user => {
      console.log(`Got user ${JSON.stringify(user)}`);
      return users.getMetaDataFor(user);
    })
    .then(userMetaData => {
      console.log(`Got metadata for user ${JSON.stringify(userMetaData)}`);
      return userMetaData.skills;
    })
    .catch(error => console.error(error));
}
```

If you find the codes above hard to understand, here is another version that written in synchronous/blocking style which you may be more familiar with:

```javascript
function getUserSkills(userId) {
  try {
    let user = users.get(userId); // assuming get() API is a blocking/synchronous API
    let userMetaData = users.getMetaData(user); // assuming getMetaData is a blocking/synchronous API 
    let skills = userMetaData.skills;
    return skills;
  } catch (error) {
    console.error(error);
  }
}
```

In this synchronous version, you call multiple functions and each function use the result of calling the previous function.

The asynchronous version using the Promises achieves the same effect, except that they are using callbacks and not blocking.

### Throwing errors from onFulfilled or onRejected handlers

If you ever call `throw error` yourself in the onFulfilled or onRejected handlers, or those handlers call some other function that throws errors, the call to `then` or `catch` would return a new promise that is rejected with the error received by the handler.

For example:

```javascript
function getUserSkills(userId) {
  return users
    .get(userId)
    .then(user => {
      throw new Error("Cannot find meta data for user", JSON.stringify(user));
    })
    .then(userMetaData => {
      console.log(`Got metadata for user ${JSON.stringify(userMetaData)}`);
      return userMetaData.skills;
    })
    .catch(error => console.error(error));
}
```

The first call to `then` function above would return a promise that is rejected with error. The second call to `then` does not provide any handler for rejection, so it's skipped and the event handler in `catch` would catch this error.

Note that this error is not thrown out of the `getUserSkills` function at all. It's handled by generating a console log. Then the error handler didn't return anything, so the caller of `getUserSkills` would get a Promise that's resolved to `undefined`.

### onFulfilled or onRejected handlers are always executed asynchronously

When an the Promise implementation needs to invoke a onFulfilled or onRejected handler, it will always execute the handler in the next tick, i.e. it will do something like

```javascript
setTimeout(handler,0);
```

That means those handlers supplied to `then` or `catch` call \(in the example above\) would NOT be called in the same call stack as then `then` or `catch` function.

## An Use Case Study

Many operations in Javascript are asynchronous - for example: fetching data via HTTP, reading from a file, event handlers, etc.

For the following example, first visit [https://carparks-sg.herokuapp.com/api](https://carparks-sg.herokuapp.com/api) on your browser to see what the HTTP request should return.

Then look at this piece of code below, what do you think the value of `result` will be? Is it the list of available car park slots?

Run this in the Chrome console. Did it match your expectation?

```javascript
const result = fetch('https://carparks-sg.herokuapp.com/api')
console.log('Done!')
console.log(result)
```

In the above example, because `fetch` returns a `Promise`, `result` is a `Promise` object.

```javascript
let result = fetch('https://carparks-sg.herokuapp.com/api')
console.log('Done!')

result.then(data => {
  console.log(data)
})
```

To see the data as we see it in our browser, we need `data.json()`

```javascript
let result = fetch('https://carparks-sg.herokuapp.com/api')
console.log('Done!')

result.then(data => {
  console.log(data.json())
})
```

## Common Mistakes

You will definitely makes some mistakes before you fully master the Promise API. Here are a few examples.

### Mistake: Unhandled Promise Rejections

One of the mistakes is you forget to handle errors that may be thrown from the promise.

If we remove the call to `catch` in the previous example:

```javascript
function getUserSkills(userId) {
  return users
    .get(userId)
    .then(user => {
      console.log(`Got user ${JSON.stringify(user)}`);
      return users.getMetaDataFor(user);
    })
    .then(userMetaData => {
      console.log(`Got metadata for user ${JSON.stringify(userMetaData)}`);
      return userMetaData.skills;
    });
}
```

If there are any errors thrown from the database lookup, or the `getMedataDataFor` function, the promise would become rejected. Since we don't handle the rejection here, and assuming nobody else handle this error, then it becomes an [unhandled promise rejection](http://thecodebarbarian.com/unhandled-promise-rejections-in-node.js.html)

### Mistake: Handle Rejected Promises with try..catch

You probably get use to handle errors in Javascript using try..catch syntax, and you would like to handle errors from promises using that syntax too. Unfortunately, that won't work.

For example:

```javascript
function callMyPromise() {
  try {
    const userNamePromise = getUserSkills('gordon');
    userNamePromise.then(userName => console.log(userName)).catch(error) => throw error);
  } catch(error) {
    console.error("Failed in getting user name", error);
  }
}
```

That does not work because Promise implementation ensures the callbacks to `then` or `catch` is not executed in the current Call Stack \(i.e. the callbacks are always put back to the Event Queue first and executed in later ticks\).

This means the `callMyPromise` function would return before any callback handler passed to `then` or `catch` is called. The try...catch block here won't catch any error, and later when the error indeed happens, that error is thrown from the error handler function, and eventually becomes an unhandled promise rejection \(the `catch` call returns a promise that's rejected, and nobody handles that rejected promise.\)

### Mistake: Create a local instance of Promise and not return it

Look at the example below, what value would be returned from this function?

```javascript
function getUserSkills(userId) {
    users
    .get(userId)
    .then(user => {
      console.log(`Got user ${JSON.stringify(user)}`);
      return users.getMetaDataFor(user);
    })
    .then(userMetaData => {
      console.log(`Got metadata for user ${JSON.stringify(userMetaData)}`);
      return userMetaData.skills;
    })
}
```

Although there are some `return` statements in the codes above, don't be confused by them. They are the return statements from the callbacks, and not the return statements for `getUserSkills` function.

If we miss the `return` statement before `users.get..`, the caller of this function would get `undefined` result.

Another example of forgetting returning the promise is in the example below:

```javascript
test('the fetch fails with an error', () => {
  expect.assertions(1);
  expect(fetchData()).rejects.toMatch('error'); // we are missing return statement here if `fetchData` returns Promise
});
```

Assuming the `fetchData` function returns a Promise. This is a [test case for some asynchronous function written in Jest](https://facebook.github.io/jest/docs/en/asynchronous.html). We need to use the `return` statement so that Jest knows this test calls an asynchronous function and it needs to wait for the promise to resolve before it end the test function.

Without the `return` statement, the test case would finish without running the `fetchData` at all.

### Mistake: Forget to wait for a promise function to resolve

Sometimes, you may call a function that returns promise, but you forget about this fact and use it like a synchronous function \(i.e. assuming once the function returns, all the task is done\). This can leads to bugs that are hard to find.

For example:

```javascript
db.connect();
db.execute_statement(...);
```

Assuming the `connect` API returns a promise, and when that promise is resolved, you can start to execute statement with the database.

The code above does not work because when the `execute_statement` is called, the database connection may not be established yet.

So the correct way of using the API should be

```javascript
db.connect().then(() => 
  const execution = db.execute_statement(...);
  execution.then(...).catch(...)
);
```

### Mistake: Missing the return statement in onFulFilled or onRejected handlers

Remember the returned result from `onFulfilled` or `onRejected` handler is used as argument for the next handler in the promise chain, so if some handler forget to return anything, then the next handler would get `undefined` in their arguments.

For example:

```javascript
function getUserSkills(userId) {
  return users
    .get(userId)
    .then(user => {
      console.log(`Got user ${JSON.stringify(user)}`);
      users.getMetaDataFor(user); // missing return statement here
    })
    .then(userMetaData => {
      console.log(`Got metadata for user ${JSON.stringify(userMetaData)}`);
      userMetaData.skills; // missing return statement here
    })
    .catch(error => console.error(error));
}
```

Note that the result from `getMetaDataFor` function is not returned, that means the next handler which is expecting `userMataData` as the argument would get `undefined` parameter value.

## Other Promise Implementations

After this `Promise` idea was proposed, there were quite a few open source implementations before it's supported in ES6 by default. One of them is [bluebird](http://bluebirdjs.com/docs/getting-started.html) and another one is called [Q](http://documentup.com/kriskowal/q/). Most of them support similar API as the one offered in ES6, and we can even mix them together.

## How to convert API that only support callbacks to return a Promise instead

We see promises are useful tools to handle asynchronous tasks, but how can we deal with existing functions that are written in a way to take callback as arguments?

Node.js comes with a utility function called `promisify`, which takes a regular callback-taking function as an argument and returns its promisified version. e.g.

```javascript
const { promisify } = require("util");
const { readFile } = require("fs");
const readFilePromise = promisify(readFile);

// Original callback-style readFile
readFile("path/to/file", "utf8", (err, data) => {
  if (err) {
    console.error(err);
    return;
  }

  console.log(data);
});

// Promisified version
readFilePromise("path/to/file", "utf8")
  .then(data => {
    console.log(data);
  })
  .catch(error => {
    console.error(error);
  });
```

* util.promisify docs: [https://nodejs.org/api/util.html\#util\_util\_promisify\_original](https://nodejs.org/api/util.html#util_util_promisify_original)
* More information on how util.promisify works: [http://2ality.com/2017/05/util-promisify.html](http://2ality.com/2017/05/util-promisify.html)

## Resources

* [Promise Basics](http://javascript.info/promise-basics)
* [Promise Chaining](http://javascript.info/promise-chaining)
* [Promise API](http://javascript.info/promise-api)
* [Three ways of understanding promises](http://2ality.com/2016/10/understanding-promises.html)
* [Promises in ES6 \(youtube video\)](https://www.youtube.com/watch?v=2d7s3spWAzo)
* [Escape from the Callback Mountain](https://github.com/justsml/escape-from-callback-mountain)
* [JavaScript Promises with Node.js](https://itnext.io/javascript-promises-with-node-js-e8ca827e0ea3)
* [Promise Fun](https://github.com/sindresorhus/promise-fun)
* [Promise Tips](https://dev.to/kepta/promising-promise-tips--c8f)
* [Javascript Promises for Dummies](https://scotch.io/tutorials/javascript-promises-for-dummies)
* [Write your own promise library from scratch](http://thecodebarbarian.com/write-your-own-node-js-promise-library-from-scratch.html)
* [Master the Javascript Interview: What's a Promise](https://medium.com/javascript-scene/master-the-javascript-interview-what-is-a-promise-27fc71e77261)

## Assignments

Here is a useful workshop that illustrates the basics of promises. Follow the instructions step by step to get some hands-on exercises on Promise.

* [Promise it won't hurt](https://github.com/stevekane/promise-it-wont-hurt)

