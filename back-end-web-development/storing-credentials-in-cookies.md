# Storing credentials in cookies

Now that you've learned how to generate JWTs and use JWTs to authenticate requests on the server-side, let's learn how to securely store the JWTs on the client-side using cookies!

\(Note: Despite what 3/4 of the internet is saying, we are **not** going to store credentials and secrets in `sessionStorage` or  `localStorage`. While doing that would be convenient, our users' credentials would be [leaked](https://stormpath.com/blog/where-to-store-your-jwts-cookies-vs-html5-web-storage) in the event of an XSS attack.\)

Before we dive into implementation details, let's understand some fundamental concepts.

## A 2-minute crash course on cookies

TL;DR: A cookie is a string that we can send from a server to a client \(and vice versa\), just like your request or response body, headers, params, query parameters. It lives under the **Headers** of a request and response.

A cookie is a string beginning with a name-value pair, followed by zero or more attribute-value pairs. When the cookie is sent from the server to the client, it is sent in the response **headers** with a key of `Set-Cookie`.

```text
Example:

Set-Cookie: sessionId=31d4d96e407aad42; Path=/; Domain=abc.com 
```

When the client receives a cookie in the `Set-Cookie` header, the client stores the cookie together with its attributes. Subsequently, when the client makes a HTTP request, the client includes the applicable, non-expired cookies in the `Cookie` header. 

```text
// Server -> Client
Set-Cookie: sessionId=31d4d96e407aad42
Set-Cookie: userType=guest

// Client -> Server 
Cookie:     sessionId=31d4d96e407aad42 
Cookie:     userType=guest
```

Some clients \(e.g. Insomnia, Chrome\) will do this automatically, but we will later learn that in a front-end web applocation, `fetch()` won't do this automatically. We have to specify the `{ credentials: 'include' }` option in the fetch requests for which we want to include cookies.

## How to store/retrieve JWTs in a cookie in a back-end and front-end app

To skip straight to the code, see this [repo](https://github.com/thoughtworks-jumpstart/express-auth-demo).

Assuming you have implemented authentication using JWTs \(if not, read [this chapter](https://thoughtworks-jumpstart.gitbook.io/jumpstart/back-end-web-development/token-based-authentication) first\), implementing the storage/retrieval of JWTs in a cookie will involve the following:

* server side
  * Install and use `cookie-parser` middleware
  * Upon a successful sign-in, send JWT via `res.cookie()`
  * Update passport configuration to retrieve JWT from cookies \(instead of extracting from auth header as bearer token\)
  * Enable CORS and specify a whitelist of origins \(otherwise, the fetch\(\)  request will fail\)
* client side: how to include cookies in fetch\(\) requests
  * fetch\(`${URL}/signInOrAnyAuthenticatedRoute`, { method: ‘POST’, credentials: ‘include’ }\)

### Server-side: how to store/retrieve JWTs in cookies

1. Install and use `cookie-parser` middleware

```bash
$ npm install cookie-parser
```

```javascript
// app.js
const express = require("express");
const cookieParser = require("cookie-parser");

const app = express();
app.use(cookieParser());
```

2. Upon a successful sign-in, send JWT via `res.cookie()`

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
      httpOnly: true
    });
    res.json({ message: "ok" });
  } else {
    res.status(401).json({ message: "passwords did not match" });
  }
});
```

3. Update passport configuration to retrieve JWT from cookies \(instead of extracting from auth header as bearer token\)

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

4. Enable CORS and specify a whitelist of origins \(otherwise, the fetch\(\)  request will fail\)

```bash
$ npm install cors
```

```javascript
// app.js
const express = require("express");
const cors = require("cors");

var corsOptions = {
  origin: [/http:\/\/localhost:.*/, /http[s]*:\/\/.*\.herokuapp.com/],
  credentials: true
};

const app = express();
app.use(cors(corsOptions));

```

### Client-side: how to include cookies in fetch\(\) requests

On your client web application, in the fetch requests relating to authentication \(e.g. /signin or /anyAuthenticatedRoute\), specify `credentials: 'include'` in your fetch options. For example:

```javascript
const URL = "https://localhost:3000"

fetch(${URL}/signInOrAnyAuthenticatedRoute, { 
    // ... other options
    credentials: 'include' 
  }
)
```

### Testing Express routes that are protected using cookies

By default, supertest does not pass on cookies set by one response into subsequent requests. Since we need this ability when testing protected routes, we can use the [`agent`](http://visionmedia.github.io/superagent/#agents-for-global-state) functionality in supertest, which _does_ pass on cookies. Here is an example test:

```javascript
test("POST /secret returns a success response", async () => {
  const user = { username: 'newuser', password: 'password' };

  // Create an `agent` instead of using `request(app)` directly
  const agent = request.agent(app)
  
  // Use the agent to sign up
  await agent
    .post("/users/signup")
    .send(user);

  // Use the agent to sign in - this sets the JWT token in 
  // the response cookie
  await agent
    .post("/users/signin")
    .send(user)
  
  // Use the agent to request the protected route - this 
  // will include the cookie from the previous response
  const response = await agent
    .post("/secret")
    .send({ data: 'some data' });
  
  expect(response.status).toBe(201);
});
```

## Resources

* [how to send a cookie in an express app](https://expressjs.com/en/4x/api.html#res.cookie)
* [cookies in detail \(long and seemingly hard to read, but very clear explanation of cookies\)](https://tools.ietf.org/html/rfc6265#section-3)
* [how to extract jwt from cookies](https://github.com/themikenicholson/passport-jwt)
* [how to tell fetch to include credentials in cookies \(search for: credentials: ‘include’\)](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch%20)
