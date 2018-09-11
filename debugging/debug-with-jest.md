# Debug with Jest

## Jest Test Cases for Server Side Node Application

Debugging when using the `jest` runner requires a bit more configuration. Once you create a new project in VS Code, you need to place the following configuration in `launch.json`

```javascript
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Debug Jest", // name to show in Debug config picker
      "type": "node",
      "request": "launch",
      "program": "${workspaceRoot}/node_modules/jest/bin/jest.js",
      "sourceMaps": true, // if you are using Babel or TS, make this true
      // you can add another arg to pattern-match limit the tests, just as when normally running jest
      "args": ["-i", "--runInBand", "--no-cache"],
      "internalConsoleOptions": "openOnSessionStart",
      "runtimeArgs": [],
      "env": {
        "NODE_ENV": "test" // make sure it matches your target; useful for babel config
      }
    }
  ]
}
```

Off you go! You can now add breakpoints in your code/tests and use the debugger as you've learned in the previous chapter

### A Project with Sample Configuration for VS Code Debugger

There is a sample application with pre-configured VS Code launch.json. You can use it as a reference when you need to configure VS code for debugging node based application and jest-based test cases.

```text
git clone https://github.com/thoughtworks-jumpstart/node_app_starter_project.git

cd node_app_starter_project

npm install
```

