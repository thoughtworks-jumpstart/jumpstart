# JWT Demo: User Login API

Now we are ready to implement the API for user login.

Let's create a test case first.

In the `integration_test` directory, create a new file `user_authentication.test.js`, with the following test case:

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

describe("User authentication", () => {
  test("User login successfully", async () => {
    let email = fixtures.users.tom.email;
    let password = fixtures.users.tom.password;
    let response = await request(app)
      .post("/api/user/login")
      .send({ user: { email, password } });

    let userJson = response.body.user;
    expect(response.statusCode).toBe(status.OK);
    expect(userJson).toBeDefined();
    expect(userJson.email).toEqual(email);
    expect(userJson.token).toBeDefined();
    expect(userJson.token).not.toBeNull();
  });
});
```

In this test case, we try to login as user `tom`, which is a fixture created in the test database \(in the `beforeAll` calls.\)

In the test case, besides expecting the response to be "OK", we also expect the response JSON contains the JWT token.

There are two steps to make this test pass.

Step 1: handle the request to `/login` with a new routes in `user_api.js`:

```javascript
router.post("/login", handleAsyncError(userHandler.login));
```

Step 2: create a new handler function in the `user_handler.js`:

```javascript
const status = require("http-status");

async function login(req, res) {
  const email = req.body.user.email;
  const password = req.body.user.password;

  let user = await User.findOne({ email: email });
  if (!user || !user.validPassword(password)) {
    return res.status(status.UNAUTHORIZED).json({
      error: { message: "email or password is invalid" }
    });
  }

  const token = user.generateJWT();
  return res.json({
    user: { username: user.username, email: user.email, token: token }
  });
}

module.exports = {
  registerNewUser,
  login
};
```

Now this test should pass. To be safe, we should also write another test case to check what if the email or password is invalid.

```javascript
  test("Login with invalid email", async () => {
    let email = "bogus@example.com";
    let password = "bogus";
    let response = await request(app)
      .post("/api/user/login")
      .send({ user: { email, password } });
    expect(response.statusCode).toBe(status.UNAUTHORIZED);
    let responseErrors = response.body.error.message;
    expect(responseErrors).toEqual("email or password is invalid");
  });

  test("Login with invalid password", async () => {
    let email = fixtures.users.tom.email;
    let password = "bogus";
    let response = await request(app)
      .post("/api/user/login")
      .send({ user: { email, password } });
    expect(response.statusCode).toBe(status.UNAUTHORIZED);
    let responseErrors = response.body.error.message;
    expect(responseErrors).toEqual("email or password is invalid");
  });
```

These two tests should pass without further code changes.

## Exercises

Write more test cases for login API:

* If the user does not specify `username` field in the HTTP POST request, the HTTP response code should be 401 \(Unauthroized\)
* If the user does not specify `email` field in the HTTP POST request, the HTTP response code should be 401 \(Unauthroized\)

