# Sending HTTP Requests with `fetch`

## Libraries to Choose From

Sometimes, your application needs to send HTTP requests to another website/web-service and process the responses.

If your application runs in a browser (i.e. you are building front-end web applications), this kind of tasks can be done via the [fetch](https://github.com/github/fetch) library. **This library works only in the browser environment**.

Besides the `fetch` library, here are a few other popular open source libraries you can use to send HTTP requests (these few libraries works in both browser and in node.js environment:

- [axios](https://github.com/axios/axios)
- [superagent](https://github.com/visionmedia/superagent)
- [request](https://github.com/request/request)

## Learn `fetch` API with an example

In this section, we will focus on learning the `fetch` library by implementing a frontend application that retrieve data from back-end services.

**TODO: write this tutorial**

We can try to call the following API:
- [Sample API for CRUD-ing /blogposts and /users](http://jumpstart-blogging-api.herokuapp.com/)

Or we can call the https://github.com/HackerNews/API

If we call the hacker news API, we can fork this project https://github.com/the-road-to-learn-react/hackernews-client
and change the code to use `fetch` instead of axios (or shall we change the tutorial to use axios?)

## How to write unit tests for codes that contains fetch

- [Mocking http requests made using fetch](http://www.wheresrhys.co.uk/fetch-mock/quickstart)

## Handling CORS Issues When Making Requests to the Back-end

When your frontend application tries to make a connection to one URL which is different from the one where the application is downloaded, it's possible that you are going to see some error like the one below

> Fetch API cannot load http://your-api-url. No 'Access-Control-Allow-Origin' header is present on the requested resource. Origin 'http://your-api-url' is therefore not allowed access.

When that happens, you need to make your web-service to support CORS(Cross Origin Resource Sharing) so that your frontend app can call it.

To make the back-end web service supports CORS, the exact steps varies depending on the web application framework used by the web service.

### Resources

- [Udacity Course: Asynchronous JavaScript Requests](https://www.udacity.com/course/asynchronous-javascript-requests--ud109)
- [fetch API](https://davidwalsh.name/fetch)
- [fetching data in React](https://www.robinwieruch.de/react-fetching-data/)

### Assignment

Instructions:

- Make HTTP GET requests at any data.gov API: https://developers.data.gov.sg/data-gov-sg-apis/apis or http://jsonplaceholder.typicode.com/ (e.g. /comments, /posts, /photos)
- `console.log()` the HTTP response
- Explore the data by logging different parts of the response (e.g. traverse the arrays/objects)
- Bonus: Display data on a HTML page
