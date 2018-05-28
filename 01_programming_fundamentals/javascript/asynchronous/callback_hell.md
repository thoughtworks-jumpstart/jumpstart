# Callbacks

## Callbacks as Event Handlers

In the previous section on Javascript Event Loop, you see how the event handlers can be used to process events when they are ready (e.g. when a user clicks a button on browser page, or the operating system notifies Javascript engine that a file is ready to be read).

One typical way to implement event handlers is through **Callbacks**.

In the example below, the codes call `readFile()` API (this is offered by Node.JS platform) which accept an event handler. The handler would be called when the data is ready.

```javascript
const fs = require('fs');

fs.readFile('/foo.txt', function(err, data) {
  console.log(data.toString("utf-8"));
});
```

If we write code in this style, then the event loop thread would not be blocked until the data is ready. This is the secret why a single thread can handle so many different tasks concurrently.

## Handle Errors with Callbacks

You probably noticed the event handler also takes in another argument called `err`, what is this thing?

It's a convention for callbacks to take an argument which represent errors when the asynchronous task does not finish normally.

For example, if the file you are trying to read does not exist at all, the callback would be called with an error which indicates the given file does not exist.

By convention, the error is usually the first argument in the callback. This is called "[error-frist callback](http://fredkschott.com/post/2014/03/understanding-error-first-callbacks-in-node-js/)".

In case the asynchronous task finishes successfully, by convention the callback function should be called with first argument set to `null`, and subsequent arguments set to the result of running the asynchronous task.

With this kind of 'error-first' callback, typically you need to write your code this way:

```javascript
const fs = require('fs');

fs.readFile('/foo.txt', function(err, data) {
  // If an error occurred, handle it (throw, propagate, etc)
  if(err) {
    throw err;
  }
  // Otherwise, use the data
  console.log(data.toString("utf-8"));
});
```

## Callback Hell

If you keep writing code in error-first callback style, you can reach to a situation called "[callback hell](http://callbackhell.com/)"

An example is given here.

The code below tries to resize all the pictures in the specified `source` folder to the given `widths`. It makes use of the [gm](https://github.com/aheckmann/gm) library to manipulate the pictures.

The code is a bit hard to read due to the nested code structures caused by callbacks.

```javascript
const fs = require('fs');
const gm = require('gm');

const widths = [100,200,400,800];
const source = "/path/to/your/photos/";

fs.readdir(source, function (err, files) {
  if (err) {
    console.log('Error finding files: ' + err)
  } else {
    files.forEach(function (filename, fileIndex) {
      console.log(filename)
      gm(source + filename).size(function (err, values) {
        if (err) {
          console.log('Error identifying file size: ' + err)
        } else {
          console.log(filename + ' : ' + values)
          aspect = (values.width / values.height)
          widths.forEach(function (width, widthIndex) {
            height = Math.round(width / aspect)
            console.log('resizing ' + filename + 'to ' + height + 'x' + height)
            this.resize(width, height).write(dest + 'w' + width + '_' + filename, function(err) {
              if (err) console.log('Error writing file: ' + err)
            })
          }.bind(this))
        }
      })
    })
  }
})
```

## What are the solutions

Needless to say, this kind of codes are hard to read and maintain. What can we do about it?

### Refactoring Codes to Avoid Nested Structure

One of the choices is to refactor your code to extract the callbacks into separate functions so that you can avoid defining functions within other functions. That helps to keep your code indentation levels low.

Some examples can be found on [this website](http://callbackhell.com/)

### Use Other Javascript features (Promises, Async/Await)

Because of the problems introduced by callbacks, Javascript has introduced other syntax to help you write asynchronous codes. We will cover two of them in the next sections:

- promise
- async/await

## Resources

- [Callbacks](http://javascript.info/callbacks)