#### Printing output
```javascript
console.log("hello world");
console.log(42);
```

#### Variables 
- a variable contains a value, (e.g. "hello" or 42).

```javascript
var x = "hello world";
var y = 1;
var myName = "barack obama";
```
- You use variables to store, retrieve, and manipulate values that appear in your code. 
- Try to give your variables meaningful names to make it easy for other people to understand what your code does.
- Variables are declared using the `var` keyword.
- Variables are case-sensitive
- Variable name rules:
	- The variable name must not be a reserved keyword (e.g. `var`, `for`, `if`, `while`). See full list of reserved keywords [here](https://mathiasbynens.be/notes/reserved-keywords#ecmascript-5).
	- Variable names cannot start with numbers
	- Generally speaking, use only alphabets
- convention: camelCase

#### Comments and multi-line comments
- single line: `//`
- multiline:   `/* ... */`
- editor shortcut: `⌘` + `/`

#### Primitives
- numbers
	- math operators: `+`, `-`, `/`, `*`, `**`, `%`
	- `Math` methods (e.g. `Math.pow(2,2)`)
	- increment/decrement operators (`++` and `--`)
	- operators with assignment: `+=`, `-=`, `/=`, `*=`
- strings
	- single and double quotes
	- string properties (e.g. `"some string".length`)
	- string methods (e.g. `"some string".toLowerCase()`,  `"some string".toUpperCase()`)
	- and much more (see [MDN docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/prototype))!
- booleans
	- `===` (vs. `==` and `=`)
	- `!` - the "not" operator (invert boolean values). Examples:
		- `!==`
		- `! true` 	// returns false
		- `! false`	// returns true
		- `! 1===1`	// returns false
	- `<` and `>`
	- `<=` and `>=`
- arrays (more on this later)
- objects (more on this later)


#### Semicolons
- They are optional!
- Semicolons are inferred, but only before a }, at the end of a line, or at the end of a program.
- Never omit a semicolon before a statement beginning with `(`, `[`, `+`, `-`, or `/`.
- As a convention in our class, we will use the 'prettier' style guide, which includes semi-colons by default
