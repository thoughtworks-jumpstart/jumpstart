# User Logout

When a user decides to logout and terminates the current session, we need to do proper clean up.

If the JWT token is returned to the frontend in the HTTP response body, there is not much we need to do on the server side. The client side needs to delete the JWT token.

However, if the JWT token is saved in the cookies, we need to delete that cookie during logout. Since the cookie is issued by the server side, it makes sense for the server side to issue instructions to delete the cookie.

In the last step, we changed the server side API to track JWT tokens in cookies. Now let's implement the API to clear cookies during logout.

## Test case for logout API

Let's create a new test case `user_logout.test.js` in the `integration_test` diretory:

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

async function loginAsTom(password, agent) {
  let email = fixtures.users.tom.email;
  let response = await agent
    .post("/api/user/login")
    .send({ user: { email, password } });

  expect(response.statusCode).toBe(status.OK);
}

test("Logout should clear the cookie storing JWT token", async () => {
  const agent = request.agent(app);

  await loginAsTom(fixtures.users.tom.password, agent);

  let logoutResponse = await agent.post("/api/user/logout").send();
  expect(logoutResponse.statusCode).toBe(status.OK);

  // if we try to change password after logout, we expect to get back
  // Unauthorized (HTTP 401) in the response
  const newPassword = "new-password";
  const updatedUser = {
    password: newPassword
  };

  let changePwdResponse = await agent
    .put("/api/user/change_password")
    .send({ user: updatedUser });

  expect(changePwdResponse.statusCode).toBe(status.UNAUTHORIZED);
});
```

In this test case, we expect the call to logout API should cause the cookie storing the JWT token to be removed. Then if we try to change the user's password, we would get back the HTTP 401 (Unauthorized) status code in HTTP response.

If you run this tests now, it would fail because we haven't implemented the logout API yet.

## Implement logout API

In `user_api.js`, add a new line to declare the route for logout:

```javascript
router.post("/logout", handleAsyncError(userHandler.logout));
```

And add the logout route handler in `user_handler.js`:

```javascript
async function logout(req, res) {
  res.clearCookie("jwt");
  res.json({ status: "done" });
}

module.exports = {
  registerNewUser,
  login,
  logout,
  changePassword
};
```

Here we clear the cookie with name `jwt` using the API provided by Express framework : `response.clearCookie('jwt')`.

Now the test case should pass.
