# Mocking a React component

When you write unit test for a React component, sometimes you may need to mock the components it depend on. For example, you may want to check if a component receives correct props from its containing component. In this case, you can mock the target component and verify the arguments received by the component's `render` function.

Mocking React component is not very much different from mocking a regular JavaScript module. You can simply use the `jest.mock` API.

```javascript

jest.mock("path/to/the/component", () => {
  return (props) => <div>Hello {props.name}!</div>
})
```

In the example above, you mock the React component at the specified path with your implementation 

```javascript
  (props) => <div>Hello {props.name}!</div>
```

Then when some other React component needs to load the component, your mock implementation would be used instead.

I have [one sample project](https://github.com/songguoqiang/react-password-strength-meter) that demonstrates this trick.

In the source codes of the sample project, if you look at the `App.test.js` file, you can find how the `PasswordStrengthMeter` component is mocked so that we can verify the props it receives from the `App` component.

## Resources

- [Component Unit Testing (and mocking) with react-testing-library](https://www.youtube.com/watch?v=XDkSaCgR8g4)