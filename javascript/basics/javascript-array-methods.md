# Array methods

A [list of all array methods](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) can be found on MDN

## Array.from\(\)

Creates a shallow copy from an array-like or iterable object.

```javascript
Array.from("foo") // returns ["f", "o", "o"]
```

## Array.isArray\(\)

Determines if the argument passed in is an array. Returns a boolean value.

```javascript
Array.isArray([1, 2, 3]) // returns true
Array.isArray('Is a string an array?') // returns false
```

## Array.prototype.concat\(\)

Merge two or more arrays.

```javascript
const names = ['Alice', 'Bob']
const moreNames = ['Charlie', 'Daphne']
const allNames = names.concat(moreNames)
```

You can also use the spread operator in ES6

```javascript
const names = ['Alice', 'Bob']
const moreNames = ['Charlie', 'Daphne']
const allNames = [...names, ...moreNames] // ['Alice', 'Bob', 'Charlie', 'Daphne']
```

## Array.prototype.splice\(\)

Inserts a new element into a specific place in an array.

```javascript
const months = ['Jan', 'March', 'April']
months.splice(1, 0, 'Feb') // ['Jan', 'Feb', 'March', 'April']
```

Deletes an element in an array.

```javascript
const months = ['Jan', 'Feb', 'March', 'April', 'May']
months.splice(4, 1,) // ['Jan', 'Feb', 'March', 'April']
```

Replaces an element in an array.

```javascript
const months = ['Jan', 'Feb', 'March', 'April', 'June']
months.splice(4, 1, 'May') // ['Jan', 'Feb', 'March', 'April', 'May']
```

