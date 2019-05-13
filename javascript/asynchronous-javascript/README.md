# Asynchronous JavaScript

One of the major challenges for javascript beginners is to learn how to write codes in asynchronous style.

Before we come to this chapter, we usually write codes in the following `synchronous` style:

```javascript
const result1 = doSomething();
const result2 = makeUseOf(result1);
const result3 = check(result2)
```

There is nothing wrong here, except that it may block other tasks on a JavaScript engine. Why? Because a JavaScript engine only has one thread to run all the applications concurrently. This means that two scripts cannot run at the same time; they have to run one after another. When one piece of `synchronous` task is running, all the rest tasks are blocked.

That's why codes running on JavaScript engine is usually written in `asynchronous` style, meaning all time-consuming tasks are executed in separate processes/threads, so that the JavaScript engine can quickly juggle between multiple applications, giving an illusion that every application is making progress.

It might be a bit difficult to understand what I am talking about now. No worries, let's start by understanding how JavaScript engine executes concurrent tasks.

## Examples

To help you understand the concepts in this section, we created [a project with some sample codes](https://github.com/thoughtworks-jumpstart/asynchronous-javascript-by-example)

