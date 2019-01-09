# React Testing Library

## What is it?

[react-testing-library](https://github.com/kentcdodds/react-testing-library) is a "Simple and complete React DOM testing utilities that encourage good testing practices."

It follows one principal:

> The more your tests resemble the way your software is used, the more confidence they can give you.

## How to use it?

In order to test some behavior of a React component, you typically need to follow the steps below:

- Render the target React component into a DOM tree
- Search the DOM tree to find out the HTML element you are interested in
- After that, you can:
  - Verify the HTML element match your expectation (e.g. the texts appearing on the screen, the CSS classes, the attributes, etc), or
  - Interact with the element by simulating some DOM event (e.g click a button)
  - Verify the DOM tree is updated according to the DOM event (i.e. verifying the event handlers are executed properly to handle the DOM event)

 With these steps in mind, [read the documentation](https://github.com/kentcdodds/react-testing-library) of this react-testing-library and answer the questions:

 - How to render a React component with the library? Which function should you use?
 - How to search an HTML element? What can you search with?
 - How to assert that some HTML element has expected attribute/CSS-class?
 - How to fire an event to simulate user interaction with the web application?
 - If some user interaction triggers asynchronous event, how do you wait for that event to finish (e.g. how do you wait for an element to appear on the screen before you go to the next step in tests?)

Here are some of the links you can keep as a reference:

- [API for DOM testing library](https://github.com/kentcdodds/dom-testing-library)
- [Custom matchers to assert expectation on DOM elements](https://github.com/gnapse/jest-dom)

Now [watch the video](https://www.youtube.com/watch?v=kCR3JAR7CHE&list=PLV5CVI1eNcJgCrPH_e6d57KRUTiDZgs0u) that the author demonstrate how to use this library.

If you like to see some examples of using react-testing-library, you can find it [here](https://github.com/kentcdodds/react-testing-library-course). The test cases can be found under "src/__tests__" folder.


### Tutorials

The github page of the project also includes a few useful links with examples:

Testing React Workshop @ Paypal Sep 2018 by Kent C. Dodds
- [Video Part 1](https://www.youtube.com/watch?v=w6KCDFssHFA) 
- [Video Part 2](https://www.youtube.com/watch?v=OP2c0gs369U)
- [Code examples](https://github.com/kentcdodds/react-testing-library-course/tree/workshop-2018-09)

Other Tutorials
- [Introduction to react testing library](https://chrisnoring.gitbooks.io/react/content/testing/react-testing-library.html)
- [React-testing-library have fantastic testing](https://medium.com/yazanaabed/react-testing-library-have-a-fantastic-testing-198b04699237)
- [Testing react components the right way with react-testing-library](https://dev.to/bahdcoder_47/testing-react-components-the-right-way-with-react-testing-library-5h8d)
- [Confident React with React-testing-library](https://www.youtube.com/watch?v=qXRPHRgcXJ0&list=PLV5CVI1eNcJgNqzNwcs4UKrlJdhfDjshf) by Kent C. Dodds
- [Test Driven Development with react-testing-library](https://www.youtube.com/watch?v=kCR3JAR7CHE&list=PLV5CVI1eNcJgCrPH_e6d57KRUTiDZgs0u) by Kent C. Dodds
- [Build a Joke App with TDD](https://medium.freecodecamp.org/quick-guide-to-tdd-in-react-81888be67c64) by Michal Baranowski
- [Build a comment feed with TDD](https://medium.freecodecamp.org/how-to-build-sturdy-react-apps-with-tdd-and-the-react-testing-library-47ad3c5c8e47) by Ian Wilson
- [A clear way to unit testing React JS components using Jest and react-testing-library](https://www.richardkotze.com/coding/react-testing-library-jest) by Richard Kotze
- [Integration testing in React](https://medium.com/homeaway-tech-blog/integration-testing-in-react-21f92a55a894) by Jeffrey Russom
- [React-testing-library have fantastic testing](https://medium.com/yazanaabed/react-testing-library-have-a-fantastic-testing-198b04699237) by Yazan Aabed
- [Building a react tooltip library and testing with react-testing-library](https://www.youtube.com/playlist?list=PLMV09mSPNaQmFLPyrfFtpUdClVfutjF5G) by Deepak Grover and Divyanshu Maithani
- [Creating Readable Tests Using React Testing Library](https://medium.com/flatiron-labs/creating-readable-tests-using-react-testing-library-2bd03c49c284) by Luke Ghenco 
- [A sample repo using react-testing-library to test a Relay Modern GraphQL app](https://github.com/zth/relay-modern-flow-jest-example) by Gabriel Noreborn

## Lab

### Lab 1

- Extend the [React Todo List](https://github.com/thoughtworks-jumpstart/react-todo-list) and add unit tests for your components. After you finish adding unit tests to the components, you can start from scratch again by implementing the components following Test Driven Development style.

### Lab 2

- [Here is a project](https://github.com/pinglinh/tutorial-the-guardian-search-app/tree/functional-app). The author showed how you can write unit test with a library called Enzyme. You can try to convert the unit tests to use `react-testing-library`.