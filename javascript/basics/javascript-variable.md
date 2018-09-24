# Values and variables

## Types of Values

* Numbers
  * `1`
  * `0.23847`
  * `-10.4`
* Strings
  * `'hi!'`
  * `"this is another string"`
  * \`this is a special string called a "template string". It can span

    across multiple lines\`
* Booleans
  * `true`
  * `false`
* Others
  * `null`
  * `undefined`

## Giving names to values

* Three types of declarations:
  * `const` e.g. `const name = 'Jack'`
  * `let` e.g. `let age = 45`
  * `var` e.g. `var isSaturday = false`
* A variable \(or constant\) contains a value, \(e.g. "hello" or 42\).
* You use variables to store, retrieve, and manipulate values that appear in your code. 
* Variables can refer to other variables

  ```javascript
  const a = 1;
  const b = a; // b is also 1

  const x = 15;
  const y = x + 20; // y is ???
  ```

### Naming rules and conventions

* Try to give your variables meaningful names to make it easy for other people

  to understand what your code does.

* Names are case-sensitive
* Names cannot start with numbers
* Generally speaking, use only alphabets
* The name must not be a reserved keyword \(e.g. `var`, `for`, `if`, `while`\).

  See full list of reserved keywords [here](https://mathiasbynens.be/notes/reserved-keywords#ecmascript-5).

* Use `camelCase` for names instead of `snake_case` or `kebab-case`

## Primitive Types and Objects 

In JavaScript, there are 6 types of [primitive types](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#Primitive_values):

* Boolean
* null
* undefined
* String
* Number
* Symbol (this is introduced in ES6)

Using values of primitive types, you can construct **Objects**.

## Printing output

```javascript
console.log('hello world');
console.log(42);
```

## Working with numbers

* Arithmetic operators: `+`, `-`, `/`, `*`, `**`, `%`
* `Math` methods \(e.g. `Math.pow(2,2)`\)
* Increment/decrement operators \(`++` and `--`\)
* Operators with assignment: `+=`, `-=`, `/=`, `*=`

## Working with strings

* single and double quotes
* template strings
* string properties \(e.g. `"some string".length`\)
* string methods \(e.g. `"some string".toLowerCase()`,  `"some string".toUpperCase()`\)
* and much more \(see [MDN docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/prototype)\)!

## Comments

* Single line: `// this will not be executed`
* Multiline:

  ```javascript
  /* this is a comment
  that spans across multiple lines */
  ```

* Shortcut: `⌘/` \(Mac\) or `Ctrl + /` \(Windows\)

## Semicolons?

* They are optional!
* Semicolons are inferred, but only before a `}`, at the end of a line, or at the

  end of a program.

* Never omit a semicolon before a statement beginning with `(`, `[`, `+`, `-`, or `/`.
* As a convention in our class, we will use the 'prettier' style guide, which

  includes semi-colons by default

## Lab

If you are totally new to JavaScript, you can try the following simple library (just the first exercise):

[https://github.com/thoughtworks-jumpstart/js-basics-1](https://github.com/thoughtworks-jumpstart/js-basics-1)

