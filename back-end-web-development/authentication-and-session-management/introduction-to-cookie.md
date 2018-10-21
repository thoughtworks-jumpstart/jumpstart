# Introduction to cookies

TL;DR: A cookie is a string that we can send from a server to a client (and vice versa), just like your request or response body, headers, params, query parameters. It lives under the Headers of a request and response.

## What is a cookie?

Cookies are small bits of data, \(maximum of 4KB long\), which hold data in a string of key=value pairs:

```text
name=value; name2=value2
```

These are set either by JavaScript in browser, or by the server side application using an HTTP response header.

Here is one example showing the 'Set-Cookie' in HTTP response headers:

```text
Set-Cookie: name2=value2; Expires=Tue, 2 April 2018 10:18:14 GMT; Path=/; Domain=abc.com
```

When the client receives a cookie in the `Set-Cookie` header, the client stores the cookie together with its attributes.
In the example above, the browser would set a cookie named `name2` with a value of `value2`, which would expire at the specified time. 

Subsequently, when the client makes a HTTP request, the client includes the applicable, non-expired cookies in the Cookie header.

Some clients (e.g. Insomnia, Chrome) will do this automatically, but when you call the `fetch` API from your frontend application, the `fetch` API won't do this automatically. You have to specify the { credentials: 'include' } option in the fetch requests for which we want to include cookies.

## How are cookies saved in browser?

Where does the browser save cookies it receives from server side? It depends on the type of cookie:

- session cookie (a.k.a transient cookie). The session cookie is stored in temporary memory and is not retained after the browser is closed. Session cookies are used for session tracking purposes.
- permanent cookie (a.k.a persistent cookie). The cookie is stored on your hard drive until it expires (persistent cookies are set with expiration dates) or until the user deletes the cookie.

Later on, when the user visit the same website, the cookie is attached by the browser automatically in each HTTP request.

When the server side receives such a cookie, it get get information inside the cookie and make good use of it.

## Session cookie for authorization 

In a session cookie, there is a field that stores a unique session ID, which is issued by the server side. When a session cookie is received on the server side, the server application can extract the session ID, and check if it's still valid. Typically the server side application maintains all the session information in a database, which is looked up to validate a session ID.

If the session ID from a session cookie is still valid, the remote user is identified and the request can be granted to access the resource on the server side accordingly. This process is called **authorization**.

## Generating cookies from Express application

How would the server side generate this `Set-Cookie` header in response? You can find some tutorial [here](https://www.codementor.io/noddy/cookie-management-in-express-js-du107rmna).

There are also some express middleware that help you to manage session cookies.

- [express-session](https://www.npmjs.com/package/express-session). This middleware only stores session ID in the cookie and store the rest of session related data on the server side (in memory, or in some session store).
- [cookie-session](https://www.npmjs.com/package/cookie-session). This middleware stores all session data in the cookie (so you need to make sure the total size of the cookie is less than 4KB).

## Create/Read/Delete cookies in frontend application

Unless a cookie is marked as [HttpOnly](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies#Secure_and_HttpOnly_cookies), a JavaScript running in your browser has access to cookies as well.

Here are some [examples](https://www.codexpedia.com/javascript/javascript-create-read-and-delete-cookies/) showing you how to create/read/delete cookies from client side JavaScript. 

If your frontend application is based on React, you can use this [react-cookie](https://www.npmjs.com/package/react-cookie) library to manage cookies from your React component.

## Security Considerations

Anything related to security needs to be taken carefully. This is also true when you deal with session cookies, since those cookies allows the client side application to access protected resources on the server side, extra care is needed to make sure the cookies are used securely. 

A few important tips are highlighted here. For more information, checkout the resource below:

- [Use cookies securely](https://expressjs.com/en/advanced/best-practice-security.html#use-cookies-securely)

### Set Cookie Security Options

If you use cookies, you need to turn on some cookie configuration, e.g. "Secure", "SameSite" and "HttpOnly".

* A cookie with "Secure=true" is only sent to the server with a encrypted request over the HTTPS protocol.
* A cookie with "HttpOnly=true" is inaccessible to JavaScript in the browser
* A cookie with "SameSite=strict" prevents the browser from sending this cookie along with cross-site requests. This helps to prevent a kind of security attack called [cross-site request forgery (CSRF or XSRF)](https://github.com/pillarjs/understanding-csrf).

### Protect the information in cookie

If you use cookies to store session information, you need to decide where to store the session information:

* You can store all the session related data in cookies.
* You can store only session identifier in the cookies and store the rest of session data on server side \(e.g. in a database\)

If you follow the first approach, you need to encrypt some information in the cookie if that's a secret.

### Clear session information when a user logout 

When a user logout from a website, all the information about that session needs to be cleared:

- On the server side, if there are any session information saved in the memory/file/database, that needs to be cleared. This can be done by the request handler for the `/logout` route.

- On the client side, if the session information is tracked in a cookie, the cookie needs to be removed. This can be done with JavaScript. As a developer, you just need to know the name of the session cookie to be removed.

## Demo: Using cookies for session tracking

[This video](https://auth0.com/docs/security/store-tokens#understanding-sessions-and-cookies) will show you how to handle session data when building a web app. It will help you understand how your application uses cookies and sessions to manage the state of an authenticated user. This video example uses Node.js with Passport, but the techniques apply to any traditional server-based web application.

## Reference

- [Cookies](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies)
- [Cookies in detail \(long and seemingly hard to read, but very clear explanation of cookies\)](https://tools.ietf.org/html/rfc6265#section-3)