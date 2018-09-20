# let and const

ES6 offers us 2 new \(and preferred ways\) to define variables:

* `const`   - for variables with values that should not be reassigned
* `let`     - for variables with values that can be reassigned

## Understanding Scope of `var` and `let`/`const`

Scope of a variable is the area of codes where the variable can be used.

In ES5, there are only two type of scopes:

* global scope
  * When you define a variable without `var`, or define it outside a function, that variable is in global scope
  * There is a global object which stores all global variables. In browsers, that's called 'window'. In Node environment, that's called 'global'.
  * Use of global variables are discouraged in general, except for a few valid use cases 
* function scope
  * When you define `var` inside a function.

In the following example, the variable `animalToFeed` is actually available through the whole function although it's define in a block:

```javascript
function feedPet() {
  {
    var animalToFeed = "cat";
  } 

  console.log("I am feeding my " + animalToFeed);
}

feedPet(); // log "I am feeding my cat"
```

In ES6, there is one more scope added

* block scope:
  * When you define a variable with `let`. The variable belong to the scope defined by the closest enclosing `{}`

In the following example, the variable `animalToFeed` is not available outside the block \(i.e. the enclosing {}\) where it's defined.

```javascript
function feedPet() {
  {
    let animalToFeed = "cat";
  } 

  console.log("I am feeding my " + animalToFeed);
}

feedPet(); // ReferenceError: animalToFeed is not defined
```

## Understanding Variable Hoisting

The `var` variables has an hoisting effect: they can be used before their declaration, although the value you get is always `undefined` until you properly set the variable value.

For `let` and `const`, if you try to use them before the declaration, you would get `ReferenceError`.

More details can be found [here](https://medium.freecodecamp.org/what-is-variable-hoisting-differentiating-between-var-let-and-const-in-es6-f1a70bb43d)

## When should we prefer let/const to var?

* why `let` and `const` &gt; `var`:
  * prevent \(accidental\) variable reassignment
  * block scoped. no leaking into global scope
  * no need for [IIFE \(immediately invoked function expression\)](https://stackoverflow.com/questions/8228281/what-is-the-function-construct-in-javascript) to limit the scope of variables
  * avoid silent undefined values \(which `var` allows because of variable hoisting\). 

### Digging deeper into why `let` and `const` &gt; `var`

`let` and `const` fixes 4 problems which we encounter when using `var`:

1\) Block scoping of `let` and `const` prevents variables from leaking into global scope

```javascript
// with var
for (var i = 0; i < 10; i++ ) {
    console.log(i)
}
console.log(i)      // prints 10. `i` has leaked into the global scope
// any variable that's intended to be used only within if statements, for loops (i.e. any curly braces that is not a function), will pollute the global scope!

// with let
for (let i = 0; i < 10; i++ ) {
    console.log(i)
}
console.log(i)      // ReferenceError: i is not defined. Block scoping prevents pollution of global scope!
```

2\) `let` and `const` prevents accidental variable reassignment

```javascript
// with var
var x = 1000
// ... 100 lines of code later
var x = 'bob'
// silent and hard to detect bugs can happen because javascript let us change the value of x

// with let & const
let x = 1000
// ... 100 lines of code later
let x = 'bob'   // SyntaxError: Identifier 'x' has already been declared
const x = 'bob' // SyntaxError: Identifier 'x' has already been declared
```

3\) `let` and `const` prevent subtle bugs arising from variable hoisting

```javascript
// with var
// bad. 'fails' silently. javascript will let you refer to `x` before it's defined, leading to all sorts of weird things such as printing 'undefined' on your beautiful user interface
console.log(x);   // prints undefined
var x = 10;

// good. throws a ReferenceError, telling you that there's a bug in your code that you need to fix
console.log(y);
let y = 10;
```

4\) `let` and `const` keep variable scope within **callbacks**.

```javascript
// bad. prints 10 ten times after 1 second 
for (var i = 0; i < 10; i++ ) {
    setTimeout(function() {
        console.log(i);
    }, 1000);
};

// good. prints 1 to 10 after 1 second, as we expected
for (let i = 0; i < 10; i++ ) {
    setTimeout(function() {
        console.log(i);
    }, 1000);
};
```

**Rule of thumb**: use `const` by default. use `let` otherwise.

**Note**: You should prefer `const` to `let` when you have a choice. In this section, we use a lot of `let` and very few `const` in our examples. This is to allow you to experiment with the syntax again and again without getting errors for trying to redefine variables \(this happens when you use `const`\). In your projects/assignments, use `const` unless you intend to reassign another value to your variable.

## Recommended Reading

More differences of let vs var are discussed [here](http://www.jstips.co/en/javascript/keyword-var-vs-let/)

