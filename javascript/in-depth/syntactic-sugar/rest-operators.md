# Rest operators

Rest syntax looks exactly like **Spread** syntax, but is used for **destructuring arrays and objects**. In a way, rest syntax is the opposite of spread syntax: spread **'expands'** an array into its elements, while rest **'collects'** multiple elements and **'condenses'** them into a single element \(i.e. an array\)

It has 3 main use cases:

1\) In **functions**. As a parameter in a function definition. It allows you to capture the **rest** of the arguments passed in to a function call \(e.g. 'bob', 'tom', 'tim'\) as a single variable \(e.g. `names`\)

```javascript
function greetPeople(greeting, ...names) {
  // names is an array that we can iterate over
  names.forEach(function(name) {
      console.log(`${greeting} ${name}!`)
  })
}

greetPeople('Howdy', 'bob', 'tom', 'tim')
```

2\) In **arrays**. The rest operator can be used when destructuring arrays.

```javascript
const sortedScores = [100, 99, 95, 80, 70, 55]
const [firstScore, secondScore, ...remainingScores] = sortedScores
console.log(remainingScores) // prints [95, 80, 70, 55]
```

3\) In **objects**. The rest operator can be used when destructuring objects

```javascript
const {a, b, ...rest} = {a: 10, b: 20, c: 30, d: 40}
console.log(a); // 10 
console.log(b); // 20 
console.log(rest); // { c: 30, d: 40 }
```

Note: the `...rest` operator must be used as the last variable. A SyntaxError will be thrown if there is a trailing comma after a rest element

Example:

```javascript
[a, ...b, c] = [1,2,3,4,5]

// throws SyntaxError: Rest element must be last element
```

## Resources:

* [MDN Docs on Rest](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters)

