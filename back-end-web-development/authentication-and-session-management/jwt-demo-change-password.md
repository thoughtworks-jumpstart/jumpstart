# JWT Demo: User Change Password API

Now we have the API for users to sign up and login. We can add another API for users to change their passwords. We should only allow users to do that after login, and JWT token is required to validate that the user is already authenticated.

## Test cases for change password

Firstly, let's add a test case `user_change_password.test.js` in the `integration_test` directory.

```javascript
process.env.NODE_ENV = "integration";

const testDB = require("../test_helper/in_memory_mongodb_setup");
const fixtureLoader = require("../test_helper/fixtures");
const fixtures = require("../test_helper/fixtures").fixtures;
const request = require("supertest");
const app = require("../src/app");
const status = require("http-status");

beforeAll(testDB.setup);
beforeAll(fixtureLoader.load);
afterAll(testDB.teardown);

let jwtToken;

async function loginAsTom(password) {
  let email = fixtures.users.tom.email;
  let response = await request(app)
    .post("/api/user/login")
    .send({ user: { email, password } });

  expect(response.statusCode).toBe(status.OK);
  jwtToken = response.body.user.token;
}

test("Change password on the current user", async () => {
  await loginAsTom(fixtures.users.tom.password);

  const newPassword = "new-password";
  const updatedUser = {
    password: newPassword
  };

  let response = await request(app)
    .put("/api/user/change_password")
    .set("Authorization", "Bearer " + jwtToken)
    .send({ user: updatedUser });

  expect(response.statusCode).toBe(status.OK);

  await loginAsTom(newPassword);
});
```

Note that we save the JWT token returned from the login API, and use it in subsequent requests by specifying the `Authorization` header.

There are a few changes required to make this API work.

## Install NPM package express-jwt

To check this JWT token on the server side, we need to use an express-middleware called [express-jwt](https://github.com/auth0/express-jwt).

Install this package if you haven't done it.

```text
npm install express-jwt
```

## Configure express-jwt

We need to let the `express-jwt` library know where to get the JWT token from requests. For this purpose, we need to write some configuration logic.

Create a new directory `middleware` in the `src` directory, and create a new file `jwt_middleware.js` with the following content:

```javascript
const jwt = require("express-jwt");
const secret = require("../../config/jwt").secret;

function getTokenFromHeader(req) {
  const authHeader = req.headers.authorization;

  if (authHeader && authHeader.split(" ")[0] === "Bearer") {
    return authHeader.split(" ")[1];
  }

  return null;
}

module.exports = {
  required: jwt({
    secret: secret,
    userProperty: "user",
    getToken: getTokenFromHeader
  })
};
```

We need to let `express-jwt` know:

* The secret used to sign the JWT token
* Where to save the extracted JWT payload if the token is valid. If you set this `userProperty` value to `user`, the middleware would save the JWT payload into the `req.user` field, which is available for the route handlers to consume.
* How to get the JWT token from request. You need to provide a callback function here.

This call to `jwt` function returns a middleware function that can be used to validate JWT tokens that are attached in the `Authorization` header of requests.

This middleware function is exported as the `required` field, which can be imported by any route that needs to be protected.

## Add a new route for change password

In `user_api.js`, add a new route for changing password.

```javascript
const jwt_validation = require("../middleware/jwt_middleware");

router.put(
  "/change_password",
  jwt_validation.required,
  handleAsyncError(userHandler.changePassword)
);
```

Note that we put the `jwt_validation.required` middleware in front of the call to `userHandler.changePassword`. This makes sure the changePassword handler is only called if the request contains a valid JWT token.

## Define the handler for changing password

Now, we can define the `changePassword` handler in `user_handler.js`:

```javascript
async function changePassword(req, res) {
  const userId = req.user.userid;
  const user = await User.findById(userId);

  const newUserProfile = req.body.user;
  if (newUserProfile.password) {
    user.setPassword(newUserProfile.password);
  }

  await user.save();
  return res.json({ status: "done" });
}

module.exports = {
  registerNewUser,
  login,
  changePassword
};
```

Note:

* the `req.user` field is set by the `express-jwt` middleware after successful JWT validation.
* the 'userid' field is part of the JWT payload.

In the `src/model/user.js`, we put the following fields in to the JWT token

```javascript
    {
      userid: this._id,
      username: this.username,
      exp: parseInt(exp.getTime() / 1000)
    }
```

This `userid` can be used to search users. \(We could use the `username` field too.\)

If you run the test cases again, all should pass now.

## Exercises

* Currently we only have one test case for changing password, which is the happy case. There are many error scenarios we should test as well:
  * Write a test case where the change password API is called without login. The HTTP response code should be 401 \(Unauthorized\) instead of 200 \(OK\).
  * Write a test case which submit a new password that is too short \(e.g. if the password policy says every password should be at least 8 characters long\). In this case, the HTTP response code should be 422 \(Unprocessable Entity\). Note that you need to implement the password policy on in the route handler in order to make this test case pass.
* Implement another API for a user to update his username. This API should also be protected \(i.e. it should only be called after authentication\). Implement this new API following the Test Driven Development approach as well.

