# Parsing path params

## You can capture parameters in your route path

Route parameters are named URL segments that are used to capture the values specified at their position in the URL. The captured values are populated in the req.params object, with the name of the route parameter specified in the path as their respective keys.

For example

```text
Route path: /users/:userId/books/:bookId
Request URL: http://localhost:3000/users/34/books/8989
req.params: { "userId": "34", "bookId": "8989" }
```

To see this in action, take a look at `route_parameter_example_1.js`

```text
node route_parameter_example_1.js
```

If you visit the URL [http://localhost:3000/users/34/books/8989](http://localhost:3000/users/34/books/8989), you can see the parameters are captured in the `req.params` object.

## You can define handlers when route parameters are captured.

Sometimes, you may want to do certain things automatically when an route parameter is captured. For example, once you capture a `userId` parameter, you may want to look up the user profile in database and automatically attach the user profile in the request \(which can be used by the route handlers for that request\).

To declare a handler for a route parameter, you can use the following API

```text
app.param(PARAMETER, HANDLER);
```

The handler function usually has the following signature:

```text
function(req, res, next, parameterValue) {...}
```

Where

* `req` is the request 
* `res` is the response
* `next` is the callback to notify the next handler to process the request
* `parameterValue` is the value of the captured parameter

This is illustrated in example `route_parameter_example_2.js`

```text
node route_parameter_example_2.js
```

