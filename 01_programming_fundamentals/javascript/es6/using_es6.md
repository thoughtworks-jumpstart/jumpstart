#### Using ES6 in a project

Many ES6 features are supported by the Chrome V8 engine (i.e. it will work in the Chrome browser and your local `node` environment). However, one major ES6 feature is not supported - the ES6 module system.

For applications running in Node environment, you have two choices:

1. Use the ES5 CommonJS syntax (`const a = require('a')`), or 
2. Compile ES6 code down to ES5 syntax using the `babel` library. To include `babel` in our project, do the following:
  - `yarn add babel-cli babel-preset-es2015` 
  - replace the `start` script in `package.json` to use: `babel-node --presets es2015 app.js` (instead of `node app.js`)

See example: https://github.com/thoughtworks-jumpstart/basic-es6-template/

For frontend applications running in Browsers, now you still need to use bundlers like [Webpack](https://webpack.js.org/) to bundle all your javascript modules into one file. 