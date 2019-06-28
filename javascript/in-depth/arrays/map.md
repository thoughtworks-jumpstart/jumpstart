# map

`.map()` works by returning a new array after a function has been applied to every single element in the array. Often map is used to cut down on data in deeply nested objects.

Syntax:

```javascript
const newArray = someArray.map(function(element[, index, array]) {

})
```

[Check out the docs.](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)

**Example**

```javascript
const numbers = [1,2,3]

function multiplyBy2 (number) {
  return number * 2;
}

const doubledNumbers = numbers.map(multiplyBy2);

console.log(doubledNumbers)
// [2, 4, 6]
```

**Note**

* `.map()` is syntactically similar to `.forEach()`. The key difference is the `map` returns an array, but `forEach` doesn't
* Like `.forEach()`, `map` takes in a callback function that can receive 3 positional parameters: `element`, `index`, `container`. 

```javascript
const numbers = [1, 2, 3, 4, 5]

const numberMultipliedByItsPositionalIndex = numbers.map(function(element, index) { 
  return element * index
})
console.log(numberMultipliedByItsPositionalIndex)
// [ 0, 2, 6, 12, 20 ]
```

