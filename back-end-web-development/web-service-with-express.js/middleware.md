# Middleware

Now we understand how to write functions to handle requests. But the Express Framework offers something more powerful called `Middleware`.

**Middleware** is any number of functions that are invoked by the Express.js routing layer before your final request handler is, and thus sits in the middle between a raw request and the final intended route. We often refer to these functions as the middleware stack since they are always invoked in the order they are added.

The following diagram shows how the middlewares work together:

![middleware explained](https://manuel-rauber.com/content/images/2016/03/Middleware-1.png) \(image source: [https://manuel-rauber.com](https://manuel-rauber.com)\)

Let's take a look an example middleware in `middleware_example.js`

The example contains two middleware functions that logs to console when some request is received. Note that one of the middleware is called for all request, and the other middleware is only called when the request URL match "/users" prefix in request path.

To see this in action, run

```text
node middleware_example.js
```

If you visit URL `http://localhost:3000/users`, you should see two lines in console log

```text
GET /users
Someone is requesting a list of users
```

If you visit URL `http://localhost:3000/books`, you should see only one line in console log

```text
GET /books
```

Now let's take a closer look at the signature of middleware functions

```javascript
function(req, res, next) {
  // do something useful here

  // don't forget to call next
  next();
}
```

There are a few things to highlight here:

* The middleware function has same signature as route handlers, but we need to pay special attention to the `next` argument. This is a callback function for each middleware to tell the Express framework that "Hey, my job is done. Now pass the request to the next middleware or route handler that should handle this request."
* **It's critical that you don't forget calling the** `next` **function after a middleware finishes its task. Otherwise, the Express Framework will keep waiting for the call to** `next()`**, and the API client side would not receive any response!!!**
* Another important detail is **the call** `app.use(middleware)` **must be called before an API endpoint declaration if that middleware should be called for the API endpoint**.
* You can declare multiple middlewares for the same API endpoint, and the order of execution is same as order of their declaration.

To get more details about middleware, you can refer to the following materials:

* [Official Express Documentation on Middleware](https://expressjs.com/en/guide/using-middleware.html)
* [Middleware Demystified](https://www.safaribooksonline.com/blog/2014/03/10/express-js-middleware-demystified/)
* [middleware vs route handler](http://qnimate.com/express-js-middleware-tutorial/)
* [Setting Up 5 Useful Middlewares For An Express API](https://blog.jscrambler.com/setting-up-5-useful-middlewares-for-an-express-api/)

## Useful Middlewares

Why do we need middleware? They are often used to handle `cross-cutting concerns` that need to be addressed in almost every requests, such as

* [Authentication](http://www.passportjs.org/)
* [Cookie based session management](https://github.com/expressjs/session)
* [Parsing cookie in request](https://github.com/expressjs/cookie-parser)
* [Parsing request body](https://github.com/expressjs/body-parser)
* [Request body validation](https://github.com/diegohaz/bodymen)
* [Parsing and validating request body/query-string](https://github.com/diegohaz/schm/tree/master/packages/schm-express)
* [Parsing query string](https://github.com/diegohaz/querymen)
* [Logging each request](https://github.com/expressjs/morgan)
* [Validating user input](https://github.com/ctavan/express-validator)
* [Supporting Cross Origin Resource Sharing](https://github.com/expressjs/cors)
* [Error Logging in Development Environment](https://github.com/expressjs/errorhandler)
* [Compressing responses](https://github.com/expressjs/compression)

