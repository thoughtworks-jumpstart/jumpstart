# reduce

## `.reduce()`

`.reduce()` takes in a callback function that can take in 3 positional parameters: `accumulator`, `element`, `index`

Syntax:

```javascript
const result = someArray.reduce(function(accumulator, element[, index, array]) {

}, accumulatorInitialValue)
```

[Check out the docs.](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce)

**Example**: Reducing numbers

```javascript
[1, 2, 3, 4, 5].reduce(function(accumulator, element, index) {
    console.log(accumulator, element, index);
    return accumulator + element;
});

// prints:
// 0 1 0
// 1 2 1
// 3 3 2
// 6 4 3
// 10 5 4
// returns 15

[1, 2, 3, 4, 5].reduce(function(accumulator, element, index) {
    console.log(accumulator, element, index);
    return accumulator + element;
}, 10); // note that we can specify a different initialValue. if not supplied, this defaults to 0

// prints:
// 10 1 0
// 11 2 1
// 13 3 2
// 16 4 3
// 20 5 4
// returns 25
```

**Example**: Reducing strings

Not only can you accumulate numbers, you can also accumulate strings!

```javascript
const epic = ['a', 'long', 'time', 'ago', 'in a', 'galaxy', 'far far', 'away'];
const result = epic.reduce(function (accumulator, element) {
  return accumulator + ' ' + element;
}); // returns 'a long time ago in a galaxy far far away'
```

It may take a minute to get your mind wrapped around what's happening. However, by simply logging the values it \(hopefully!\) becomes much more clear what's going on.

```javascript
const result = epic.reduce(function (accumulator, element) {
  console.log('logging -- element: "' + element + '", ' + 'accumulator: "' + accumulator + '"');
  return accumulator + ' ' + element;
});

// logging -- element: "long",    accumulator: "a"
// logging -- element: "time",    accumulator: "a long"
// logging -- element: "ago",     accumulator: "a long time"
// logging -- element: "in a",    accumulator: "a long time ago"
// logging -- element: "galaxy",  accumulator: "a long time ago in a"
// logging -- element: "far far", accumulator: "a long time ago in a galaxy"
// logging -- element: "away",    accumulator: "a long time ago in a galaxy far far"
// >> 'a long time ago in a galaxy far far away'
```

**Example**: Reducing objects

You can also reduce objects!

Example: We want to change up the structure of our users so that we can use the users' full name as the key and have their email as the value. Normally, this would take a lot of looping and initializing some variables. However, with reduce we can set an empty object as our starting point \(i.e. previous\) and do it all in a single go!

```javascript
const users = [{ fullName: 'George Washington', email: 'george@us.gov' },
             { fullName: 'John Adams', email: 'john@us.gov' },
             { fullName: 'Thomas Jefferson', email: 'thomas@us.gov' },
             { fullName: 'James Madison', email: 'james@us.gov' }];

const result = users.reduce(function (usersObj, user) {
  usersObj[user.fullName] = user.email;
  return usersObj;
}, {});

// { 'George Washington': 'george@us.gov',
//   'John Adams': 'john@us.gov',
//   'Thomas Jefferson': 'thomas@us.gov',
//   'James Madison': 'james@us.gov' }
```

## Resources

* [More about reduce](http://adripofjavascript.com/blog/drips/boiling-down-arrays-with-array-reduce.html)

