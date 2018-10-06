# Testing Async Functions with Jest

In previous sections, we have learned that some of the functions can be async (e.g. a function that tries to retrieve some data from another web server on the Internet). If we need to write test cases for those functions, we need to be careful. **We need to wait for the asynchronous function to return before a test case finishes.**

Here are some sample codes on how to test asynchronous functions.

In the codes below, the `fetchData` function is asynchronous and it returns a promise. So we can wait for the tasks to finish with `async/await`.

```javascript
test('the data is peanut butter', async () => {
  expect.assertions(1);
  const data = await fetchData();
  expect(data).toBe('peanut butter');
});

test('the fetch fails with an error', async () => {
  expect.assertions(1);
  try {
    await fetchData();
  } catch (e) {
    expect(e).toMatch('error');
  }
});
```

To make the tests easier to read, jest provides some helper functions like `.resolves` and `.rejects`. The same test cases can be re-written as below:

```javascript
test('the data is peanut butter', async () => {
  expect.assertions(1);
  await expect(fetchData()).resolves.toBe('peanut butter');
});

test('the fetch fails with an error', async () => {
  expect.assertions(1);
  await expect(fetchData()).rejects.toMatch('error');
});
```

Check out [jest documentation on how to test asynchronous functions](https://jestjs.io/docs/en/asynchronous.html) and you can also checkout a tutorial [here](https://jestjs.io/docs/en/tutorial-async).
