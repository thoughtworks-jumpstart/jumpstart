# Type Checking

As your app grows, you can catch a lot of bugs with typechecking.

The `prop-types` library gives us 2 things: \(i\) prop validation and \(ii\) defaults when we don’t provide values for them.

## Learning checklist

* `yarn add prop-types`
* how to assign the special propTypes property to a React component
* the difference between `PropTypes.number` and `PropTypes.number.isRequired`
* how to set default property values

### PropTypes validation help us catch bugs

Example of a component **without** PropTypes validation \(this is bad! you'll see why\)

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

Example of a component **with** PropTypes validation

```javascript
// Content.js
import React from "react";

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

## Resources

### Recommended reading

* [Why Typechecking is important](https://www.quora.com/Why-is-type-checking-important-in-programming-languages-and-how-should-one-choose-between-dynamically-and-statically-typed-languages)
* [Type checking with PropTypes\(must read\)](https://reactjs.org/docs/typechecking-with-proptypes.html) 
* [Custom prop type validation utilities provided by AirBnB](https://github.com/airbnb/prop-types)

## Assignment

* Install `prop-types` yarn package and add propTypes validation in your existing react project
* For each component that uses `props` or `this.props`, add propTypes validation
* Try setting default values for certain properties where you think it's appropriate

