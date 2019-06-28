# Session Cookie vs JWT

Which solution should we use for authorization and session management? Session cookie or JWT?

## Cookie vs JWT for authentication

What's the difference the two approaches?

The diagram below highlights the workflow of the two approaches:

![cookie vs token](https://cdn.auth0.com/blog/cookies-vs-tokens/cookie-token-auth.png)

If you are interested in the difference between these two approaches, here is a good article [Cookies vs Tokens: The Definitive Guide](https://auth0.com/blog/cookies-vs-tokens-definitive-guide/)

## Considerations

Here are some considerations when you need to choose between the two:

* Cookies and browsers work together. If you are developing desktop/mobile native applications that does not run in a browser, then you cannot use cookies.
* Cookies are managed by browsers and depend on browsers' support on some features \(such as Cross Origin Resource Sharing\). In construct, JWT token is mainly managed by your application codes. As a developer, you have more control on how JWT is used on the client side.
* A token issued by one service \(e.g. Facebook/Google\) can be trusted by other websites. In construct, a cookie issued by one website can only be used with the same website. So it's easier to implement [Single-Sign-On](https://en.wikipedia.org/wiki/Single_sign-on) across different websites with token based approach.
* You don't need to implement your own logic for issuing/verifying tokens. You can use service provided by [Auth0](https://auth0.com/).

