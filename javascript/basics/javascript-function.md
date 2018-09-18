# Javascript Functions

Functions allow us to keep our code DRY \(Don't Repeat Yourself\) by allowing us to group repeated logic into reusable and readable pieces of code.

Without functions:

```markup
<button onclick="const firstName = document.querySelector('#first-name').value; const lastName = document.querySelector('#last-name').value; alert(firstName + lastName);">Submit</button>
```

With functions:

`script.js`:

```javascript
function alertName() {
    const firstName = document.querySelector('#first-name').value;
    const lastName = document.querySelector('#last-name').value;

    alert(firstName + lastName);
}
```

`index.html`:

```markup
<button onclick="alertName();">Submit</button>
```

## Syntax

### Simple declaration

```javascript
function myAwesomeFunction() {
    console.log('I am an awesome function!');
}
```

### Invocation

```javascript
myAwesomeFunction();
```

**Declare** once, **invoke** many times!

### Functions are values too

```javascript
// Declare
const anotherAwesomeFunction = function () {
    console.log('I am another awesome function!');
};

// Invoke
anotherAwesomeFunction();
```

Arrow syntax:

```javascript
// Declare
const awesomeArrowFunction = () => {
    console.log('I am an awesome arrow function!');
};

// Invoke
awesomeArrowFunction();
```

Instead of `const`, you can also use `let` or `var`.

### Functions can have parameters \(arguments\)

```javascript
function sayHello(firstName, lastName) {
    alert('Hello, ' + firstName + ' ' + lastName + '!');
}

// using arrow functions + template strings
const sayHi = (firstName, lastName) => {
    alert(`Hi, ${firstName} ${lastName}! Nice to see you here!`);
}
```

### Functions can return values

e.g. `Math.max(5, 10)` returns the larger number, which can be stored in another variable:

```javascript
const smallerValue = Math.min(20, 30);
console.log(smallerValue);
```

Syntax:

```javascript
// Declare
function square(number) {
    return number * number;
}

// Invoke
alert(square(20));
console.log(square(15));
document.querySelector('#result').innerHMTL = square(4);

// Arrow syntax
const areaOfRectangle = (width, height) => {
    return width * height;
}

// Short arrow syntax
const areaOfCircle = lengthOfSide => lengthOfSide * lengthOfSide;
```

### Functions can be used just like any other variable

They can be elements of an array:

```javascript
const things = [1, 'hello', true, function (a, b) { return a + b} ];

// things[3] is a function and can be invoked like this:
things[3](5, 6);

// i.e. get the fourth element of the array, invoke it (since it is a function)
// with two arguments: 5 and 6
```

They can be passed as arguments to another function:

```javascript
const logger = (f) => {
    console.log('f is', f);
}

const sum = (a, b) => a + b;

// note that we're passing the "sum" function to logger, not invoking it
// (notice the lack of parentheses after the name 'sum')
logger(sum); // outputs the body of the 'sum' function to the console
```

## Lab

[https://github.com/thoughtworks-jumpstart/js-basics-1](https://github.com/thoughtworks-jumpstart/js-basics-1)
