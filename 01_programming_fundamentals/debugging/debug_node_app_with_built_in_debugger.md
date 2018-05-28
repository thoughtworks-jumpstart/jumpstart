# Debug Node Application with Built-In Debugger

Note: this section is just FYI. We usually don't need to use the built-in debugger from Node because the debugger provided by VS Code is much better.

Node v6.4.x+ ships with an [built-in debugger](https://nodejs.org/api/debugger.html). 

To use this command line debugger, just run

```shell
node inspect myscript.js
```

You will see the following lines on the console

```shell
< Debugger listening on ws://127.0.0.1:9229/5bf17f0a-0265-43d7-bdb8-cc01fd67b636
< For help see https://nodejs.org/en/docs/inspector
< Debugger attached.
Break on start in myscript.js:1
> 1 ...<content of myscript.js is displayed here>...

debug>
```

To check what you can type at this `debug` prompt, type `help`, e.g.

```shell
debug>help
```

You will see a menu of commands, e.g.

```txt
run, restart, r       Run the application or reconnect
kill                  Kill a running application or disconnect

cont, c               Resume execution
next, n               Continue to next line in current file
step, s               Step into, potentially entering a function
out, o                Step out, leaving the current function
backtrace, bt         Print the current backtrace
...
```

## Debug Node Application with Chrome Dev Tools

The command line version of the debugger is very hard to use. A better alternative is to use the Chrome Dev Tools.

To use it, simply add "debugger" statements anywhere you want to set a breakpoint in your scripts, then run:

```shell
node --inspect-brk myscript.js
```

Then open Chrome and visit URL `chrome://inspect/`. You will see an URL listed under "Remote Target" section.

Click that URL and you’ll get an interactive debugging environment.