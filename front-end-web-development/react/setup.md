# Setup

## Creating a react project with `create-react-app`

`create-react-app` is a commandline tool that helps us take care of the configuration of react applications so that we can focus on writing code, rather than configuration. It also takes care of the bundling of JSX and ES6 syntax into ES5 javascript which any browser can support. `create-react-app` vastly simplifies the creation and deployment of React applications, and is useful for getting started with React.

* Docs: [https://github.com/facebook/create-react-app](https://github.com/facebook/create-react-app)
* How to create a react app:
  * `cd your-workspace-folder`
  * `npx create-react-app my-awesome-app`
    * 'my-awesome-app' folder will be created under 'your-workspace-folder'.
  * `cd my-awesome-app`
  * `npm run start` or `yarn start`.
    * This command will start a [webpack dev server](https://survivejs.com/webpack/developing/webpack-dev-server/) that serves your application. You can visit your React application at http://localhost:3000

## VS Code Extensions

* [JS JSX Snippets \(skyran.js-jsx-snippets\)](https://github.com/skyran1278/js-jsx-snippets) - awesome autocomplete shortcuts

## Configuring VS Code to use Emmet in JSX

When we write JSX, we will be using HTML tags \(e.g. div, h1, form, input, etc.\). Autocomplete is not enabled for HTML tags because we're working in javascript files. To enable autocomplete, do the following:

* In any VS Code Window, open User Settings \(mac: `⌘` + `,`, windows: `ctrl` + `,`\)
* In the pane on the right, include the following line as a key value pair in the main object:

  ```text
  {
  // ...
  "emmet.includeLanguages": { "javascript": "javascriptreact" },
  // ...
  }
  ```

## Chrome Browser extensions

* React DevTools \([Chrome](https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi?hl=en) and [Firefox](https://addons.mozilla.org/en-US/firefox/addon/react-devtools/)\)

## Optional

[Other potentially useful React \(and also redux\) developer tools](https://medium.com/@jondot/10-react-developer-tools-you-might-have-missed-6c7575cc27eb)

