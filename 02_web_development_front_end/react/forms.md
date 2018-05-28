### [Forms](https://reactjs.org/docs/forms.html)

HTML form elements work a little bit differently from other DOM elements in React, because form elements naturally keep some internal state (e.g. value of <input> field, which radio button is selected, etc). 

There are 2 ways to manage state in forms:
- [Controlled components](https://reactjs.org/docs/forms.html) (The recommended approach)
  - You need to write an event handler for every way your data can change and pipe all of the input state through a React component. 
- [Uncontrolled components](https://reactjs.org/docs/uncontrolled-components.html) 
  - Form data (i.e. state) is handled by the DOM itself. Instead of writing an event handler for every state update, you can use a ref to get form values from the DOM onSubmit.

This [article](https://goshakkk.name/controlled-vs-uncontrolled-inputs-react/) offers a good comparison of controlled and uncontrolled components, and when you should use which.

Both the controlled and uncontrolled form fields have their merit. Evaluate your specific situation and pick the approach — what works for you is good enough.
