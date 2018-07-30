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

