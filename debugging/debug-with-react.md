# Debug React App with VS Code

## Before you start

You need to create a web application using create-react-app.

## Steps to get started

1\) Install the 'Debugger for Chrome' VS Code extension, and also the Chrome browser \(if you're not already using one\). 2\) Configure the Chrome debugger.

* To do so, go to the Debug view \(⇧⌘D for mac\)
* Click on gear button to create a `launch.json` debugger configuration file.
* Choose Chrome from the Select Environment dropdown. This will create a launch.json file in a new .vscode folder in your project which includes configuration to both launch the website or attach to a running instance.
* In the first configuration object in the `configurations` array, change the port from 8080 to 3000. Your launch.json should look like this:

```javascript
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "chrome",
            "request": "launch",
            "name": "Launch Chrome against localhost",
            "url": "http://localhost:3000",
            "webRoot": "${workspaceFolder}"
        }
    ]
}
```

3\) Set a breakpoint in one of your components. Example:

![](../.gitbook/assets/react_breakpoint.png)

4\) Start your server: `npm start`. This will open a new browser instance.

5\) Press `F5` to go into debug mode, and manually refresh the page. The source code where the breakpoint is set runs on startup before the debugger was attached so we won't hit the breakpoint until we refresh the web page. Refresh the page and you will hit your breakpoint.

6\) You can now use the debugger to inspect variables in the Debug console, step through/over code, etc. On the debug console, try entering any variable which you know should exist during this breakpoint \(e.g. `props` or `this`, if they exist\)

## Resources

* [https://code.visualstudio.com/docs/nodejs/reactjs-tutorial\#\_debugging-react](https://code.visualstudio.com/docs/nodejs/reactjs-tutorial#_debugging-react)
* [https://code.visualstudio.com/docs/nodejs/nodejs-debugging\#\_source-maps](https://code.visualstudio.com/docs/nodejs/nodejs-debugging#_source-maps)

