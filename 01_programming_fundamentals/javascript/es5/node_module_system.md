# Node(CommonJS) Module System

## What is a Module?

Simply put, a Javascript module is a file which contains some javascript codes that can be reused.

To make those code reusable, the module needs to declare what to be **exported** from the module, and on the other hand, the codes that depend the module need to declare what to be **imported** from the module.

## What is a Module System

It's a set of conventions to define:

- How to export functionalities from a module
- How to import functionalities from a module
- When loading the dependencies, how to load them (e.g. are they loaded in the same order as the `import` or `require` statements)

In ES5, there are two popular modular systems:

- AMD, which is adopted by the browsers
- CommonJS, which is adopted by Node.JS

In ES6, there is a module system defined to cover both browser environment and Node.JS environment, which is usually referred as ESM (ES6 Module).

For more details, read [The mind-boggling universe of JavaScript Module strategies](https://www.airpair.com/javascript/posts/the-mind-boggling-universe-of-javascript-modules)

In this section, we mainly look at the CommonJS module system, which gets popular because of the Node.JS environment.

## How to Export/Import Functionalities from a Module

### Exporting/Importing a Function

In module `add.js`

```javascript
function add(x,y){
    return x+y;
}

module.exports = add;
```

In module `main.js`

```javascript
var adder = require('./add');

console.log(adder(1,100));
```

### Exporting/Importing an Object

In module `calculator.js`

```javascript
function add(x,y){
    return x+y;
}

function subtract(x,y){
    return x-y;
}

module.exports = {
  add: add,
  sub: subtract
};
```

In module `main.js`

```javascript
var utils = require('./utils');

console.log(utils.add(1,100));
console.log(utils.sub(100,1));
```

### A Shortcut for `module.exports`

The above example in `calculator.js` can also be re-written as

```javascript
function add(x,y){
    return x+y;
}

function subtract(x,y){
    return x-y;
}

exports.add = add;
exports.sub = subtract;
```

The `exports` is an alias of `module.exports` (i.e. both point to the same object that is initialized **before** a module is loaded).

Note that you cannot re-assign the `exports` variable to another object. The following code won't work.

```javascript
exports = {
  add: add,
  sub: subtract
};
```

You have to use `module.exports` instead of `exports` if you need to re-assign that variable to a different object.

## The Node Module Registry

The [NPM Registry](https://www.npmjs.com/) is a place for people to publish their node modules. Anyone can do it. Even [you can do it too!](https://docs.npmjs.com/getting-started/publishing-npm-packages#how-to-publish-a-package)

## Keep your node modules small

If you have a look at the node modules on the NPM registry, you can find that most of them are small, e.g.

- Most of them only do one thing, each of them is more like a function
- Each of them usually only have one small public interface, which is exposed via the `module.exports` object.

This follows the Unix philosophy of building tools - "Do One Thing and Do It Well".

## Resources

- [How the module system, CommonJS & require works](https://blog.risingstack.com/node-js-at-scale-module-system-commonjs-require/)