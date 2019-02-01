# React

## What is React?

React is a declarative, efficient, and flexible JavaScript library for building [Single Page Application(SPA)](https://medium.com/@pshrmn/demystifying-single-page-applications-3068d0555d46). It allows you to create front-end applications through the creation of reusable, decoupled and testable components.

## What can I build with React?

To get some ideas of what you can build with React, check out:

* [https://react.rocks/](https://react.rocks/)
* [http://builtwithreact.io/](http://builtwithreact.io/)  
* [http://facebook.github.io/react-native/showcase.html](http://facebook.github.io/react-native/showcase.html) \(React Native also uses the same syntax and patterns as React for building mobile applications\)
* [https://facebook.github.io/react-vr/](https://facebook.github.io/react-vr/) \(React VR also uses the same syntax and patterns as React for building VR applications!\)

## What's the benefit of using React?

React allows you to build interactive/dynamic UI in declarative style.

Demo: Simple page \([without React](https://codepen.io/davified/pen/KQodXj) vs [with React](https://codepen.io/davified/pen/jZzPpK)\)

Problems with direct DOM manipulation with JavaScript:

1. **Imperative**. We have to specify line by line what the HTML should look like, and our javascript code is tightly coupled to the HTML layout (e.g. i need to get the second paragraph to do xyz)
2. The tight coupling leads to unexpected breaking changes. If somebody adds a paragraph to the top of the html page, our javascript code with break
3. Imperative style is awkward and verbose. we have to reach inside the DOM, get the node, change the node in javascript, and then stick it back in the DOM.
4. Not unit-testable
5. Difficult to modularize. As this app grows, the javascript/HTML file is likely to grow longer and longer.

Benefits with React approach in this demo:

1. **Declarative**. We declare (using JSX) what the HTML should look like and React makes it so!
2. Only 1 line of HTML!
3. Ability to use javascript logic makes code less verbose
4. Easy to unit-test
5. Easy to modularize
6. Easy to read ==> Easy to scale and maintain

## How to learn React?

When working with React, you will undoubtedly face new and scary jargon. An important way to learn and be effective with React is to:

* Understand its building blocks \(e.g. JSX, components, `props`, `state`, etc\)
* Build on what you have learnt about Javascript \(functions, classes, ES6 syntax, static methods, modules, etc.\). Make sure you know those [Javascript fundamental](https://www.robinwieruch.de/javascript-fundamentals-react-requirements/).
* Build applications with React.

To start with, you can follow this [official React Getting Started Guide](https://reactjs.org/docs/hello-world.html) \(Recommendation: Work through tutorial up through till 'Thinking in React'\)

## Online Courses

* [The React Course](https://thereactcourse.com/) by [Flavio Copes](https://flaviocopes.com/react/)
* [Pure React](https://daveceddia.com/pure-react/) by [Dave Ceddia](https://daveceddia.com/)
* [Full Stack React](https://www.fullstackreact.com/) by [Tyler McGinnis](https://tylermcginnis.com/)
* [Mastering React](https://codewithmosh.com/p/mastering-react) by [Mosh Hamedani](https://codewithmosh.com/)

## Online Editors

* [React sandbox](https://codesandbox.io/s/) and [Stack Blitz](https://stackblitz.com/) are useful for trying out React snippets online.

## Resources

* [A huge collection of useful websites related to React](https://github.com/markerikson/react-redux-links)
* [Another awesome react collection](https://github.com/enaqx/awesome-react)
