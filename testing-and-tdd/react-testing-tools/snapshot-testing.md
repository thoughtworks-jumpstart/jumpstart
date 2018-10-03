# Snapshot Testing

## Learning checklist

* What is snapshot testing
* How to write a snapshot test
* How to update a saved snapshot
* When to write snapshot tests

## What is snapshot testing

Jest provides a feature called [snapshot testing](https://jestjs.io/docs/en/snapshot-testing). You can use snapshot testing to prevent unexpected changes to the DOM structure of a React component.

Here is how it works:

* When you know your component under testing looks good, you write a unit test which save a snapshot of the component on the first run.
* Later, if you make some changes to the component and it renders differently, the test case would fail.
* You have a chance to check if the change is intended. If yes, accept the change and update the snapshot. Otherwise, fix the issue.

Note that the snapshot are usually saved into a directory (like `__snapshots__`). You should check these snapshots into your code repository as well.

## How do I write / run a snapshot test?

Example Snapshot Test

```javascript
// MyComponent.test.js
import React from 'react'
import {render} from 'react-testing-library'

test("Link renders correctly", () => {
  const {container} = render(<MyComponent/>);
  expect(container.firstChild).toMatchSnapshot();
});


// MyComponent.js
import React from "react";

const MyComponent = () => {
  <div>This is my component</div>
}
```

## How to update a snapshot if the changes in the code should be accepted?

Updating snapshots is easy. You either run jest -u from the command line, or in watch mode, press the u key to accept the changes in snapshots.

Then you need to check in the updated snapshots to code repository.

## When should we use snapshot testing?

**Important**: Snapshot tests are a complement to, **not** a replacement for, unit tests!

**The rule of thumb is, don't use snapshot testing by default. You should write a lot of unit test to verify the behavior of the React components.**

There are only a few scenarios when snapshot might make sense:

* When a component is purely presentational (i.e. there is no behavior at all). You can write one snapshot test once you are happy with what it presents.

* When you get a legacy codebase without any tests, and you want to quickly add some regression tests before you start major refactoring on the codebase.

## Exercise for SnapShot Testing

Add a snapshot tests for some components you wrote before, e.g. the ones in [React Todo List](https://github.com/thoughtworks-jumpstart/react-todo-list)

## Resources

### Recommended reading

* [Snapshot testing with Jest](https://facebook.github.io/jest/docs/en/snapshot-testing.html)
* [React Snapshot Testing: The Bad Parts](https://medium.com/@ntgard/jest-snapshot-testing-the-bad-parts-c93aca187ba5)
* [The case against React snapshot testing](https://engineering.ezcater.com/the-case-against-react-snapshot-testing)
* [Effective snapshot testing](https://blog.kentcdodds.com/effective-snapshot-testing-e0d1a2c28eca)
