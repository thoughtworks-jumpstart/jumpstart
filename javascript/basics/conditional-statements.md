# Conditional statements

## `if` conditional statements

```javascript
if (someCondition === "a") {
  // code to run if someCondition === "a"
} else if (someCondition === "b")  {
    // code to run if someCondition === "b"
} else {
  // otherwise, run some other code instead
}
```

Another example:

```javascript
var food = "pizza" // change this value and see the different log messages

if (food === "pizza") {
  console.log("yummy!");
} else if (food === "fried chicken") {
  console.log("even yummier!");
} else if (food === "broccoli") {
  console.log("ewww!");
} else {
  console.log("I don't know what to feel about this");
}
```

## Switch case statements

```js
switch (fruit.toLowerCase()) {
  case 'oranges':
    console.log('Oranges are $0.59 a kilo.');
    break;
  case 'mangoes':
  case 'papayas':
    console.log('Mangoes and papayas are $2.79 a kilo.');
    break;
  default:
    console.log('Sorry, we do not sell ' + fruit.toLowerCase() + '.');
}
```

## Comparison operators

* `===` and `!==` \(vs. `==` and `=`\)
* `<` and `>`
* `<=` and `>=`

## Logical operators and combining conditions

* And: `&&`
* Or: `||`
* Not: `!`
  * `!true`     // returns false
  * `!false`    // returns true
  * `!(1===1)`  // returns false

You can also use `!!` to convert a variable into a boolean type. For example, `!!'foo'` will return `true`.

Let's look at an example:

```js
const names = ['Alice', 'Bob']
const isFound = names.find(name => name === 'Charlie')
console.log(isFound) // returns undefined
```

In the code above, if a name is found then `isFound` will contain the name, otherwise it will be `undefined`.

```js
const names = ['Alice', 'Bob']
const isFound = !!names.find(name => name === 'Charlie')
console.log(isFound) // returns false
```

A better way is to use type coercion to return a boolean value like in the code above.

## Ternary conditional statements

The dictionary definition of tern is a "set of three". A ternary condition follows the following syntax `condition ? doSomethingIfTrue() : doSomethingIfFalse()`

```js
skyColor === "grey" ? bringRaincoat() : bringPicnicMat();
```
