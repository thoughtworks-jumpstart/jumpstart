# Callback functions

> Human readable definition: a callback function === a function passed into another function as an argument.

> It's called 'callback' because it is 'called back' (i.e. invoked) by the outer function.

Callback functions (a.k.a. anonymous functions or callbacks) is fundamental to Javascript. Without callbacks, any javascript function that takes a long time to execute (e.g. reading a 100MB file) would block the javascript runtime and your program / browser screen would freeze. Callback functions are usually asynchronous, but they can also be synchronous.

### Before we dive in, an analogy.

Callbacks are like event reminders in our calendar (like in Google Calendar or iCal). 

Let's say your mom gives you a task (buy dinner in 6 hours' time, before dinner time). You wouldn't stop everything you're doing, and wait until 6 hours have passed, go buy dinner, consider this task done, and then go on with your life, right? (This is known is a **blocking operation**). Rather, you would (i) create an event in your calendar to remind you to buy dinner in 6 hours' time, (ii) go about your life, (iii) when the calendar notifies you about the reminder, you'd go and complete the task (i.e. buy dinner). (this is essentially how **asynchronous callback functions** work in Javascript)

Consider another more complicated example. Let's say you're a babysitter, and the parents of the baby gave you some instructions:
- When baby is hungry, feed him
- When baby poops, change his diaper
- When baby sleeps, turn off the TV

So, when do you change the baby's diaper? When he poops! 
And when do you feed the baby? When he's hungry!

In javascript, the phrase on the left ('baby poops') is called an **event**, and the phrase on the right ('change his diaper') is called a **callback function** or a **callback** (for short).

### Use cases for callback functions
Callback functions may sound abstract, but they have many tangible and indispensible use-cases which we will cover in this course, such as:

- higher order functions (e.g. `.map()`, `.reduce()`, `.filter()`)

```javascript
// the anonymous function inside .map() is a callback
[1,2,3,4,5].map(function(element) {  
  return element * 2
}) 

// the exact same thing, except that we use a named function instead of an anonymous function. Javascript doesn't care!
function multiplyBy2(element) {
  return element * 2
}

[1,2,3,4,5].map(multiplyBy2) // multiplyBy2() is a callback
```
- creating interactive web apps (via DOM manipulation)

```javascript
document.getElementById("some-css-id").addEventListener("click", showAwesomeAnimation);  
// showAwesomeAnimation is the callback
// notice there's no brackets() after the function. That's because adding brackets would immediately invoke the function. That's not what we want. What we want to do is to pass a function (or a handle to a function) to be invoked when the 'click' event is emitted
```

- HTTP requests 

```javascript
fetch("www.facebook.com").then(function(response) {
  // this anonymous function is the callback that will handle successful HTTP response
}, function(error) {
  // this anonymous function is the callback that will handle any errors (e.g. if facebook is down)
})

```

- Writing automated tests (using test frameworks such as `jest`)

```javascript
test("1 should be equals to 1", function() {
  expect(1).toEqual(1);
  // the anonymous function here is the callback function
})

```
- Reading/writing files asynchronously (a.k.a. async input/output or I/O)

```javascript
var fs = require("fs"); // javascript's built-in FileSystem module
 
fs.readFile("./somefile.txt", "utf8", function(err, contents) {
  console.log(contents);
  // the anonymous function here is the callback function
});
```

### Resources
- [Understand javascript callback functions](http://javascriptissexy.com/understand-javascript-callback-functions-and-use-them/)
- [Callback conventions in Node.js, how and why](http://blog.gvm-it.eu/post/22040726249/callback-conventions-in-nodejs-how-and-why)
