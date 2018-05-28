# NodeJS

## What's NodeJS

Node.js is a platform for building fast and scalable server applications using JavaScript.

![What is NodeJS](https://www.safaribooksonline.com/library/view/nodejs-design-patterns/9781785885587/graphics/B05259_01_04.jpg)

- libuv: the low-level I/O engine of Node.js. it encapsulate the details of different I/O APIs on various operating systems
- V8, the JavaScript engine originally developed by Google for the Chrome browser.
- bindings, responsible for wrapping and exposing libuv and other low-level functionality to JavaScript.
- node-core, a core JavaScript library that implements the high-level Node.js API.

## History of NodeJS

https://blog.risingstack.com/history-of-node-js/

## Why using NodeJS?

Many of the frontend developer tools (e.g. webpack, gulp, etc) are built on top of NodeJS.

For server side applications, it's a good idea to use NodJS when you know the application is I/O bound. For example,
- Building dynamic websites
- Building a blog system
- Build a CRUD style REST API


Don't use NodeJS to build your server side application under the following cases:
- The application is CPU bound (i.e. it needs to do heavy computation)
- The application is memory bound (e.g. it takes to loads serveral GBs of data into memory)

## Dev Environment Setup
### Installing NodeJS on your computer

In case you haven't setup NodeJS environment on your computer yet, you can download it from [the offical website](https://nodejs.org/en/download/)

For people using Mac and `homebrew`, you can [install it via homebrew](https://shapeshed.com/setting-up-nodejs-and-npm-on-mac-osx/)

You can also try to install it via the [Node Version Manager](https://github.com/creationix/nvm). The benefit of using Node Version Manager is you can easily switch between multiple versions of node.

Tip: To test that you've got Node.js correctly installed on your computer, open a new terminal and type `node --help` and you should see the usage documentation.

### The commandline tools for NodeJS

- node
- npm/yarn
- nps
- [concurrently](https://github.com/kimmobrunfeldt/concurrently)
- babel
- eslint

#### Tutorials

- [NPM How To](https://github.com/workshopper/how-to-npm)

#### Understanding package.json

## How to initialise a NodeJS project with NPM

### Initialise a node project

```
npm init
```

## NodeJS Learning Path

- setup the development environment
  - learn development tools
    - node
    - npm/yarn
    - eslint
    - nodemon
- learn how to write command line programs with node
  - how to read command line arguments from stdin
  - how to print result on stdout (console)
  - how to split codes into modules
  - how to access file system (synchronously)
  - (optional) how to publish a node module to npm registry
  - TDD
  - clean code
- learn how to write web service API with node
  - how to process requests and generate response
  - how to access file system (asynchronously)
  - how to access database
  - how to send requests to other backend systems
    - learn useful libraries like async, fetch, superagent
  - learn a web framework (express or restify)
  - undertand how node runtime works
    - understand stream 
      - use library [through2](https://github.com/rvagg/through2), [trumpet](https://github.com/substack/node-trumpet)
  - how to write production quality web services
    - how to test web services
    - how to monitor web services
  - (optional) microservices

### Understanding Core Modules

#### Export function from a module and import it from another module

#### Find commmand line arguments using process module

Hint: Using `process.argv`

#### Load a file under current working directy using fs module

#### Check if a given path is a file or directory

#### Write a web server that returns hello world on every request

### Copy a file to another one using stream and pipe

#### Find out current working directory using path module

#### Parse an URL using http module

### Lab: Buid a http web server

#### Sample Code

```
let fs = require("fs"),
  url = require("url"),
  path = require("path"),
  http = require("http");

let root = path.resolve(process.argv[2] || ".");

console.log("Static root dir: " + root);

let server = http.createServer((request, response) => {
  let pathname = url.parse(request.url).pathname;
  let filepath = path.join(root, pathname);
  fs.stat(filepath, (err, stats) => {
    if (!err) {
      if (stats.isFile()) {
        replyWithFileContent(request, response, filepath);
      } else {
        replyWithIndexHtml(filepath, err, request, response);
      }
    } else {
      replyFileNotFound(request, response);
    }
  });
});

server.listen(8080);

console.log("Server is running at http://127.0.0.1:8080/");

function replyWithFileContent(request, response, filepath) {
  console.log("200 " + request.url);
  response.writeHead(200);
  fs.createReadStream(filepath).pipe(response);
}

function replyFileNotFound(request, response) {
  console.log("404 " + request.url);
  response.writeHead(404);
  response.end("404 Not Found");
}

function replyWithIndexHtml(filepath, err, request, response) {
  let indexFile = path.join(filepath, "index.html");
  fs.access(indexFile, fs.constants.R_OK, err => {
    if (!err) {
      replyWithFileContent(request, response, indexFile);
    } else {
      replyFileNotFound(request, response);
    }
  });
}

```

### Tutorial

- [Learn You Node](https://github.com/workshopper/learnyounode)