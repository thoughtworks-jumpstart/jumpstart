##### Scope
Javascript (ES5) has 2 kinds of scope: global scope and function scope (ES6 introduces a third kind of scope - block scope. More on that in the ES6 chapter)

```javascript
// example of function scope. b exists only within the function
function a() {
  var b = 2
}

console.log(b) // ReferenceError: b is not defined
```

###### Look-ups

When a variable is referenced (i.e. used), the Javascript engine looks in its current scope (e.g. if we're in a function, the Javascript engine will look inside the scope of the current function for the value of the variable). If it cannot find the variable, it will **look up** to the next bigger scope (e.g. global scope). 

Scope look-up stops once it finds the first match. The same identifier name can be specified at multiple layers of nested scope, which is called "shadowing" (the inner identifier "shadows" the outer identifier). Regardless of shadowing, scope look-up always starts at the innermost scope being executed at the time, and works its way outward/upward until the first match, and stops.

###### Lexical scope

What we've described here is known as **lexical scoping**. Lexical scope means that scope is defined by author-time decisions of where functions are declared. The **lexing** phase of compilation is essentially able to know where and how all identifiers are declared, and thus predict how they will be looked-up during execution. Hence the name - lexical scope.