# Introduction to cookies

## What is a cookie?

Cookies are small bits of data, \(maximum of 4KB long\), which hold data in a key=value pairs:

```text
name=value; name2=value2
```

These are set either by JavaScript in browser, or by the server side application using an HTTP response header.

Here is one example showing the 'Set-Cookie' in HTTP response headers:

```text
Set-Cookie: name2=value2; Expires=Tue, 2 April 2018 10:18:14 GMT
```

Upon receiving this response, the browser would set a cookie named `name2` with a value of `value2`, which would expire at the specified time. 

Where does the browser save cookies it receives from server side? It depends on the type of cookie:

- session cookie (a.k.a transient cookie). The session cookie is stored in temporary memory and is not retained after the browser is closed. Session cookies are used for session tracking purposes.
- permanent cookie (a.k.a persistent cookie). The cookie is stored on your hard drive until it expires (persistent cookies are set with expiration dates) or until the user deletes the cookie.

Later on, when the user visit the same website, the cookie is attached by the browser automatically in each HTTP request.

When the server side receives such a cookie, it get get information inside the cookie and make good use of it.

## Session cookie for authorization 

In a session cookie, there is a field that stores a unique session ID, which is issued by the server side. When a session cookie is received on the server side, the server application can extract the session ID, and check if it's still valid. Typically the server side application maintains all the session information in a database, which is looked up to validate a session ID.

If the session ID from a session cookie is still valid, the remote user is identified and the request can be granted to access the resource on the server side accordingly. This process is called **authorization**.

## Generating cookie from Express application

How would the server side generate this `Set-Cookie` header in response? You can find some tutorial [here](https://www.codementor.io/noddy/cookie-management-in-express-js-du107rmna).

There are also some express middleware that help you to manage session cookies.

- [express-session](https://www.npmjs.com/package/express-session). This middleware only stores session ID in the cookie and store the rest of session related data on the server side (in memory, or in some session store).
- [cookie-session](https://www.npmjs.com/package/cookie-session). This middleware stores all session data in the cookie (so you need to make sure the total size of the cookie is less than 4KB).

## Security Considerations

Anything related to security needs to be taken carefully. This is also true when you deal with session cookies, since those cookies allows the client side application to access protected resources on the server side, extra care is needed to make sure the cookies are used securely. 

A few important tips are highlighted here. For more information, checkout the resource below:

- [Use cookies securely](https://expressjs.com/en/advanced/best-practice-security.html#use-cookies-securely)

### Set Cookie Security Options

If you use cookies, you need to turn on some cookie configuration, e.g. "Secure", "SameSite" and "HttpOnly".

* A cookie with "Secure=true" is only sent to the server with a encrypted request over the HTTPS protocol.
* A cookie with "HttpOnly=true" is inaccessible to JavaScript in the browser
* A cookie with "SameSite=strict" prevents the browser from sending this cookie along with cross-site requests. This helps to prevent a kind of security attack called cross-site request forgery (CSRF or XSRF).

### Protect the information in cookie

If you use cookies to store session information, you need to decide where to store the session information:

* You can store all the session related data in cookies.
* You can store only session identifier in the cookies and store the rest of session data on server side \(e.g. in a database\)

If you follow the first approach, you need to encrypt some information in the cookie if that's a secret.

## Demo: Using cookies for session tracking

[This video](https://auth0.com/docs/security/store-tokens#understanding-sessions-and-cookies) will show you how to handle session data when building a web app. It will help you understand how your application uses cookies and sessions to manage the state of an authenticated user. This video example uses Node.js with Passport, but the techniques apply to any traditional server-based web application.

## Reference

- [Cookies](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies)