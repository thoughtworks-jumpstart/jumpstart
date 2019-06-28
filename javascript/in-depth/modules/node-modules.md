# CommonJS Modules

In this section, we mainly look at the CommonJS module system, which gets popular because of the Node.JS environment.

## How to Export/Import Functionalities from a CommonJS Module

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

In module `main.js`, we could also import the `add` and `sub` function explicitly:

```javascript
var {add, sub} = require('./utils');

console.log(add(1,100));
console.log(sub(100,1));
```

Note that this is not a new magic, we are just applying the object destructuring feature we have talked about in this case.

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

The `exports` is an alias of `module.exports` \(i.e. both point to the same object that is initialized **before** a module is loaded\).

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

* Most of them only do one thing, each of them is more like a function
* Each of them usually only have one small public interface, which is exposed via the `module.exports` object.

This follows the Unix philosophy of building tools - "Do One Thing and Do It Well".

## Resources

* [How the module system, CommonJS & require works](https://blog.risingstack.com/node-js-at-scale-module-system-commonjs-require/)

