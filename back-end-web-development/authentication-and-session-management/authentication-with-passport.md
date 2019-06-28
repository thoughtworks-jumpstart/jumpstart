# Authentication with Passport.js

When you build an API in real use cases, some of the APIs should only be accessed after user login to your system.

In previous sections, we have implemented the authentication and authorization logic by ourselves. That works in simple scenarios, but the work becomes more tedious when we need to support more scenarios:

* How to support login with Facebook account?
* How to support JWT tokens issued by a 3rd party provider like [Auth0](https://auth0.com/)

In this section, we will learn how to protect your APIs using a middleware called [passport](http://www.passportjs.org/)

## What does Passport.js do?

Passport is authentication middleware for Node. It is designed to serve a singular purpose: authenticate requests.

In modern web applications, authentication can take a variety of forms. Traditionally, users log in by providing a username and password. With the rise of social networking, single sign-on using an [OAuth](https://oauth.io/) provider such as Facebook or Twitter has become a popular authentication method. Services that expose an API often require token-based credentials to protect access.

Passport recognizes that each application has unique authentication requirements. [Authentication mechanisms, known as strategies](http://www.passportjs.org/packages/), are packaged as individual modules. Applications can choose which strategies to employ, without creating unnecessary dependencies.

We will show you a few commonly used strategy here:

* Local Strategy: authentication with username and password
* Facebook/Github Strategy: authentication with Facebook/Github account
* JWT Strategy: validate JWT tokens in HTTP requests 

