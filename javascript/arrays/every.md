# every

`.every()` works by taking a function that returns true or false. If all of the elements in the array return true, _only then_ will the entire statement return true.

Syntax:

```javascript
someArray.every(function(element[, index, array]) {

})
```

[Check out the docs.](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every)

**Example**

Consider the same example above, but instead of checking if any of the values are less than 21, we want to check that all of the values are equal to or greater than 21. A simple function to return if a single age is 21 or older would look like:

```javascript
var twentyOneOrAbove = function (age) {
  return age >= 21;
};

// twentyOneOrAbove(20) >> false
// twentyOneOrAbove(30) >> true
```

We can use `every` to check for all the values in the array.

```javascript
var twentyOneOrAbove = function (ages) {
  return ages.every(function (age) {
    return age >= 21;
  });
};

// twentyOneOrAbove(ages) >> false
```

Again, we can alternatively use the named function with `.every()`.

```javascript
ages.every(twentyOneOrAbove) // false
```

