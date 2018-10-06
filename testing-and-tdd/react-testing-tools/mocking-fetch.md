# Mocking Fetch

Network requests made using the `fetch` API can be mocked in tests, either manually or by using a library. Mocking `fetch` manually requires a few steps:

```javascript
// src/App.test.js

const originalFetch = window.fetch;

beforeEach(() => {
  const mockData = [
    {
      title: "some book"
    },
    {
      title: "another book"
    }
  ];

  window.fetch = jest.fn(() => {
    return Promise.resolve({
      json() {
        return Promise.resolve(mockData);
      }
    });
  });
});

afterAll(() => {
  window.fetch = originalFetch;
});
```

This method works for mocking simple fetch requests but can be a little tedious when multiple requests and responses need to be handled. We can use the `jest-fetch-mock` library for such cases.

## jest-fetch-mock

[Jest Fetch Mock](https://github.com/jefflau/jest-fetch-mock) is a Jest plugin to mock the `fetch` function when running tests with Jest. To use it in React projects created with `create-react-app`, first install it:

```text
npm install --save-dev jest-fetch-mock
```

Then create a file `src/setupTests.js` with the following contents:

```javascript
// src/setupTests.js

global.fetch = require("jest-fetch-mock");
```

This will configure Jest to mock the global `fetch` function. This applies only to tests run with Jest, not the actual production app.

Finally, use the mocked `fetch` instance in the test:

```javascript
// src/App.test.js

beforeEach(() => {
  fetch.resetMocks();
});

test("fetches some data", async () => {
  fetch.mockResponseOnce(JSON.stringify(["book1", "book2"]));

  // invoke the function that calls `fetch` internally
  await someFunctionCallingFetch();

  expect(fetch).toHaveBeenCalledWith("https://expected/url");
});
```

Note that the body provided using `mockResponseOnce` has to be converted to a JSON string using the built-in `JSON.stringify` method.

### Demo with jest-fetch-mock

Check out how we can test the [react-fetch-demo](https://github.com/thoughtworks-jumpstart/react-fetch-demo/tree/test-with-jest-fetch-mock) with this `jest-fetch-mock` library.

One problem with this approach is the test case assumes the implementation of `carparkAvailability.js` uses `fetch` function. If we ever change the implementation of that module to use `axios` instead, the test case would fail.

## Put the data fetching logic into its own module

Another way to make testing fetching data easier is to put the logic for fetching data into its own module. Then the whole module can be mocked easily with jest.

Check out how we can test the [react-fetch-demo](https://github.com/thoughtworks-jumpstart/react-fetch-demo/tree/test-with-mocking-module) by extracting the data fetching logic into its own module and mock the module with jest.

The benefit of this approach is we can easily change the implementation of that `carparkAvailability.js` module. We could switch from `fetch` to `axios` without failing the test case.

## Recommended Reading

* [Testing Async JavaScript & API Calls](http://frontend.turing.io/lessons/module-3/testing-async.html)