# Spread operators

## spread operator with arrays

The spread operator `...` allows us to spread the contents of any iterable \(e.g. arrays and objects\). It can be conveniently used for joining arrays or inserting elements into arrays

```javascript
// two simple examples
console.log(...[1,2,3])
console.log(...['a', 'b', 'c'])

// spread operators can be used to spread and concatenate arrays
const gentlePets = ['puppy', 'rabbit', 'chicken']
const aggressivePets = ['dragon', 'cobra', 'tiger']

const allPets = [...gentlePets, 'kitten', ...aggressivePets]

for (p of gentlePets) {
    console.log(p)
}
```

Here are [more examples](https://davidwalsh.name/spread-operator) of using spread operator.

## spread operator with objects

You can also use spread operator on objects. In the example below, the spread operator is used to get all the fields of one object, before they are merged into a new object.

```javascript

const defaultConfiguration = {
  displayTab: true,
  displayMenu: true,
  displaySideBar: true
}

const myEditorConfiguration = {
  ...defaultConfiguration,
  displaySideBar: false
}

console.log(myEditorConfiguration);

```

## Resources:

* [MDN Docs on Spread](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)

