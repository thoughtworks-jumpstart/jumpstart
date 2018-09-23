# Destructuring

## What is destructuring?

Destructuring is the act of unpacking values from arrays, or properties from objects, into distinct variables.

## Destructuring objects

You can use destructuring to **extract key-values from an object** and store them as a variable using ES6's handy destructuring syntax. Example:

```javascript
const fluffypuppy = {
    name: 'fluffy',
    type: 'puppy',
    age: 5
}

const { name, type } = fluffypuppy   // note: you have to use the key as the variable name. Also note that order doesn't matter. You can also leave out keys that you don't want to destructure (e.g. age, in this example) (Awesome!)
console.log(name) // 'fluffy' 
console.log(type) // 'puppy'

// if you want to destructure and save it to a variable by a different name:
const { name: fluffyPuppyName, type: someRandomType } = fluffypuppy
console.log(fluffyPuppyName) // 'fluffy' 
console.log(someRandomType)  // 'puppy'
```

You can **set default variable values** for keys that may not exist in the object to be destructured

```javascript
const fluffypuppy = {name: 'fluffy', type: 'puppy'}
const {name = '', type: renamedType = '', isCute = true, lovesCats = false } = fluffypuppy

console.log(name)           // 'fluffy'
console.log(renamedType)    // 'puppy'
console.log(type)    // ReferenceError: type is not defined
console.log(isCute)         // true
console.log(lovesCats)      // false
```

Destructuring works for nested-objects as well!

```javascript
const david = { name: "David", address: {country: "Singapore"}};

const {name, address:{country}} = david;
```

You can destructure objects which are passed as arguments to **functions**. Example:

```javascript
// ES6
function myFunc({name, age, gender, jobTitle}) {
  console.log(name, age, gender, jobTitle);
}

myFunc({ name: 'John', age: 25, gender: 'male', jobTitle: 'runner' })

// Compare it with what we used to do in ES5 (much more verbose!!!)
function myFunc(options) {
  options = options === undefined ? {} : options;
  var name = options.name === undefined ? 'John' : options.name;
  var age = options.age === undefined ? 25 : options.age;
  var gender = options.gender === undefined ? 'male' : options.gender;
  var jobTitle = options.jobTitle === undefined ? 'runner' : options.jobTitle;

  console.log(name, age, gender, jobTitle);
}

myFunc({ name: 'John', age: 25, gender: 'male', jobTitle: 'runner' })
```


## Destructuring arrays

Example:

```javascript
const details = ['bob', 35, 'business analyst']
const [name, age, jobTitle] = details
console.log(name)           // 'bob'
console.log(age)            // 35
console.log(jobTitle)       // 'business analyst'
```

Example use case: swapping variable values

```javascript
// let's say you're making a 2-player game and you want to switch turns. you can use array destructuring to do this!!
currentPlayer = 'alice'
nextPlayer    = 'bob'

[currentPlayer, nextPlayer] = [nextPlayer, currentPlayer]
```

You can ignore values that you're not interested in

```javascript
var [a, , z] = [1, 2, 3]
console.log(a); // 1
console.log(z); // 3
```

## Resources

* [MDN docs on destructuring](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)
* [Destructuring function parameters](https://simonsmith.io/destructuring-objects-as-function-parameters-in-es6/)

