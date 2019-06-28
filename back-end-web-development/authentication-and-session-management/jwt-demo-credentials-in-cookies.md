# JWT Demo: Storing JWT token in cookie

In the current implementation, the server side returns the JWT token in the HTTP response body. The client side needs to save the JWT tokens somewhere and submit it in subsequent requests \(typically the JWT tokens can be sent in the HTTP header\).

Another possible way of maintaining JWT tokens is to save it in cookies. In this approach, the JWT tokens can be attached in the requests automatically \(by browser\). It relief the frontend application from the burden of maintaining JWT tokens.

Let's modify our current solution to try this new approach.

## Update test for login

Since we won't return JWT tokens in the HTTP response body for login, we need to update the test case accordingly.

The test case for login should stop checking the JWT token in response body and start checking the cookies returned.

```javascript
test("User login successfully", async () => {
  let email = fixtures.users.tom.email;
  let password = fixtures.users.tom.password;
  let response = await request(app)
    .post("/api/user/login")
    .send({ user: { email, password } });

  let userJson = response.body.user;
  expect(response.statusCode).toBe(200);
  expect(userJson).toBeDefined();
  expect(userJson.email).toEqual(email);
  const jwtTokenCookie = [expect.stringMatching(/jwt/)];
  expect(response.headers["set-cookie"]).toEqual(
    expect.arrayContaining(jwtTokenCookie)
  );
});
```

## Update test case for change password

To start with, lets update our test cases.

In the test case for changing password, we save the JWT token after login, and use them in the HTTP `Authorization` header of change password request.

If the JWT token is sent from server in cookies, the cookies should be automatically sent back to the server that issues the cookie.

Howe can we make sure the `supertest` library to handle cookies correctly \(i.e. save the cookies in previous responses and send them in the subsequent requests?\).

The trick is to use one `agent` across multiple requests. We use the term `agent` because of the underlying library [superagent](https://github.com/visionmedia/superagent) used by `supertest`. Each `agent` simulate a browser session.

Here is the documentation on [agent](http://visionmedia.github.io/superagent/#agents-for-global-state)

```javascript
async function loginAsTom(password, agent) {
  let email = fixtures.users.tom.email;
  let response = await agent
    .post("/api/user/login")
    .send({ user: { email, password } });

  expect(response.statusCode).toBe(status.OK);
}

test("Change password on the current user", async () => {
  const agent = request.agent(app);

  await loginAsTom(fixtures.users.tom.password, agent);

  const newPassword = "new-password";
  const updatedUser = {
    password: newPassword
  };

  let response = await agent
    .put("/api/user/change_password")
    .send({ user: updatedUser });

  expect(response.statusCode).toBe(status.OK);

  const agent2 = request(app);
  await loginAsTom(newPassword, agent2);
});
```

Note that in the test case we pass the same `agent` argument to the `loginAsTom` function and the call to the change password API. Then in these two calls, they would share the same cookies.

Now this test would fail because the server side still issues JWT in HTTP response body and expects the JWT to be submitted in HTTP request headers. We need to modify that.

## Install cookie-parser NPM package

In order for the server side to save JWT tokens in cookies, we need to install a new NPM package first.

```text
npm install cookie-parser
```

## Use the cookie-parser middleware

We need to update `app.js` to use the `cookie-parser` middleware:

```javascript
const cookieParser = require("cookie-parser");
​
app.use(cookieParser());
```

With this middleware, the cookies attached in HTTP requests can be parsed and saved into `req.cookies` property for the route handler to use.

## Send JWT tokens in cookies instead of HTTP response body

Now, we can update the login handler in `user_handler.js` to return the JWT tokens in cookie.

We need to modify the following code:

```javascript
const token = user.generateJWT();
return res.json({
  user: { username: user.username, email: user.email, token: token }
});
```

into

```javascript
// send token via res.cookie()
const token = user.generateJWT();
// TODO: we should also set "secure" option to true in the cookie, if our service supports HTTPS
res.cookie("jwt", token, {
  httpOnly: true,
  sameSite: true
});

return res.json({
  user: { username: user.username, email: user.email }
});
```

Note that we need to set the options on the cookie to make it secure:

* Use `httpOnly` option so that the cookies cannot be accessed by JavaScript \(and by right no JavaScript on the client side needs to read/write tokens in this cookie\)
* Use `sameSite` option so that the cookie is only sent in the request if the user visit the website that issues the cookie \(this is to prevent the CSRF\(Cross Site Request Forgery\) attack\).
* Use `secure` option so that the cookie is only returned when the website is visited using HTTPS, so that the cookie is encrypted during the transmission and no mean-in-the-middle can steal the token. We cannot enable it now since we currently still visit our website locally using `http://localhost:3000`. If you want to run your local node server under HTTPS, you can follow the [instructions here](https://medium.freecodecamp.org/how-to-get-https-working-on-your-local-development-environment-in-5-minutes-7af615770eec)

## Get JWT token from cookie instead of HTTP request header

The last step is to update the configuration for `express-jwt` so that we get JWT tokens from cookies instead of HTTP request headers.

In the `jwt_middleware.js` file, we should write a new function to get JWT tokens from cookies:

```javascript
function getTokenFromCookie(req) {
  let token = null;
  if (req && req.cookies) token = req.cookies["jwt"];
  return token;
}

module.exports = {
  required: jwt({
    secret: secret,
    userProperty: "user",
    getToken: getTokenFromCookie
  })
};
```

## Side note: how to include cookies in fetch\(\) requests in your frontend application

On your client web application, in the fetch requests relating to authentication \(e.g. /signin or /anyAuthenticatedRoute\), specify `credentials: 'include'` in your fetch options. For example:

```javascript
const URL = "https://localhost:3000"

fetch(${URL}/signInOrAnyAuthenticatedRoute, {
    // ... other options
    credentials: 'include'
  }
)
```

## Resources

* [How to send a cookie in an express app](https://expressjs.com/en/4x/api.html#res.cookie)
* [How to extract jwt from cookies](https://github.com/themikenicholson/passport-jwt)
* [Tell fetch to include credentials in cookies \(search for: credentials: ‘include’\)](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch%20)

