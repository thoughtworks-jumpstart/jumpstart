# Demo: Using password-jwt to validate JWT tokens

In the previous section, we learned how to use `express-jwt` to validate JWT tokens. We could do the same with another library called `passport-jwt`. It's strategy for passport.js.

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
// define a function to extract token from cookies
const cookieExtractor = function(req) {
  let token = null;
  if (req && req.cookies) token = req.cookies["jwt"];
  return token;
};

// tell passport to use cookieExtractor
const jwtOptions = {
  jwtFromRequest: cookieExtractor,
  secretOrKey: process.env.JWT_SECRET
};
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
