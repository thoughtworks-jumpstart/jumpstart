# User Signup

With the User model in place, we can start to implement the REST APIs for user signup and login. Let's start with the API for user sign up.

## Integration test for user sign up

We will write a test case first for the API. Since we are going to test the API working with a real database, we usually call such test cases as "integration tests".

Firstly, create a directory `integration_test` in the project root directory.

Inside this directory, create a file `user_signup.test.js` with the following content:

```javascript
process.env.NODE_ENV = "integration";

const testDB = require("../test_helper/in_memory_mongodb_setup");
const request = require("supertest");
const app = require("../src/app");
const status = require("http-status");

beforeAll(testDB.setup);
afterAll(testDB.teardown);

describe("New user signup", () => {
  test("Register a new user successfully", async () => {
    const username = "luke";
    const email = "luke@example.com";
    const password = "mypassword";

    let response = await request(app)
      .post("/api/user/signup")
      .send({ user: { username, email, password } });
    let userJson = response.body.user;

    expect(response.statusCode).toBe(status.OK);
    expect(userJson).toBeDefined();
    expect(userJson.username).toEqual(username);
    expect(userJson.email).toEqual(email);
  });
});
```

When you run this test case, you would notice that it fail with the following error:

```txt
  Expected: 200
  Received: 404

      20 |     let userJson = response.body.user;
      21 |
    > 22 |     expect(response.statusCode).toBe(200);

```

You got HTTP 404 in the response. That's because we haven't added the route handler for this `/api/user/signup` yet.

Let's add an Express router for all user related call.

In app.js, add the following lines in the "routers" section.

```javascript
const userRouter = require("./routes/user_api");
app.use("/api/user", userRouter);
```

In `routers` folder, create a new file called `user_api.js` with the following content:

```javascript
const express = require("express");
const router = express.Router();
const handleAsyncError = require("express-async-wrap");
const userHandler = require("../handler/user_handler");

router.post("/signup", handleAsyncError(userHandler.registerNewUser));

module.exports = router;
```

All the route handlers can be put in the `handler` folder, let's create that directory, and then create a new file `user_handler.js` in that directory.

The content of `user_handler.js` is:

```javascript
const User = require("../model/user");

async function registerNewUser(req, res) {
  var user = new User();

  user.username = req.body.user.username;
  user.email = req.body.user.email;
  user.setPassword(req.body.user.password);

  await user.save();
  return res.json({ user: { username: user.username, email: user.email } });
}

module.exports = {
  registerNewUser
};
```

This may look a bit different than the route handlers you usually write, that's because I decided to extract the route handlers into a separate file. Putting route handlers into a separate file make it easier to write unit tests for them, because the test cases for the handlers has no dependency on Express framework at all.

## Exercise

Write more test cases for the user sign up API

- If another user tries to sign up with user name `tom`, the HTTP response code should be 422 (Unprocessable Entity) instead of 200 (OK). The JSON body in the HTTP response can also contain an `error` field which indicate the user name already exists.