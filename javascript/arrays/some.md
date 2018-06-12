# some

`.some()` works by taking a callback function that returns true or false. If any of the elements in the array return true, then the entire statement returns true. Another way to think of `some` is that it checks that _any_ value passes the conditional provided by the function.

Syntax:

```javascript
someArray.some(function(element[, index, array]) {

})
```

[Check out the docs.](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some)

**Example**

Imagine we have a group of users that are the following age who have all signed up for some sort of tour through our application.

```javascript
var ages = [ 23, 32, 17, 19, 34 ]
```

We want to show an ad that displays delicious beer but don't want to do so if any of the group members are under 21. A function that just tests whether or not a value is less than 21 might look like this:

```javascript
var lessThan21 = function (age) {
  return (age < 21)
};

// lessThan21(20) >> true
// lessThan21(30) >> false
```

We can use `some` to check if any of the values are less than 21 in just one go:

```javascript
var anyLessThan21 = function (ages) {
  return ages.some(function (age) {
    return age < 21;
  });
};

// anyLessThan21(ages) >> true
```

Alternatively, you could simply use the named function with `.some()`.

```javascript
ages.some(lessThan21) // true
```

If the function returns `true`, we will _not_ show the ad.

