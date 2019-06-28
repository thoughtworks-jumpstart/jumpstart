# Debug Node Application with VS Code

## Before you start

Install the 'Debugger for Chrome' VS Code extension \(if you do not not already have it installed\).

## Steps to get started

1. Click on your nodejs or expressjs project folder in VS Code
2. Configure the debugger.
3. To do so, go to the Debug view \(⇧⌘D for mac\)
4. Click on gear button to create a `launch.json` debugger configuration file.

0 Choose Node.js from the Select Environment dropdown.

* This will create a .vscode folder in your project folder, in that folder it creates a launch.json which by default contains the configuration to launch your node app and start the debugger at the same time. 
* Check that the launch.json is there in your project folder
* Your launch.json should look like this:

```javascript
{
    "version": "0.2.0",
    "configurations": [

        {
            "type": "node",
            "request": "launch",
            "name": "Launch Program",
            "program": "${workspaceFolder}/server.js"
        }
    ]
}
```

1. Go back to the Debug view \(⇧⌘D for mac\). Click on the DEBUG drop down menu and select the new config you have created "Launch Program \(project name\). Next click on the Green arrow button to start the debugger
2. The footer status bar at VSCode will turn from blue to red to inform you that your debugger is currently running.
3. Next Go to your project and set a breakpoint in one of your route handlers.
4. Start up insomnia and trigger a request to the route handler which you have set the breakpoint in. The debugger in VS code will stop the request at the line where you have set the breakpoint.
5. You can use the floating menu on the right to jump to the next line
6. Try adding a variable into the watch menu by clicking the + button and set the "expression to watch" as req.params or req.body
7. You can now also inspect the values in variables in the Watch menu as you, step through/over code.
8. Remember to stop your debugger when you are done by. After it is stopped the footer bar of your VS code should change from red to blue.
   * either click on Debug Menu &gt; Stop Debugging 
   * or use the short cut : ⇧F5 for mac

## Resources

* [https://code.visualstudio.com/docs/nodejs/nodejs-debugging](https://code.visualstudio.com/docs/nodejs/nodejs-debugging)

