Functions allow us to keep our code DRY (Don't Repeat Yourself) by allowing us
to group repeated logic into reusable and readable pieces of code.

Without functions:

```html
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

```html
<button onclick="alertName();">Submit</button>
```

### Syntax

#### Simple declaration

```javascript
function myAwesomeFunction() {
	console.log('I am an awesome function!');
}

```
#### Invocation

```javascript
myAwesomeFunction();
```

**Declare** once, **invoke** many times!

#### Functions are values too

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

#### Functions can have parameters (arguments)

```javascript
function sayHello(firstName, lastName) {
	alert('Hello, ' + firstName + ' ' + lastName + '!');
}

// using arrow functions + template strings
const sayHi = (firstName, lastName) => {
	alert(`Hi, ${firstName} ${lastName}! Nice to see you here!`);
}
```

#### Functions can return values

e.g. `Math.max(5, 10)` returns the larger number, which can be stored in
another variable:

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
