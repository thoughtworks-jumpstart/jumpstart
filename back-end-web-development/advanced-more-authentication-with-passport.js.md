# Advanced: More authentication with Passport.js

When you build an API in real use cases, some of the APIs should only be accessed after user login to your system.

In this section, we will learn how to protect your APIs using a middleware called [passport](http://www.passportjs.org/)

## What does Passport.js do?

Passport is authentication middleware for Node. It is designed to serve a singular purpose: authenticate requests.

In modern web applications, authentication can take a variety of forms. Traditionally, users log in by providing a username and password. With the rise of social networking, single sign-on using an OAuth provider such as Facebook or Twitter has become a popular authentication method. Services that expose an API often require token-based credentials to protect access.

Passport recognizes that each application has unique authentication requirements. Authentication mechanisms, known as strategies, are packaged as individual modules. Applications can choose which strategies to employ, without creating unnecessary dependencies.

In this workshop, we will see a few examples:

* Authentication with username and password
* Authentication with Facebook/Github account

We will also see two ways of maintaining sessions: cookies and tokens.

## Side Note: Two ways of Session Tracking: Cookies vs Tokens

Once a user login to a server side application, we need some approach to identify the user in his subsequent requests sent to the same server.

There are two major choices for this purpose:

* [Cookies](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies)
* [JSON Web Token\(JWT\)](https://jwt.io/introduction/)

If these two terms are new to you, spend some time to read the two links above.

Here are some quick definitions for reference:

### Cookies

Cookies are small bits of data, \(maximum of 4KB long\), which hold data in a key=value pairs:

```text
name=value; name2=value2
```

These are set either by JavaScript, or via the server using an HTTP header. Cookies can have an expiry time set.

Here is one example showing the 'Set-Cookie' in HTTP response headers:

```text
Set-Cookie: name2=value2; Expires=Tue, 2 April 2018 10:18:14 GMT
```

Upon receiving this response, the browser would set a cookie named name2 with a value of value2, which would expire at the specified time. When the server side receives such a cookie, it should validate the cookie hasn't expired yet \(this is usually done by some library/web application framework automatically\).

How would the server side generate this `Set-Cookie` header in response? You can find some tutorial [here](https://www.codementor.io/noddy/cookie-management-in-express-js-du107rmna).

There are also express middleware that help you to generate session cookies. Session cookies are used for session tracking purposes and they are automatically deleted by the browsers when you close the browser window/tab.

### JWT

JSON Web Token \(JWT\) is an open standard \(RFC 7519\) that defines a compact and self-contained way for securely transmitting information between parties as a JSON object. This information can be verified and trusted because it is digitally signed.

In authentication, when the user successfully logs in using their credentials, a JSON Web Token will be returned and must be saved locally \(typically in local storage, but cookies can be also used\).

Whenever the user wants to access a protected route or resource, the user agent should send the JWT, typically in the Authorization header using the Bearer schema. The content of the header should look like the following:

```text
Authorization: Bearer <token>
```

This is a stateless authentication mechanism as the user state is never saved in server memory. The server's protected routes will check for a valid JWT in the Authorization header, and if it's present, the user will be allowed to access protected resources.

As JWTs are self-contained, all the necessary information is there, reducing the need to query the database multiple times.

### Cookie vs JWT

The diagram below highlights the workflow of the two approaches:

![cookie vs token](https://cdn.auth0.com/blog/cookies-vs-tokens/cookie-token-auth.png)

If you are interested in the difference between these two approaches, here is a good article [Cookies vs Tokens: The Definitive Guide](https://auth0.com/blog/cookies-vs-tokens-definitive-guide/)

### Security Considerations

No matter which approach you take, there are some security implications.

If you use cookies, you need to turn on some cookie configuration, e.g. "Secure", "SameSite" and "HttpOnly".

* A secure cookie is only sent to the server with a encrypted request over the HTTPS protocol.
* HttpOnly cookies are inaccessible to JavaScript
* SameSite prevents the browser from sending this cookie along with cross-site requests.

If you use cookies to store session information, you need to decide where to store the session information:

* You can store all the session related data in cookies.
* You can store only session identifier in the cookies and store the rest of session data on server side \(e.g. in a database\)

If you follow the first approach, you may need to encrypt some information in the cookie if that's a secret.

If you use JWT, you need to decide where to store the tokens at browser side.

* You can use browser's [local storage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)
* You can use browser's [session storage](https://developer.mozilla.org/en-US/docs/Web/API/Window/sessionStorage)
* Store JWT in cookies

There are limitations and concerns to be addressed for each storage choice. For example, here are [some issues for local storage](https://www.owasp.org/index.php/HTML5_Security_Cheat_Sheet#Local_Storage). You can find [detailed comparison here](https://auth0.com/docs/security/store-tokens).

Another important thing to remember is by default the content in JWT token is not encrypted. So **don't put sensitive data into JWT tokens or you have to use** [**JSON Web Encryption \(JWE\)**](https://medium.facilelogin.com/jwt-jws-and-jwe-for-not-so-dummies-b63310d201a3).

Now let's take a look at how we can use Passport.js to protect your API.

## Example: Authentication with username and password

We have created a sample project in the course material repository. Let's clone this repository and study the codes related to authentication.

```text
git clone https://github.com/thoughtworks-jumpstart/express_passport_mongoose_example.git
cd express_passport_mongoose_example
npm install
```

This sample codes show how to configure passport.js to allow username and password based authentication.

Before we start, read the documentation of the following libraries used in this project:

* [passport-local](https://github.com/jaredhanson/passport-local)
  * This implements a strategy for passport.js to allow username/password authentication
* [express-jwt](https://github.com/auth0/express-jwt)
  * This allows us to track user sessions with JWT\(JSON Web Token\)
* [jsonwebtoken](https://github.com/auth0/node-jsonwebtoken)
  * This implements the logic to generate JSON Web Token after a successful authentication

### Authentication Logic

Firstly, look at the codes in `config/passport.js` file. This LocalStrategy configuration tells Passport.js library where to find username/password in a request, and how to perform authentication.

This configuration is included in the `app.js` with the line below:

```javascript
require("./config/passport");
```

Then, look at the public API for authentication, in `routes/api/users.js` file.

```javascript
router.post("/users/login", userMiddleware.login);
```

This leads us to the `login` method in the `middlewares/user_middleware.js`, in which we call Passport.js to perform the authentication.

Pay attention to how we tell Passport.js to use the `local` authentication strategy and disabled cookie based session \(because we are using JWT to track session in this example\).

```javascript
  passport.authenticate("local", { session: false }, function(err, user, info) {...}
```

### Session Tracking with JSON Web Token \(JWT\)

Once an authentication is done successfully, a JSON Web Token \(JWT\) is issued and returned to the API caller.

The content of JWT token is controlled by the application code as well. You can find it in the `generateJWT` method in `models/User.js`.

You can see the JWT token issued by the application contains three fields:

* userid
* username
* exp

In subsequent API calls, the caller can include this token in the HTTP request `Authorization` header.

On the server side, for the APIs that can only be accessed after authentication, we need to make use of the `express-jwt` middleware to enforce an valid token is given.

For example, in the `routes/api/users.js` file, the following API is protected:

```javascript
router.get(
  "/user",
  jwt.required,
  handleAsyncError(userMiddleware.getCurrentUser)
);
```

What is that `jwt.required`? It's a configuration of `express-jwt` middleware, and you can find the implementation in `middlewares/jwt_middleware.js` module.

In that file, you can find two configurations of `express-jwt`:

* "required", which means the middleware will enforce a valid JWT token must be given in the request. If a valid JWT token is found, it would be saved in `req.jwt` property.
* "optional", which means the middleware would allow access to an API even though a JWT token is not given; however, if a valid JWT token is given, it will save the token in the request \(e.g. in the `req.jwt` property\)

The route handlers after this `jwt.required` middleware can assume the `req.jwt` property is always set once an request passes the check by the `express-jwt` middleware. Then it can make use of the information save in the JWT token \(e.g. looking up a user from database based on the user ID\).

## Example 2: Session Tracking with Cookies

To see an example of configuring Passport.js to use username/password authentication, and use cookies for session tracking, you can take a look at two examples:

* [Example provided in Passport repository](https://github.com/passport/express-4.x-local-example)
* [Node.js Authentication using Passport.js](https://blog.risingstack.com/node-hero-node-js-authentication-passport-js/)

Note that there are two express middleware for you to manage session with cookies:

* If you want to store session information on the server side \(i.e. the session cookies only contain session IDs\), you can use [express-session](https://github.com/expressjs/session).
* If you want to store session information on the client side \(i.e. the session cookies contain all session information\), you can use [cookie-session](https://expressjs.com/en/resources/middleware/cookie-session.html)

## Lab: Authentication with Facebook and Github account

Now, take a look at the following tutorial and try it out by yourself:

* [Configure Passport.js to login with Facebook and Github](https://www.sitepoint.com/passport-authentication-for-nodejs-applications/)

