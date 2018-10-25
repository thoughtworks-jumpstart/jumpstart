# Demo: Using password-jwt to validate JWT tokens

In the previous section, we learned how to use `express-jwt` to validate JWT tokens. We could do the same with another library called [passport-jwt](https://www.npmjs.com/package/passport-jwt). It's a strategy for passport.js to handle authentication with JWT tokens.

Let's modify the codes we get from the previous JWT demo (where we use cookies to store JWT token), taking out `express-jwt` and replace it with `passport` and `passport-jwt`.

## Installing NPM packages

We need to install two additional packages first.

```shell
npm install passport passport-jwt
```

## passport.js configuration to retrieve JWT from cookies

We an configure passport.js with a `JWT` strategy which knows how to validate JWT tokens in HTTP requests and only grant access to protected resources if valid JWT tokens present.

Create a new file `passport_middleware.js` in the `middleware` folder:

```javascript
const passport = require("passport");
const passportJWT = require("passport-jwt");
const JwtStrategy = passportJWT.Strategy;

const User = require("../model/user");
const { secret } = require("../../config/jwt");

const cookieExtractor = function(req) {
  var token = null;
  if (req && req.cookies) {
    token = req.cookies["jwt"];
  }
  return token;
};

const jwtOptions = {
  jwtFromRequest: cookieExtractor,
  secretOrKey: secret
};

const saveUserInRequest = async (jwt_payload, done) => {
  try {
    const user = await User.findOne({ _id: jwt_payload.userid });
    if (user) {
      done(null, user);
    } else {
      done(null, false);
    }
  } catch (err) {
    done(err, false);
  }
};

const jwtStrategy = new JwtStrategy(jwtOptions, saveUserInRequest);

passport.use(jwtStrategy);

module.exports = {
  passport
};
```

When we create an instance of JwtStrategy, we need to provide two arguments:

- Options to control how to extract JWT tokens from requests
- A callback function which is invoked when the JWT token is found, verified

### Configure how to extract the JWT tokens from requests

We need to provide two configurations:

- jwtFromRequest: this is a callback function to extract JWT token from requests. 
- secretOrKey: this is the secret used to sign and verify JWT tokens.

### The callback function to process JWT payload

Once `passport` extracts the JWT token from requests and verifies its signature, it invokes a callback function to do some post-processing.

The callback function takes in two arguments:

- the JWT token payload
- a callback function (usually named `done`) which can be called to pass the control back to `passport` library

In the example given above, the `saveUserInRequest` function looks up the user by taking the user ID from the JWT payload.

- If the user is found, it pass the user to the `passport` library via calling `done(null, user)`
- If the user is not found, it calls `done(null, false)` to indicate the user is not found
- If there are any unexpected errors, it calls `done(error, false)` to pass the error to passport.

Once the passport library get the `user` from the `done(null, user)` call, it saves the user in the `req.user` field. Then the route handlers protected by this passport middleware can get user information by checking `req.user`.

## Initialize passport.js in app.js

In order to use the passport middleware we configured above, we need to declare it in `app.js`, in the "middlewares" section:

```javascript
const { passport } = require("./middleware/passport_middleware");
app.use(passport.initialize());
```

## Use passport.js as middleware for authentication

With the passport.js configuration with `JWT` strategy, we can protect our routes in the following way.

In the `user_api.js`, we used to protect the `/change_password` route with `express-jwt` middleware. But now we can use the passport middleware instead.

Change the code from:

```javascript
const jwt_validation = require("../middleware/jwt_middleware");

router.put(
  "/change_password",
  jwt_validation.required,
  handleAsyncError(userHandler.changePassword)
);
```

to:

```javascript
const passport = require("passport");

router.put(
  "/change_password",
  passport.authenticate("jwt", { session: false }),
  handleAsyncError(userHandler.changePassword)
);
```

Here when we call the passport middleware, we pass in two arguments:

- "jwt", this indicates we want to use the JWT strategy for passport.js
- we set the `session` option to `false` because we are tracking session with JWT token, instead of cookies with session ID.

## Use req.user in a route handler protected by passport.js

Once the authentication is done successfully, the passport.js middleware saves the user information in the `req.user` field.

In the `user_handler.js`, we update the first few lines of `changePassword` function accordingly:

From:

```javascript
  const userId = req.user.userid;
  const user = await User.findById(userId);
```

to:

```javascript
  // const userId = req.user.userid;
  // const user = await User.findById(userId);
  const user = req.user;
```

In the passport middleware configuration, we have that `saveUserInRequest` function, which lookup the user based his ID already, so the `req.user` field contains the user loaded from database. We don't need to lookup the user again in this handler.

Note: **pay attention to this difference!** When we were using the `express-jwt` library for authentication, `express-jwt` saves the JWT token payload in the `req.user` field, but in this new implementation, we save the user model (retrieved from database) in the `req.user` field.

## Sample Codes

You can find a [sample solution](https://github.com/thoughtworks-jumpstart/express-jwt-authentication-demo/tree/soution_with_passport_jwt) with the changes described above.

## Another Example

Here is [another tutorial](https://medium.com/front-end-hacking/learn-using-jwt-with-passport-authentication-9761539c4314) which shows the usage of both local strategy and JWT strategy:

- local strategy is used to authenticate user with user name and password
- JWT strategy is used to validate JWT tokens in the subsequent requests

## Resources

- [Session-less authentication with jwt and passport](https://blog.usejournal.com/sessionless-authentication-withe-jwts-with-node-express-passport-js-69b059e4b22c)
