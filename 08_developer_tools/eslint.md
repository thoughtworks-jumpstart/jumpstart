# ESLint

## What is ESLint

[ESLint](https://eslint.org/) is, as the website describes, the **"pluggable linting utility for JavaScript and JSX."**

Linters reports many syntax errors and potential run-time errors. ESLint also reports deviations from specified coding guidelines. Error messages identify the violated rules, making it easy to adjust their configuration if you disagree with the defaults.

Languages that require compilers have a way to give feedback to developers before code is executed. Since JavaScript doesn't require a compiler, linters are needed to play that role.

You can take a look at [the type of issues that can be detected by ESLint](https://eslint.org/docs/rules/).

## Installing ESLint

To install ESLint, simply run the following command in your project root folder:

```shell
yarn add --dev eslint
```

Note that the ESLint documentation recommends to install the tool globally, but that's a bad idea. We may use different linter tools for different projects, so it's a good practice to install such project-specific tools at project level.

Here is a [good reading on this topic](http://ericlathrop.com/2017/05/the-problem-with-npm-install-global/)

## Configuring ESLint with Prettier and Jest

To configure how ESLint works, you can add a configuration file `.eslintrc.json` in your project root directory.

You can create a initial copy of the file by running the following command:

```shell
./node_modules/.bin/eslint --init
```

There is a [comprehensive documentation](https://eslint.org/docs/user-guide/configuring) on how to configure ESLint, but we would like to use some pre-defined (and well-defined) configurations at this moment.

### ESLint + Prettier

Specifically, we recommend to configure ESLint to follow the rules defined by [Prettier](https://prettier.io/), a popular Javascript code formatter.

To integrate the two tools, run the following command in your project root folder:

```shell
yarn add --dev prettier eslint-plugin-prettier eslint-config-prettier
```

And then add `plugin:prettier/recommend` to your `.eslintrc.json` file in `extends` field.

### ESLint + Jest

ESLint has a plugin which contains some useful rules for writing Jest based tests, such as not allowing disabled tests, etc.

To install that plugin, run

```shell
yarn add --dev eslint-plugin-jest
```

### Sample Configuration

A sample `.eslintrc.json` file is provided below:

```json
{
  "env": {
    "node": true,
    "es6": true
  },
  "parserOptions": { "ecmaVersion": 8 },
  "extends": [
    "eslint:recommended",
    "plugin:jest/recommended",
    "plugin:prettier/recommended"
  ]
}
```

## Configure VS Code with ESLint Extension

There is a very useful extension in VS Code that automatically run ESLint to check issues in your code.

* [VS Code ESLint Extension](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)

After installing the extension, you might want to add some configurations in your VS Code User Settings:

* "eslint.packageManager". Set it to "yarn" since we use yarn as our default package manager in projects.
* "eslint.run". Set it to "onSave" if you don't want to trigger ESLint while you are typing.

For other possible configurations, refer to the documentation of the extension.

With the ESLint extension installed, VS Code would highlight the lint errors. You can use the shortcut `F8` to navigate to the next error in the current file.

## Format Codes with Prettier

Since we configure ESLint to follow the rules defined by Prettier, ESLint would highlight codes that do not follow Prettier coding style.

For those kind of issues, we can quickly format the code with [Prettier plugin for VS Code](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)

## Disable ESLint `no-console` Rule Temporarily

Most of the time, the `console.log()` statement is used for debugging purpose. Such kind of code should not be checked into code repository. To prevent that from happening, there is an ESLint rule that does not allow console log statements in your codes.

However, there are some cases where you genuinely use the console log statement to display some information on the console for the user (e.g. a command line node application). In those cases, you can temporarily disable the `no-console` rule.

If you want to disable the rule in a file, just add the following line at the top of the file:

```javascript
/* eslint-disable no-console */
```

If you just need to disable the rule in a specific line, use

```javascript
// eslint-disable-next-line no-console
```

The same `eslint-disable` and `eslint-disable-next-line` trick can be used to temporarily disable other rules as well. But please make sure you have good reasons for using them.

## Resources

* [Configure VS Code for Frontend Development](https://itnext.io/create-react-app-with-vs-code-1913321b48d)
* [ESLINT, DON'T WRITE JAVASCRIPT WITHOUT IT!](https://objectcomputing.com/resources/publications/sett/january-2017-eslint-dont-write-javascript-without-it/)
* [Your Last ESLint Config](https://medium.com/@netczuk/your-last-eslint-config-9e35bace2f99)
* [Introduction to ESLint (Video)](https://www.youtube.com/watch?v=lQzmfnvcmvc)
* [Add ESLint & Prettier to VS Code](https://www.youtube.com/watch?v=bfyI9yl3qfE)
* [ESLint + Prettier for a consistent react codebase](https://blog.gojekengineering.com/eslint-prettier-for-a-consistent-react-codebase-eaa673debb1d)
