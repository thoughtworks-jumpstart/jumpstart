# babel

## What is Babel

[Babel](https://babeljs.io/) is a transpiler that convert cutting edge/experimental/exotic JavaScript syntax into the ES5 syntax that the JavaScript engines in browser/node environment can execute.

## Why do we need Babel

Use cases

* Transpile ES6 syntax into ES5 syntax
* Transpile JSX syntax \(the one used by React\) into pure JavaScript

## How to use Babel

Babel supports a [plugin based architecture](https://babeljs.io/docs/en/plugins) to make the transpiling process configurable.

You need to configure in your project root directory, using `babel.config.js` or `.babelrc` file. More details can be found in their [official documentation](https://babeljs.io/docs/en/configuration)

### Babel Presets

If you don't want to configure the set of babel plugins by yourself, you can also use pre-defined set of plugins called [presets](https://babeljs.io/docs/en/presets) such as [preset-env](https://babeljs.io/docs/en/babel-preset-env) and [preset-react](https://babeljs.io/docs/en/babel-preset-react)

## Resources

* [Why Babel matters](https://codemix.com/blog/why-babel-matters/)

