# Passport.js Demo: Local Strategy

## Login with username/password and session tracking with JWT

What you can learn from this example:

* how to configure passport.js to allow username and password based authentication.

We have created a sample project in the course material repository. Let's clone this repository and study the codes related to authentication.

```text
git clone https://github.com/thoughtworks-jumpstart/express_passport_mongoose_example.git
cd express_passport_mongoose_example
git checkout -b authentication_with_passport origin/authentication_with_passport
npm install
```

Before we start, read the documentation of the following libraries used in this project:

* [passport-local](https://github.com/jaredhanson/passport-local)
  * This implements a strategy for passport.js to allow username/password authentication
* [express-jwt](https://github.com/auth0/express-jwt)
  * This allows us to track user sessions with JWT\(JSON Web Token\)
* [jsonwebtoken](https://github.com/auth0/node-jsonwebtoken)
  * This implements the logic to generate JSON Web Token after a successful authentication

### Authentication Logic

Firstly, look at the codes in `config/passport.js` file. This LocalStrategy configuration tells Passport.js library where to find username/password in a request, and how to perform authentication.

This configuration is included in the `app.js` with the line below:

```javascript
require("./config/passport");
```

Then, look at the public API for authentication, in `routes/api/users.js` file.

```javascript
router.post("/users/login", userHandler.login);
```

This leads us to the `login` method in the `handlers/user_handler.js`, in which we call Passport.js to perform the authentication.

```javascript
  passport.authenticate("local", { session: false }, function(err, user, info) {...}
```

Pay attention to the argument to the `authenticate` call:

* `local`, this tells Passport.js to use the `local` authentication strategy
* `session: false`, this disables cookie based session \(because we are using JWT to track session in this example\).
* the third argument is a callback function that is called when `Passport.js` finishes authentication
  * If the `err` argument is not null, that means there are unexpected errors during authentication
  * If the `user` argument is equal to `false`, that means the user does not pass authentication
  * If the `user` argument is a non-null object, that means the user is properly authenticated

Also note that this `authenticate` API actually returns a function, which takes in the same arguments as the express middleware expects. So we immediately called the function with `req`, `res`, and `next` to trigger the authentication with passport.js

### Session Tracking with JSON Web Token \(JWT\)

Once an authentication is done successfully, a JSON Web Token \(JWT\) is issued and returned to the API caller.

The content of JWT token is controlled by the application code as well. You can find it in the `generateJWT` method in `models/User.js`.

You can see the JWT token issued by the application contains three fields:

* userid
* username
* exp

This `generateJWT` function is used in the `user_handler.js` `login` function. When a user login successfully, a JWT token is returned in the JSON response.

In subsequent API calls, the caller can include this token in the HTTP request `Authorization` header to indicate the session has been authenticated.

On the server side, for the APIs that can only be accessed after authentication, we need to make use of the `express-jwt` middleware to enforce an valid token is attached in the requests.

For example, in the `routes/api/users.js` file, the following API is protected:

```javascript
router.get("/user", jwt.required, handleAsyncError(userHandler.getCurrentUser));
```

What is that `jwt.required`? It's a configuration of `express-jwt` middleware, and you can find the implementation in `middlewares/jwt_middleware.js` module.

In that file, you can find two configurations of `express-jwt`:

* "required", which means the middleware will enforce a valid JWT token must be given in the request. If a valid JWT token is found, it would be saved in `req.jwt` property.
* "optional", which means the middleware would allow access to an API even though a JWT token is not given; however, if a valid JWT token is given, it will save the token in the request \(e.g. in the `req.jwt` property\)

The route handlers after this `jwt.required` middleware can assume the `req.jwt` property is always set once an request passes the check by the `express-jwt` middleware. Then it can make use of the information save in the JWT token \(e.g. looking up a user from database based on the user ID\).

## Login with username/password and session tracking with session cookies

What you can learn in this example:

* How to configure Passport.js to use username/password authentication
* How to use session cookies for session tracking \(instead of JWT tokens\)

We actually have at two tutorials:

* [Example provided in Passport repository](https://github.com/passport/express-4.x-local-example)
* [Node.js Authentication using Passport.js](https://blog.risingstack.com/node-hero-node-js-authentication-passport-js/)

Note that there are two express middleware for you to manage session with cookies:

* If you want to store session information on the server side \(i.e. the session cookies only contain session IDs\), you can use [express-session](https://github.com/expressjs/session). By default, the `express-session` library stores session information in memory \(which means you lose all of that when your server is restarted\). If you want to store the session information in a database, you can configure that explicitly. Check the documentation for the library for more details.
* If you want to store session information on the client side \(i.e. the session cookies contain all session information\), you can use [cookie-session](https://expressjs.com/en/resources/middleware/cookie-session.html). When you use this option, bear in mind that there is a max size limit for each cookie \(4KB\).

## Lab

* Update the previous project we used for JWT demo and use passport local strategy for authentication
* Try out the tutorials for session tracking with session cookies \(instead of JWT tokens\)

## Resources

* [Learn how to handle authentication with Node using Passport.js](https://medium.freecodecamp.org/learn-how-to-handle-authentication-with-node-using-passport-js-4a56ed18e81e)

