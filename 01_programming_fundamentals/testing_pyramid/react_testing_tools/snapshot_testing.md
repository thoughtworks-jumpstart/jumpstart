# Snapshot Testing

`jest` comes with a snapshot testing feature.

### Learning checklist

* what is snapshot testing
* how to write a snapshot test
* how to update a saved snapshot

### How do I write / run a snapshot test?

Example Snapshot Test

```javascript
// MyComponent.test.js
import renderer from "react-test-renderer";

test("Link renders correctly", () => {
  const tree = renderer.create(
    <MyComponent />
  ).toJSON();
  expect(tree).toMatchSnapshot();
});


// MyComponent.js
import React from "react";

const MyComponent = () => {
  <div>This is my component</div>
}
```

The first time the test is run, Jest will capture a JSON representation of the rendered component into a snapshot file. During future runs, the test will compare the latest JSON with the snapshot file. If it is the same, everything is fine. If not, the test fails. You then need to inspect the differences and decide whether the new output is correct. If it is, you update the saved snapshot. If it isn’t, you fix your code.

Updating snapshots is easy. You either run jest -u from the command line, or in watch mode, press the u key.

**Important**: Snapshot tests are a complement to, **not** a replacement for, unit tests!

### Resources

#### Recommended reading

* [Snapshot testing with Jest](https://facebook.github.io/jest/docs/en/snapshot-testing.html)
* [Effective snapshot testing](https://blog.kentcdodds.com/effective-snapshot-testing-e0d1a2c28eca)

### Assignment

Add snapshot tests to your existing React application(s)
