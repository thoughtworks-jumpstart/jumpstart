# How browser works

## Internals of Web Browsers

* [How Browsers Work: Behind the scenes of modern web browsers](https://www.html5rocks.com/en/tutorials/internals/howbrowserswork/)
* Inside look at modern web browser, [part1](https://developers.google.com/web/updates/2018/09/inside-browser-part1) and [part 2](https://developers.google.com/web/updates/2018/09/inside-browser-part2)

## Compatibility Issues across Browsers

There are a few well known brands for browsers \(e.g. Chrome/Firefox/IE/Edge\). Although they all try to confirm to the web standards \(with the exception of IE\), they do have different behaviors sometimes, and that makes the job of web developer very hard. For example, they all have some kind of experimental features and use their customized names like [Vendor Prefixes](https://en.wikipedia.org/wiki/CSS_hack#Browser_prefixes)

In early days, as a web developer, if you want your website to work properly \(and behave in the same way\) across all browsers, you need to understand the quirks of each browser and write a lot of if-else to handle different behaviors across browsers.

Because of the pain, people created various libraries and tools.

For example:

* [jQuery](https://jquery.com/), which provides built-in functions to hide the different behaviors across browsers and give us a consistent API.
* [Polyfill](https://addyosmani.com/blog/writing-polyfills/), a term coined by Remy Sharp to describe JavaScript shims that replicate the standard API found in native features of new browsers for those without such features. But if you are lazy, you don't need to write polyfills by yourself, and rely on services like [polyfill.io](https://polyfill.io/)
* Browser feature detection with [Modernizr](https://modernizr.com/docs/#what-is-modernizr)

Nowadays, the major browsers are more compliant with web standards, however, you still need to refer to websites like [Can I Use](https://caniuse.com/) to check if a given JavaScript/CSS/Browser API is supported in all major browsers.

