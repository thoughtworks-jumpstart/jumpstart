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

## Comparison operators

- `===` and `!==` (vs. `==` and `=`)
- `<` and `>`
- `<=` and `>=`

## Logical operators and combining conditions

- And: `&&`
- Or: `||`
- Not: `!`
	- `!==`
	- `! true` 	// returns false
	- `! false`	// returns true
	- `! 1===1`	// returns false


## ternary conditional statements

Dictionary definition of tern: "a set of three"

```javascript
// Syntax:

condition ? functionToExecuteIfConditionIsTrue() : functionToExecuteIfConditionIsFalse();

// Example:
skyColor === "grey" ? bringRaincoat() : bringPicnicMat();
```
