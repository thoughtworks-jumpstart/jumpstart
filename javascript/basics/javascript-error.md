# How to throw and catch errors in JavaScript

## Reporting abnormal scenarios by throwing errors

If your program encounter a situation that it cannot handle, you can throw errors to report the situation.

In the example below, an error is thrown when the given divider is zero.

```javascript

function divide(dividend, divisor) {
  if (divisor === 0) {
    throw new Error("The divisor cannot be zero");
  }
  // continue to check other cases to handle
}
```

## Handling errors with catch

When you call a function that may throw errors, and if you have a proper way to handle those errors, then you can choose to catch some of them.

```javascript

try {
  loadConfiguratoniFile(filePath);
} catch (error) {
  if (error.message === "file not found") {
    // use default configuration
    return defaultConfiguration;
  } else {
    // re-throw the error if we cannot handle it
    throw error;
  }
}
```

## Recommended Readings

- [Will it finally: a try/catch quiz](https://frontarm.com/james-k-nelson/will-finally-run-quiz/)

## Reference

- [MDN Docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Error)