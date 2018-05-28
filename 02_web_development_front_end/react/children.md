### Children

**What is children?**

When a React component has some HTML/React elements nested within itself (for example, see `<ComponentTwo/>` below), these element(s) are immediately available as `props.children`. You can access them via `props.children` in a functional component (and `this.props.children` in a class component)

```javascript
const ComponentOne = (props) => {
  console.log(props.children); // (3) [{li}, {li}, {li}]
  return props.children
}

const ComponentTwo = () => {
  return (
    <ComponentOne>
      <li>1</li>
      <li>2</li>
      <li>3</li>
    </ComponentOne>
  )
}
```

##### Resources:

- https://reactjs.org/docs/react-api.html#reactchildren
- https://mxstbr.blog/2017/02/react-children-deepdive/
