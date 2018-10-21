# Demo: Using password-jwt to validate JWT tokens

In the previous section, we learned how to use `express-jwt` to validate JWT tokens. We could do the same with another library called [passport-jwt](https://www.npmjs.com/package/passport-jwt). It's strategy for passport.js.

We have a [sample project](https://github.com/thoughtworks-jumpstart/express-auth-demo) which shows how to save JWT in cookies after authentication and how to use password-jwt to validate JWT tokens in subsequent requests.

Here are the highlights of the sample codes

## Returning JWT in cookies

```javascript
// routes/someRouter.js
const { jwtOptions } = require("../config/passport");

router.post("/signin", async (req, res) => {
  const { username, password } = req.body;
  const user = await User.findOne({ username });

  if (!user) res.status(401).json({ message: "no such user found" });

  if (user.validatePassword(password)) {
    const userId = { id: user.id };
    const token = jwt.sign(userId, jwtOptions.secretOrKey);

    // send token via res.cookie()
    res.cookie("jwt", token, {
      sameSite: true,
      httpOnly: true,
      secure: true
    });
    res.json({ message: "ok" });
  } else {
    res.status(401).json({ message: "passwords did not match" });
  }
});
```

## passport.js configuration to retrieve JWT from cookies

We an configure passport.js with a `JWT` strategy which knows how to validate JWT tokens in HTTP requests and only grant access to protected resources if valid JWT tokens present.

```javascript
// config/passport.js
const passport = require("passport");
const passportJWT = require("passport-jwt");
const JwtStrategy = passportJWT.Strategy;

const User = require("../models/user");

const cookieExtractor = function(req) {
  var token = null;
  console.log(req.cookies);
  if (req && req.cookies) {
    token = req.cookies["jwt"];
  }
  return token;
};

const jwtOptions = {
  jwtFromRequest: cookieExtractor,
  secretOrKey: process.env.JWT_SECRET
};

const verify = async (jwt_payload, done) => {
  const user = await User.findOne({ _id: jwt_payload.id });
  if (user) {
    done(null, user);
  } else {
    done(null, false);
  }
};

const jwtStrategy = new JwtStrategy(jwtOptions, verify);

passport.use(jwtStrategy);

module.exports = {
  passport,
  jwtOptions
};
```

## Initialize passport.js in app.js

```javascript
// in app.js
const { passport } = require("./config/passport");
app.use(passport.initialize());
```

## Use passport.js as middleware for authentication

With the passport.js configuration with `JWT` strategy, we can protect our routes in the following way:

```javascript
// in app.js
app.use(
  "/secret",
  passport.authenticate("jwt", { session: false }),
  secretsRouter
);
```

## Another Example

Here is [another tutorial](https://medium.com/front-end-hacking/learn-using-jwt-with-passport-authentication-9761539c4314) which shows the usage of both local strategy and JWT strategy:

- local strategy is used to authenticate user with user name and password
- JWT strategy is used to validate JWT tokens in the subsequent requests

## Lab

- Update the previous project we used for JWT demo and use passport JWT strategy for validating JWT tokens (instead of using express-jwt library)

## Resources

- [Session-less authentication with jwt and passport](https://blog.usejournal.com/sessionless-authentication-withe-jwts-with-node-express-passport-js-69b059e4b22c)
