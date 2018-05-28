### HTTP Requests in React

#### How can I make an AJAX call?
You can use any AJAX library you like with React. Some popular ones are `Axios`, jQuery AJAX, and the browser built-in `window.fetch`.

#### Where in the component lifecycle should I make an AJAX call?
You should populate data with AJAX calls in the `componentDidMount` lifecycle method. This is so you can use `setState` to update your component when the data is retrieved.

Example:
```javascript
/*  assume fetch("https://api.example.com/items") returns the following:
{
  items: [
    { id: 1, name: 'Apples', price: '$2' },
    { id: 2, name: 'Peaches', price: '$5' }
  ] 
}
*/
class MyComponent extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      error: null,
      isLoaded: false,
      items: []
    };
  }

  componentDidMount() {
    fetch("https://api.example.com/items")
      .then(res => res.json())
      .then(
        (result) => {
          this.setState({
            isLoaded: true,
            items: result.items
          });
        },
        // Note: it's important to handle errors here
        // instead of a catch() block so that we don't swallow
        // exceptions from actual bugs in components.
        (error) => {
          this.setState({
            isLoaded: true,
            error
          });
        }
      )
  }

  render() {
    const { error, isLoaded, items } = this.state;
    if (error) {
      return <div>Error: {error.message}</div>;
    } else if (!isLoaded) {
      return <div>Loading...</div>;
    } else {
      return (
        <ul>
          {items.map(item => (
            <li key={item.name}>
              {item.name} {item.price}
            </li>
          ))}
        </ul>
      );
    }
  }
}
```

#### Different components can fetch from different HTTP endpoints

Thanks to the separation of concerns using components, different components can obtain their respective state via separate HTTP requests. For instance, the main component can get details about a product, and another component can get a list of production recommendations from another (perhaps machine-learning power) HTTP endpoint

![fetch components](../../../images/react_fetch_components.jpg)

#### Resources
- https://reactjs.org/docs/faq-ajax.html