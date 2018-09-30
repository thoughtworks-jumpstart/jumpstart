# Type Checking

As your app grows, you can catch a lot of bugs with typechecking.

The `prop-types` library gives us 2 things: \(i\) prop validation and \(ii\) defaults when we don’t provide values for them.

## Learning checklist

* `npm install prop-types`
* how to assign the special propTypes property to a React component
* the difference between `PropTypes.number` and `PropTypes.number.isRequired`
* how to set default property values

## PropTypes validation help us catch bugs

The example below shows a component **without** PropTypes validation \(this is bad! you'll see why\)

```javascript
// Content.js
import React from "react";

const Content = props => {
  return <h1>{props.title}</h1>;  // Content needs a 'title' property
};

export default Content;

// Page.js (a Page contains a Content component)
import React from "react";
import Content from "./content";

const Page = props => {
  return <Content />;  
  // SILENT BUG! 
  // No 'title' props is passed in, but this fails silently, leading to a empty page. 
  // Embarrassing!
};

export default Page;
```

To fix the problem, we can declare the property types for the `Content` component and enable PropTypes validation.

```javascript
// Content.js
import React from "react";
import PropTypes from 'prop-types';

const Content = props => {
  return <h1>{props.title}</h1>;  // Content needs a 'title' property
};

Content.propTypes = {
  // this will create a console error if any users of <Content /> forget to pass in the title property
  title: PropTypes.string.isRequired  
};

export default Content;


// Page.js (a Page contains a Content component)
import React from "react";
import Content from "./content";

const Page = props => {
  return <Content />;  
  // We see an error in our console! Yay! 
  // We can fix it now by passing in the 'title' property <Content title="awesome stuff" />
  // No more embarrassing bug in production!
};

export default Page;
```

## Default Prop Values

You can also set default values for props using `YourComponent.defaultProps`.

For example:

```javascript
import React, { Component } from "react";

class AppButton extends Component {
  render() {
    return <button onClick={this.props.onClick}>{this.props.message}</button>;
  }
}

AppButton.defaultProps = {
  message: "Hello",
  onClick: function() {
    alert("Hello");
  }
};

export default AppButton;
```

## Lab

* Install `prop-types` npm package and add propTypes validation in your [React Todo List](https://github.com/thoughtworks-jumpstart/react-todo-list)
* For each component that uses `props` or `this.props`, add propTypes validation
* Try setting default values for certain properties where you think it's appropriate

## Resources

### Recommended reading

* [Why Typechecking is important](https://www.quora.com/Why-is-type-checking-important-in-programming-languages-and-how-should-one-choose-between-dynamically-and-statically-typed-languages)
* [Type checking with PropTypes\(must read\)](https://reactjs.org/docs/typechecking-with-proptypes.html) 
* [Custom prop type validation utilities provided by AirBnB](https://github.com/airbnb/prop-types)

### Extended reading

* [Adding static type checking for JavaScript with Flow.js](https://flow.org/)
* [TypeScript is a super set of JavaScript that comes with static type checking](https://www.typescriptlang.org/)