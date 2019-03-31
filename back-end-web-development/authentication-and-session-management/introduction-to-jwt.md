# Introduction to JWT

## What is JWT

JSON Web Token \(JWT\) is an open standard \(RFC 7519\) that defines a compact and self-contained way for securely transmitting information between parties as a JSON object. This information can be verified and trusted because it is digitally signed.

## JWT token structure

The following text is copied from [jwt.io](https://jwt.io/introduction/).

Firstly, visit the [jwt.io website](https://jwt.io/) to have a look at some sample JWT token values, and how that value is constructed.

In its compact form, JSON Web Tokens consist of three parts separated by dots (.), which are:

- Header
- Payload
- Signature

Therefore, a JWT typically looks like the following.

```
xxxxx.yyyyy.zzzzz
```

### Header

The header typically consists of two parts: the type of the token, which is JWT, and the hashing algorithm being used, such as HMAC SHA256 or RSA.

For example:

```json

{
  "alg": "HS256",
  "typ": "JWT"
}

```

Then, this JSON is Base64Url encoded to form the first part of the JWT.

### Payload

The second part of the token is the payload, which contains the claims. Claims are statements about an entity (typically, the user) and additional data

An example payload could be:

```json

{
  "name": "John Doe",
  "admin": true
}

```

The payload is then Base64Url encoded to form the second part of the JSON Web Token.

### Signature

To create the signature part you have to take the encoded header, the encoded payload, a secret, the algorithm specified in the header, and sign that.

For example if you want to use the HMAC SHA256 algorithm, the signature will be created in the following way:

```json

HMACSHA256(
  base64UrlEncode(header) + "." +
  base64UrlEncode(payload),
  secret)

```
The signature is used to verify the message wasn't changed along the way, and, in the case of tokens signed with a private key, it can also verify that the sender of the JWT is who it says it is.

Note that you need a secret to sign and verify JWT tokens. This secret should be stored securely on the server side and only accessible to the application using this secret.

### Putting it together 

We have some simple codes to [demo the construction of a JWT token](https://github.com/thoughtworks-jumpstart/how-jwt-works)

### What is `base64url` encoding?

We have been using this term a few times above. What exactly is this thing? Why do we need it?

This is one algorithm that converts binary data (or text data) into a format that can be carried in HTTP request URL or headers.

According to the specification of HTTP protocol, there are certain characters (such as `+` and `=`) that are not allowed to apppar as part of URL or request/response header. On the other hand, people usually include JWT tokens as part of their HTTP requests (as we will show below), so it's important to make sure JWT token value do not contain those `forbidden` characters.

People created this [base64url encoding](https://github.com/brianloveswords/base64url) scheme for this purpose.

## Use JWT for http request authentication and authorization

In authentication, when the user successfully logs in using their credentials, a JSON Web Token can be returned to the client side (e.g. the mobile app or browser). The client side saves the token \(e.g in memory, or cookies\) and submit it to server again in subsequent requests.

Whenever the user wants to access a protected route or resource, the JWT token in the requests help to identify who the user is, and the server side application can decide if the request on the resource should be allowed (this is called **authorization**).

## How to submit JWT tokens to web servers

There are two ways for the client side to submit JWT tokens to the server side:

- Using HTTP request header. There is one HTTP header called `Authorization`. The content of the header should look like the following:

```text
Authorization: Bearer <token>
```

- If a JWT token is saved in cookies, the cookie is sent automatically together with the request when never the user visit the same server that issues the cookie.

## Demo

We have a [demo project](https://github.com/thoughtworks-jumpstart/express-jwt-lab) which shows you how to issue JWT token from server side and verify it in subsequent requests.

In the `app.js` file:

- The handler for `/signin` generates a JWT token and send it back in response body.
- The handler for `/secret` verifies the JWT token and only display secret text if the token can be verified

A library called [jsonwebtoken](https://github.com/auth0/node-jsonwebtoken) to sign and verify JWT tokens.

You clone the project, start the server, and test the API using REST API clients like Insomia.

## Benefit of using JWT

As JWTs are self-contained, all the necessary information is there, reducing the need to query the database.

To be specific, the user information is obtained from the JWT token instead of looking up in database on the server side. So it helps to make the authorization process faster and **stateless**.

This is beneficial, because when there are lots of users of a website, we can add more instance of web servers in the backend, and if the requests are stateless, that means a request an be served by any instance of web server. This make it very easy to scale the capacity of the website by adding more servers.

## Security Concerns of using JWT

### Protecting the secrets used for signing/verification of JWT tokens

On the server side, there is one secret that is used to sign/verify JWT tokens. Make sure this token is stored safely (in a file or database) that only the application itself has access.

If this secret is leaked, you have to change the secret, but that means all the tokens signed with the previous secret cannot be verified anymore. The users being affected have to do authentication again to acquire new tokens.

### Where to store JWT token on client/browser side?

If you use JWT, you need to decide where to store the tokens at browser side. You have two possible choices:

- Storing JWT token in memory only
- Storing JWT token in cookies

There are limitations and concerns to be addressed for each storage choice:

- If you store JWT tokens in browser memory only, that token is lost whenever the user refresh the browser page (and they need to authenticate again with the server side)

- If you store JWT tokens in cookies, you need to worry about security attacks like [CSRF](https://github.com/pillarjs/understanding-csrf). The good new is, this CSRF attack can be resolved by using [some middleware on Express application](https://github.com/expressjs/csurf), or setting the "SameSite=strict" flag in the session cookie (however, [some browsers don't support this SameSite attribute](https://caniuse.com/#feat=same-site-cookie-attribute)).

There are two other choices for storing JWT tokens but they are not recommended:

- You can use browser's [local storage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)
- You can use browser's [session storage](https://developer.mozilla.org/en-US/docs/Web/API/Window/sessionStorage)

There are security concerns of storing the JWT token in browser's local storage or session storage. For example, here are [some issues for local storage](https://www.owasp.org/index.php/HTML5_Security_Cheat_Sheet#Local_Storage). JavaScript has access to the browser storage. If a hacker injects some malicious script in to a website you are viewing, the script can load the tokens from your browser's storage and send them to the hacker. Then hacker can use your tokens!

You can find some [comparison here](https://auth0.com/docs/security/store-tokens) on different choices of storing JWT tokens.
[This article](https://stormpath.com/blog/where-to-store-your-jwts-cookies-vs-html5-web-storage) also provides more details on why storing JWT tokens in cookies is better than storing them in browsers' storage.

### Don't store sensitive data in JWT tokens

Another important thing to remember is by default the content in JWT token is not encrypted. So **don't put sensitive data into JWT tokens or you have to use** [**JSON Web Encryption \(JWE\)**](https://medium.facilelogin.com/jwt-jws-and-jwe-for-not-so-dummies-b63310d201a3).

### Use HTTPS to protect JWT token during transmission

When a JWT token is issued by the server side and sent back to the browser side, the token is transmitted on the Internet. If the connection is HTTP, any computer in the middle of the network transmission can get a copy of the token. Then some hacker can impersonate as other people by stealing other's JWT tokens.

This kind of attack is called "man-in-the-middle" attack.

To prevent this kind of attack, HTTPS should be used to encrypt the request/response data during transmission.

### Setting expiration time for each JWT token

It's a good practice to set an expiration time for each JWT token when they are issued, and the server side application should check for expiration when it gets a JWT token.

### There is no good way to revoke/invalidate a JWT token once it's issued

There are still some cases when you need to revoke/invalidate a JWT token before it's expired. For example, some employee leaves a company, then he should lose access to internal website of the company **immediately**. If the website is protected using JWT tokens, then the tokens issued to this ex-employee need to be revoked/invalidated immediately.

Unfortunately, there is no easy way to do that for JWT tokens. There are some solutions but the cost of implementing those solutions makes JWT less appealing.

For example, you can maintain a blacklist of users on the server side. The server side application needs to check if the user (identified by the JWT token) is in this black list before granting the user to access protected resources.

This solution works, however, if you do this, there is not much benefit of using JWT compared with session cookies.

### Clear session information when user logout

If you use JWT token for session tracking, all the session information is in the JWT token. When a user logout, your client side application needs to remove this token from its memory.

If the JWT token is saved in a cookie, the `logout` route handler on the server side needs to delete the cookie that stores JWT token upon user logout. That can be done via the [response.clearCookie()](https://expressjs.com/en/api.html#res.clearCookie) provided by Express framework.

## Resources

- [Securing Single Page Applications (good discussion on JWT)](http://www.fullstackradio.com/98)
- [Token Based Authentication for Single Page Apps (SPAs)](https://stormpath.com/blog/token-auth-spa)
- [Hasty Treat - Authentication - LocalStorage vs Cookies vs Sessions vs Tokens](https://syntax.fm/show/123/hasty-treat-authentication-localstorage-vs-cookies-vs-sessions-vs-tokens)