# Testing React Components

## Terminology

To start with, let's define the terms below:

- System Under Test
- Unit Test
- Integration Test
- Dependency
- Mocking
- Testing Framework/Harness

## Guidelines

### Bad Practices

The following practices are considered bad because they tie your test cases to the implementation details of the React component under testing and make test cases harder to maintain:

- get/set state of the React component in your tests
- get an instance of the React component and call instance methods (which usually should be triggered by some browser events)

### Good Practices

In general, the principles followed by the [react-testing-library](https://github.com/kentcdodds/react-testing-library#guiding-principles) are good:

> The more your tests resemble the way your software is used, the more confidence they can give you.

This basically requires your test cases treat the component under test as a black box and interact with it in the same way how real users interact with it.

## Useful Libraries and Tricks

### jest

[jest](https://jestjs.io/) is a general purpose testing framework for JavaScript. It also provide some features such as [snapshot testing](https://jestjs.io/docs/en/snapshot-testing) and [async function testing](https://jestjs.io/docs/en/tutorial-async) which makes it easy to test React components.

### jest-dom

[jest-dom](https://github.com/gnapse/jest-dom) provides custom jest matchers to test the state of the DOM

### jest-fetch-mock

[jest-fetch-mock](https://github.com/jefflau/jest-fetch-mock) is a library that help testing codes that uses the `fetch` API provided by browsers.

### react-testing-library

The [react-testing-library](https://github.com/kentcdodds/react-testing-library) is an easy to use library for testing React components and it encourages good practices for testing. That's what we recommend in this course.

The library is built on top of [dom-testing-library](https://github.com/kentcdodds/dom-testing-library), so we will use this one as well.

### Enzyme (not used in this course)

[Enzyme](https://github.com/airbnb/enzyme) is a library developed by Airbnb for testing React components. It's still quite popular now but its API encourages some bad practices for testing (e.g. setting the state of the component under testing directly).

In this course, we will not use it.

## Resources

### Recommended reading

* [Testing with Jest in React](https://www.youtube.com/watch?v=59Ndb3YkLKA&feature=youtu.be) \(the talk is only 40 minutes. The remaining time is for Q&A\)

