# Module System

When you have a lot of codes, you need to split them into separate files called modules.

## What is a Module?

Simply put, a JavaScript module is a file which contains some javascript codes that can be reused.

To make those code reusable, the module needs to declare what to be **exported** from the module, and on the other hand, the codes that depend the module need to declare what to be **imported** from the module.

## What is a Module System

It's a set of conventions to define:

* How to export functionalities from a module
* How to import functionalities from a module
* When loading the dependencies, how to load them \(e.g. are they loaded in the same order as the `import` or `require` statements\)

In ES5, there are two popular modular systems:

* AMD, which is adopted by the browsers
* CommonJS, which is adopted by Node.JS

In ES6, there is a module system defined to cover both browser environment and Node.JS environment, which is usually referred as ESM \(ES6 Module\).

For more details, read [The mind-boggling universe of JavaScript Module strategies](https://www.airpair.com/javascript/posts/the-mind-boggling-universe-of-javascript-modules)

