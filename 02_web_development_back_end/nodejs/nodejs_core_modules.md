# Learning Core Modules in NodeJS

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

## Understanding Core Modules

### Export function from a module and import it from another module

### Find commmand line arguments using process module

Hint: Using `process.argv`

### Load a file under current working directy using fs module

### Check if a given path is a file or directory

### Write a web server that returns hello world on every request

### Copy a file to another one using stream and pipe

### Find out current working directory using path module

### Parse an URL using http module

## Lab: Build a http web server with NodeJS core modules

### Sample Code

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

## Tutorial

- [Learn You Node](https://github.com/workshopper/learnyounode)
- [A beginner-focused half day workshop covering node.js](https://github.com/kwhinnery/node-workshop)