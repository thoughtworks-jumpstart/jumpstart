# Token-based authentication

#### Pre-requisite knowledge

* What is token-based authentication
* How JSON Web Tokens are generated
* Express and mongoose

#### References

* [passportjs docs](http://www.passportjs.org/)
* [passport-jwt docs](https://github.com/themikenicholson/passport-jwt)

#### Steps for implementing token-based authentication in an express app

Given that you have a simple express app, 

1. install dependencies: `npm install mongoose passport passport-jwt jsonwebtoken`
2. Configure passport jwt strategy
   1. `mkdir config`
   2. `touch config/passport.js` \(you can name this folder and file anything you want\)
   3. Configure passport with passport-jwt strategy:
   4. ```javascript
      // in config/passport.js
      const passport = require("passport");
      const passportJWT = require("passport-jwt");
      const ExtractJwt = passportJWT.ExtractJwt;
      const JwtStrategy = passportJWT.Strategy;

      const User = require("../models/user");

      const jwtOptions = {
        jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
        secretOrKey: "some_secret"
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
3. Add initialize passport in `app.js` 
   1. ```javascript
      // in app.js
      const { passport } = require("./config/passport");
      app.use(passport.initialize());
      ```
4. Protect your routes by including the `passport.authenticate()` middleware in your route handlers
   1. ```javascript
      // in app.js (or any router file)
      // protected routes
      app.use(
        "/secret",
        passport.authenticate("jwt", { session: false }),
        secretsRouter
      );

      // public routes
      app.use("/", indexRouter);
      ```
5. Now, it's time to issue tokens! We should only issue tokens to users who can authenticate themselves using the right username and password. To do that, we need 2 route handlers for `POST /signup` and `POST /signin` 
   1. ```javascript
      // in router file
      router.post("/signup", async (req, res, next) => {
        const { username, password } = req.body;
        const user = new User({ username, bio: "some bio" });
        user.setPassword(password);
        try {
          await user.save();
          res.json({ user });
        } catch (err) {
          next(err);
        }
      });

      router.post("/signin", async (req, res) => {
        const { username, password } = req.body;

        const user = await User.findOne({ username });

        if (!user) {
          res.status(401).json({ message: "no such user found" });
        }

        if (user.validPassword(password)) {
          const userId = { id: user.id, anything: "whatever" };
          const token = jwt.sign(userId, jwtOptions.secretOrKey);
          res.json({ message: "ok", token: token });
        } else {
          res.status(401).json({ message: "passwords did not match" });
        }
      });
      ```
6. Now, you might notice a two new methods which are used on the `user` object \(namely, `user.setPassword(password)` and `user.validPassword(password)`\). These are instance methods which we will define in the user model in this step
   1. ```javascript
      // in models/user.js

      const mongoose = require("mongoose");
      const crypto = require("crypto");
      const uniqueValidator = require("mongoose-unique-validator");

      const UserSchema = new mongoose.Schema(
        {
          username: {
            type: String,
            lowercase: true,
            unique: true,
            required: [true, "cannot be blank"],
            match: [/^[a-zA-Z0-9]+$/, "is invalid"],
            index: true
          },
          bio: String,
          hash: String,
          salt: String
        },
        { timestamps: true }
      );

      UserSchema.plugin(uniqueValidator, { message: "should be unique" });

      // use ES5 function to prevent `this` from becoming undefined
      UserSchema.methods.setPassword = function(password) {
        this.salt = generateSalt();
        this.hash = hashPassword(password, this.salt);
      };

      // use ES5 function to prevent `this` from becoming undefined
      UserSchema.methods.validPassword = function(password) {
        return this.hash === hashPassword(password, this.salt);
      };

      const generateSalt = () => {
        return crypto.randomBytes(16).toString("hex");
      };

      const hashPassword = (password, salt) => {
        const hash = crypto
          .pbkdf2Sync(password, salt, 10000, 512, "sha512")
          .toString("hex");
        return hash;
      };

      const User = mongoose.model("User", UserSchema);

      module.exports = User;
      ```
   2. There's a lot going on in this file, so let's break it down:
      1. `setPassword(password)` - this function takes a password, and adds 2 attributes \(`this.hash` and `this.salt`\) on the user object. Hence, instead of saving the password in the database \(which is something you should never do!\), we save an **encrypted hash** of the password in the database
      2. `validPassword(password)` - this function \(i\) takes a password, computes an **encrypted hash**, based on the password passed in as an argument and the `this.salt` of the current user, and \(ii\) returns true if this generated hash matches the `this.hash` of the user \(which was previously saved in the database\)
      3. `generateSalt()` uses node's built-in `crypto` to generate a cryptographically strong pseudo-random string \(e.g. `b1b52e1d4494819f3433fa66554f73f1`\)
      4. `hashPassword()` uses node's built-in `crypto` to generate a cryptographically strong hash. Given the same password and same salt, this function will always return the same hash.

