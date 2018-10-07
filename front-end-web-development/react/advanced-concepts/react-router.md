# React Router

React Router is the standard routing library for React. From the docs:

> “React Router keeps your UI in sync with the URL. It has a simple API with powerful features like lazy code loading, dynamic route matching, and location transition handling built right in. Make the URL your first thought, not an after-thought.”

## Learning checklist

* how to install: `npm install react-router-dom`
* concept of [client-side routing](https://medium.com/@wilbo/server-side-vs-client-side-routing-71d710e9227f)
* concept of [Master-Detail views](https://en.wikipedia.org/wiki/Master%E2%80%93detail_interface)
* concept `<BrowserRouter></BrowserRouter>` and `<Router></Router>` in general
* how to use router components provided by `react-router-dom`
  * `BrowserRouter`
  * `Link`
  * `Route`
  * `Redirect`
* `props.match` object
  * `props.match.params` - an object containing all params
  * `props.match.url`
  * `props.match.path`
* `props.location` object
* Query string
* Deployment configuration

### Important note before we start

The following chapter shows you how to get started with `react-router-dom`, and the usage is intentionally kept simple because we're learning something new. For each component that we cover below, **look at the corresponding** [**API docs**](https://reacttraining.com/react-router/web/api/) **to understand the call signature, props, options and usages.**

### Installing react-router-dom

Navigate into your project directory and run `npm install react-router-dom`

### `react-router-dom` components

`react-router-dom` gives us 4 components which we can use to write logic to map URL paths =&gt; component to render

* `BrowserRouter`
* `Link`
* `Route`
* `Redirect`

#### `<BrowserRouter />`

If you have a component which either \(i\) directly uses any component from `react-router-dom`, or \(ii\) has children/grandchildren that use any component from `react-router-dom`, you must have a `BrowserRouter` wrapped around it. A `<BrowserRouter>` is the component that keeps your UI in sync with the URL. See example:

```jsx
// MyRouter.js
import React from 'react';

const MyRouter = () => (
  <BrowserRouter>
    <MyApp />  {/* MyApp uses react-router-dom components such as <Route />, <Link /> etc. */}
  </BrowserRouter>
);

export default MyRouter;
```

**Note**: `BrowserRouter` only can have 1 child, so you need to nest everything that you're going to nested inside `BrowserRouter` in a single `div`

#### `<Link />`

`<Link>` is simply a component that will render as an `<a href/>` tag on your UI, except that it doesn't refresh the page.

```jsx
<Link to="/tacos">show me tacos!</Link>
<Link to="/nachos">show me nachos!</Link>
<Link to="/pizzas">show me pizzas!</Link>
```

#### `<Route />`

`<Route>` is the component that maps URL paths to components

```jsx
<Route path="/tacos" component={TacosComponent} />
<Route path="/nachos" component={NachosComponent} />
<Route path="/pizzas" component={PizzasComponent} />
<Route path="/tacos/:id" component={TacoDetailPage} />

<Route path="/" exact component={HomeComponent} /> 
// exact is a prop. it says direct user to HomeComponent 
// only if the URL path matches "/" exactly
```

#### Passing props to `<Route />`

Let's say you want to pass props to TacosComponent. `react-router-dom` suggests that you do it this way.

```jsx
// do this:
<Route path="/tacos" render={() => <TacosComponent someProp="..." someOtherProps="..." />} />

// instead of this:
<Route path="/tacos" component={TacosComponent} />
```

Later on in this chapter, you will learn about `props.match`. In order to access `props.match` in `TacosComponent`, we have to pass props explicitly like so:

```jsx
<Route path="/tacos" render={(props) => <TacosComponent someProp="..." ...props />} />
// Note: ...props is the ES6 spread syntax
// we're destructuring the props object into its key-value pairs.

// assuming props has 3 key-value pairs: props.match, props.location and props.history,
// the above syntax is doing the same as this:
<Route path="/tacos" render={(props) => <TacosComponent someProp="..." 
                                            match={props.match} 
                                            location={props.location}
                                            history={props.history}
                                            />} />
```

#### `Redirect`

Rendering a `<Redirect>` will navigate to a new location in the browser URL. \(Note that you need to define a `<Route>` to map this url \(e.g. '/unauthorized'\) to a specific component to render\)

```jsx
if (userIsLoggedIn) {
  return <SomethingOnlyLoggedInUsersCanSee />
} else {
  return <Redirect to="/unauthorized">
}
```

### `props` object

All components that are rendered by `<Route>` will be passed three route props:

* `match`
* `location`
* `history`

#### A closer look at the `props.match` object

A match object contains information about how a `<Route path>` matched the URL. `match` objects contain the following properties:

* params - \(object\) Key/value pairs parsed from the URL corresponding to the dynamic segments of the path
* isExact - \(boolean\) true if the entire URL was matched \(no trailing characters\)
* path - \(string\) The path pattern used to match. Useful for building nested s
* url - \(string\) The matched portion of the URL. Useful for building nested s

These each have their own use-cases. One such use-case for `props.match.params` is:

```jsx
// URL: https://localhost:3000/tacos/42
// Route: <Route path="/tacos/:tacoId" component={TacoDetailPage} />

// in TacoDetailPage.js
const TacoDetailPage = (props) => {
  if (props.match.param.tacoId === "42") { // note params.tacoId will always be a string
    return <Redirect to="/specialTacoPage" />
  } else {
    return <NormalTaco />
  }
}
```

### Query string

The creators of `react-router-dom` made a conscious decision not to support query string in the library because there have been requests over the years to support different implementation. With that, the team decided it would be best for users to decide what that implementation looks like.

You can use the `query-string` npm package for parsing query strings. In the example below, I will parse the following URL: `https://localhost:3000?searchTerm=obama&year=2016&topic=anything`

```jsx
import queryString from 'query-string';

console.log(props.location.search) // ?searchTerm=obama&year=2016&topic=anything

const parsed = queryString.parse(props.location.search);
console.log(parsed) // returns an object { searchTerm: "obama", year: "2016", topic: "anything" }
```

### Nested Routes

You can also nest routes \(i.e. use `<Route>`s inside of another `<Route>`\). It sounds complicated but it's not! In `react-router-dom`, all components are Just Components™ which are rendered on the screen. So nesting routes is no different from nesting `div`s or any other components.

Check out this tutorial to see how you can nested routes: [https://www.youtube.com/watch?v=sfvrjwVihFY](https://www.youtube.com/watch?v=sfvrjwVihFY)

### Deployment configuration

If you use routers that use the HTML5 pushState history API under the hood \(for example, React Router with browserHistory\), many static file servers \(e.g. heroku\) will fail. This is because when there is a fresh page load for a route \(e.g /todos/42\), the server looks for the file build/todos/42 and does not find it. The server needs to be configured to respond to a request to /todos/42 by serving index.html.

Doing this in conjunction with the `create-react-app` buildpack is easy. In the root of your react project, create a `static.json` file with the following contents:

```javascript
{
  "root": "build/",
  "routes": {
    "/**": "index.html"
  }
}
```

### Resources

#### Recommended reading

* [getting started with `react-router` \(video\)](https://reacttraining.com/react-router/)
* [`react-router` docs](https://reacttraining.com/react-router/core/guides/philosophy/dynamic-routing)
* [All About React Router 4](https://css-tricks.com/react-router-4/)
* [How to get and parse query string in an URL](https://stackoverflow.com/questions/43216569/how-to-get-query-parameters-in-react-router-v4)
* [React Router 4: A Practical Introduction](https://auth0.com/blog/react-router-4-practical-tutorial/)

#### References

* [`react-router` library](https://github.com/ReactTraining/react-router)
* [Testing components containing `react-router` components](https://reacttraining.com/react-router/core/guides/testing)

### Lab

* [https://github.com/thoughtworks-jumpstart/react-router-lab](https://github.com/thoughtworks-jumpstart/react-router-lab)
* [https://github.com/thoughtworks-jumpstart/react-news-headlines-reader](https://github.com/thoughtworks-jumpstart/react-news-headlines-reader) \(part 2\)

