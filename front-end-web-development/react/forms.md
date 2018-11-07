# Forms

HTML form elements work a little bit differently from other DOM elements in React, because form elements naturally keep some internal state \(e.g. value of  field, which radio button is selected, etc\).

There are 2 ways to manage state in forms:

* [Controlled components](https://reactjs.org/docs/forms.html) \(The recommended approach\)
  * You need to write an event handler for every way your data can change and pipe all of the input state through a React component. 
* [Uncontrolled components](https://reactjs.org/docs/uncontrolled-components.html) 
  * Form data \(i.e. state\) is handled by the DOM itself. Instead of writing an event handler for every state update, you can use a ref to get form values from the DOM onSubmit.

This [article](https://goshakkk.name/controlled-vs-uncontrolled-inputs-react/) offers a good comparison of controlled and uncontrolled components, and when you should use which.

Both the controlled and uncontrolled form fields have their merit. Evaluate your specific situation and pick the approach — what works for you is good enough.

## Tips

* Don't forget to declare the "onChange" event handler on the input field if you follow the Controlled Component approach.
* Don't forget to call `event.preventDefault()` in the `onSubmit` event handler. Otherwise, the browser will try to submit the form and reload the current page.

## Build complicated forms with 3rd party react components

Although React provides the basic building blocks for us to build HTML forms, it's still hard to get the codes organized properly when you build complicated forms.

In such cases, you can check out existing React components that can help you out, like [formik](https://github.com/jaredpalmer/formik) and [react-final-form](https://github.com/final-form/react-final-form)