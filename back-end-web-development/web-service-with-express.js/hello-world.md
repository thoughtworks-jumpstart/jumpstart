# Hello World

## HelloWorld! with Express

Probably the simplest web server ever:

```javascript
const express = require("express");
const app = express();
const PORT = 3000;

app.get("/", (req, res) => {
  res.send("Hello World!");
});

const server = app.listen(PORT, () => {
  console.log(`Server started on port ${PORT}...`);
});
```

To see the first example, run the following command in project root directory:

```text
npm install -g nodemon
nodemon helloworld.js
```

Now open the browser with address "[http://localhost:3000/](http://localhost:3000/)", you will see "Hello World!" printed on the browser page.

## Your API can handle more than HTTP GET requests

If you look at the codes in `helloworld.js`, you notice that the application can handle other type of HTTP methods \(like POST and PUT\).

To see it working, you need to use a tool like [postman](https://www.getpostman.com/) or [insomnia](https://insomnia.rest/).

Using those tools, compose a POST or PUT request to "[http://localhost:3000/](http://localhost:3000/)". You should see corresponding texts in responses.

## Syntax for defining a route handler

```text
app.METHOD(PATH, ROUTE_HANDLER);
```

Where:

- app is an instance of the express module
- METHOD is an HTTP request method \(GET, POST, PUT or DELETE\)
- PATH is a path on the server \(e.g. '/', '/books', '/books/:id'\).
- ROUTE_HANDLER is a callback function executed when the route is matched. A route handler function usually has a signature like the one below:

```javascript
function xxxHandler(request, response) {
  // get useful information from request
  // generate response
}
```

Sometimes, you may define multiple route handlers for the same route. In that case, the route handlers can take one more argument called  `next`. A route handler can call `next()` within the body of the function to hand off control to the next callback defined for the same route.

```javascript
function xxxHandler(request, response, next) {
  // get useful information from request
  // update response with response.write()
  // delegate to the next route handler by calling next()
}
```
