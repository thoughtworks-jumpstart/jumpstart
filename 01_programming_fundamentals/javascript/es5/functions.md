#### Functions

Functions allow us to keep our code DRY (Don't Repeat Yourself) by allowing us to group repeated logic into reusable and readable pieces of code.

```javascript
// bad. making a sandwich without functions
var sandwich = ''
sandwich += 'ham'
sandwich += ' & '
sandwich += 'cheese'
sandwich += ' & '
sandwich += 'ranch dressing'
sandwich += ' '
sandwich += 'sandwich'
console.log(sandwich)

var sandwich = ''
sandwich += 'vege'
sandwich += ' & '
sandwich += 'tofu'
sandwich += ' & '
sandwich += 'soy sauce'
sandwich += ' '
sandwich += 'sandwich'
console.log(sandwich)

// good. making a sandwich using functions
function makeSandwich(topping1, topping2, dressing) {
	return topping1 + ' & ' + topping2 + ' & ' + dressing + ' sandwich'
}

makeSandwich('ham', 'cheese', 'ranch')
makeSandwich('vege', 'tofu', 'soy sauce')
```

- declaration

```javascript
function myAwesomeFunction() {
	// do something awesome
};

var myAwesomeFunction = function() {
	// do something awesome
};

function anotherAwesomeFunction(someArgument, someOtherArgument) {
	// do something awesome with parameters (someArgument and someOtherArgument)
};
```
- invocation

```javascript
myAwesomeFunction();

anotherAwesomeFunction('hello', 42);
```
- `return` statement in functions
- the difference between `return` and `console.log()`