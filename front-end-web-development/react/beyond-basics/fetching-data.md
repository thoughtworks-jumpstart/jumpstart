# Fetching data

Once we learn to fetch data using javascript, we can build front-end applications to present data in interesting ways!

## Learning checklist

* HTTP requests and responses
* What is fetch() API and how to use it
* How to handle the Promise returned from fetch() API call

## HTTP Requests and Responses

To start with, you need to have a better understanding on the HTTP requests and responses.

The MDN website provides a pretty good introduction on [HTTP](https://developer.mozilla.org/en-US/docs/Web/HTTP) itself.

The most relevant section is to understand [HTTP Request and Response Messages](https://developer.mozilla.org/en-US/docs/Web/HTTP/Messages)

There are some related knowledge you will also need to know:

* What is [JSON](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/JSON)
* [HTTP get vs post](https://www.w3schools.com/tags/ref_httpmethods.asp)
* [HTTP request/response headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers)
* [cookies](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies)
* [cross origin HTTP requests](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS)

## Fetch API

[Fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API) is a API provided by browsers that allow us to make HTTP requests from JavaScript codes and process the responses.

Firstly, checkout the [API documentation](https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch) to understand the input and output. 

* How do you specify the URL to send the request?
* How do you specify whether the HTTP request is a GET or POST?
* How do you specify different HTTP request headers?
* How to send cross origin requests?

You can find more examples on how to use Fetch [here](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch)

Note that this API returns a Promise. So you also need to know how to handle Promises (or use async/await).

  * You can either use `.then` or `.catch`, or
  * You can `await` on promise objects
  * [contrast with old-style callbacks](../../../javascript/asynchronous-javascript/comparing-3-approaches.md)

## Demo

We have a sample project that shows you how to call a web service that returns car park information in Singapore.

The web service is documented [here](https://data.gov.sg/dataset/carpark-availability)

The sample project is at [react-fetch-demo](https://github.com/thoughtworks-jumpstart/react-fetch-demo). You can fork/clone the project and see how it works.

## Lab

* [https://github.com/thoughtworks-jumpstart/fetch-react-lab](https://github.com/thoughtworks-jumpstart/fetch-react-lab)

## Using fetch in NodeJS environment

`fetch()` is an API provided by browsers, that means by default you can not use it when your JavaScript codes runs in a NodeJS environment. 

For example, if you write unit test for a React component that calls `fetch` and some tests trigger the `fetch` call, then the test case may fail because the test running environment (which is usually running on NodeJS) does not have this `fetch` API defined.

In this specific case, one solution is to mock out the `fetch` API in the test cases.

But if you do need to use the fetch API on the server side JavaScript application, you can use some libraries like [fetch JavaScript polyfill](https://github.com/github/fetch)

## Axios

Besides fetch, there is another library called [axios](https://github.com/axios/axios) that does the same thing but has some advantages over the native Fetch API: 

* It supports older browsers (Fetch needs a polyfill)
* It has as a way to abort a request.
* It has a way to set a response timeout.
* It has built-in CSRF protection.
* It supports upload progress.
* It performs automatic JSON data transformation.
* It works in Node.js environment as well

On the web, you can find many tutorials that teach you how to use axios. Here is [one example](https://code.tutsplus.com/tutorials/introduction-to-api-calls-with-react-and-axios--cms-21027)

## Resources

### Recommended reading

* [Fetching Data with React](https://www.robinwieruch.de/react-fetching-data/)

### References

* [Async functions - making promises friendly](https://developers.google.com/web/fundamentals/primers/async-functions)
* [MDN docs on promises](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Using_promises)
* [MDN docs on using fetch](https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch)
* [MDN tutorial on fetching data with XHR and Fetch](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Client-side_web_APIs/Fetching_data)
