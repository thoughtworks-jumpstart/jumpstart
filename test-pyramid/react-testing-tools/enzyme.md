# Enzyme

Enzyme is a JavaScript Testing utility for React that makes it easier to assert, manipulate, and traverse your React Components' output.

## Learning checklist

* What is a enzyme wrapper and why it's useful for testing
* The difference between `shallow` and `mount`, and when to use each
* How to find a component using `.find` method?
* What are the 5 selectors you can use with `.find`?
* How to get the instance of a component using `.instance` method?
* How to simulate an event using `.simulate` method?
* How to check the state of a component using `.state` method?
* Enzyme testing principles:
  * Test the component's structure
  * Test any functions/callbacks/handlers

## Including enzyme in a project

Steps

* `yarn add enzyme enzyme-adapter-react-16 --dev`
* define a file called `setupTests.js` in `src/` and paste the following:

```javascript
import { configure } from "enzyme";
import Adapter from "enzyme-adapter-react-16";
configure({ adapter: new Adapter() });
```

## Enzyme recipes

* Testing basic component rendering

  ```text
  test('render a label', () => {
    const wrapper = shallow(<MyComponent />);
    expect(wrapper.exists()).toEqual(true);
  });

  test('MyComponent should render three <Foo /> components', () => {
    const wrapper = shallow(<MyComponent />);
    expect(wrapper.find(Foo)).toHaveLength(3);
  });
  ```

* Inspect the component inside `wrapper` with `wrapper.debug()`

```text
const wrapper = shallow(<MyComponent />);
console.log(wrapper.debug());
console.log(wrapper);
```

* Find a specific component with `.find()` and selectors

There is a `.find()` method you can call on the `wrapper` object which helps you to find a specific component.

The method takes in an `selector` argument for you to specify search criteria.

Currently, enzyme supports 5 types of selectors. For the details, check [the documentation](https://github.com/airbnb/enzyme/blob/master/docs/api/selector.md)

* Testing props

```text
  test('render a document title', () => {
    const wrapper = shallow(<MyComponent someRandomProp='hello' />);
    expect(wrapper.prop('someRandomProp')).toEqual('hello');
  });
```

* Testing events
  * Enzyme allows you to simulate events \(e.g. click\)

```text
  test('render Markdown in preview mode', () => {
    const wrapper = shallow(<MyComponent />);

    wrapper.find('button.blue').simulate('click');

    // assuming our component has a button with className 'blue', which turns the component blue by adding a '.blue' css class
    expect(wrapper.find(.blue)).toHaveLength(1);
  });
```

* Testing event handlers

```text
  test('pass a selected value to the onChange handler', () => {
    const handleClick = jest.fn();    // our mock function
    const wrapper = shallow(<MyComponent onClick={handleClick} />);

    wrapper.find('select').simulate('click')

    expect(handleClick).toBeCalled();
  });
```

* Testing with the component instance 

There is a `.instance` method which allows you to get the component instance within the wrapper. How is that useful? When should you use it?

Check out [this article](https://bambielli.com/til/2018-03-04-directly-test-react-component-methods/) to see some good example.

The article also shows how to get the state of a component using the `.state` method from the wrapper.

## The difference between `shallow()`, `mount()` and `render()`

While `shallow()` only renders the component without children, `mount()` renders all child components as well. The first is used for component tests in isolation \(unit tests\) and the latter is used for integration tests. Integration tests are more likely to break, because they include a bigger set of your component tree. The maintenance costs are higher for integration tests. You should have a lot of small maintainable unit tests, but a few vital integration tests.

The third option in enzyme is `render()`. Render similar to `mount()` renders all child components. But with `mount()` you have access to components lifecycle methods like componentDidUpdate.

* `shallow()`

  * `shallow()` is used for shallow component rendering
  * Shallow rendering is useful to constrain yourself to testing a component as a unit, and to ensure that your tests aren't indirectly asserting on behavior of child components.
  * returns a `ShallowWrapper` object
  * the returned wrapper object looks like this:

  ```text
  const shallowComponent = shallow(<App />);
  console.log(shallowComponent.debug());

  // prints this:
  <div>
    Todo List
    <AddTodo submitTodo={[Function: submitTodo]} />
  </div>
  ```

* `mount()`

  * `mount()` is used for full DOM rendering
  * Full DOM rendering is ideal for use cases where you have components that may interact with DOM APIs, or may require the full lifecycle in order to fully test the component \(i.e., componentDidMount etc.\)
  * returns a `ReactWrapper` object
  * the returned wrapper object looks like this \(note how the AddTodo component is fully rendered\):

  ```text
  const mountedComponent = mount(<App />);
  console.log(mountedComponent.debug());

  // prints this:
  <App>
    <div>
      Todo List
      <AddTodo submitTodo={[Function: submitTodo]}>
        <div>
          <form onSubmit={[Function: onSubmit]}>
            <input className="todo-input" />
            <button type="submit" className="submit">
              Add Todo
            </button>
          </form>
        </div>
      </AddTodo>
    </div>
  </App>
  ```

Note on `mount()`: Full DOM rendering requires that a full DOM API be available at the global scope. This means that it must be run in an environment that at least “looks like” a browser environment. If you do not want to run your tests inside of a browser, the recommended approach to using mount is to depend on a library called jsdom which is essentially a headless browser implemented completely in JS.

* `render()`

  * `render()` is used to render react components to static HTML and analyze the resulting HTML structure.
  * `render()` returns a wrapper very similar to the other renderers in enzyme, `mount` and `shallow`; however, render uses a third party HTML parsing and traversal library Cheerio.
  * You can read more about it here: [http://airbnb.io/enzyme/docs/api/render.html](http://airbnb.io/enzyme/docs/api/render.html)

  ```text

  ```

## When to use which?

Rules of thumb by [Geoffroy Warin](https://github.com/airbnb/enzyme/issues/465):

* Always begin with shallow
* If componentDidMount or componentDidUpdate should be tested, use mount
* If you want to test component lifecycle and children behavior, use mount
* If you want to test children rendering with less overhead than mount and you are not interested in lifecycle methods, use render

## Resources

### Recommended reading

* [Enzyme docs: Getting started](http://airbnb.io/enzyme/)
* [Enzyme docs: API](http://airbnb.io/enzyme/docs/api/index.html) \(Enzyme's docs are really great. Be sure to bookmark this page!\)
* [Enzyme: Javascript Testing Utilities for React](https://medium.com/airbnb-engineering/enzyme-javascript-testing-utilities-for-react-a417e5e5090f)
* [Testing React Component with Jest and Enzyme](https://hackernoon.com/testing-react-components-with-jest-and-enzyme-41d592c174f)

## Assignment

