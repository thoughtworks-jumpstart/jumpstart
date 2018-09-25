# Default Function Parameters

Default function parameters allow formal parameters to be initialized with default values if no value or undefined is passed.

For example, before ES6, if you need to write a function to handle the case when some argument is not provided, you need to write something like the one below:

```javascript
// ES5 (much more verbose!)
function hello(name) {
    if (name === undefined) {
        return 'hello world'
    } else {
        return 'hello ' + name
    }
}
```

In ES6, you can write the same code as:

```javascript
// ES6
const hello = (name='world') => {
    return 'hello ' + name
}

console.log(hello('bob'))   // 'hello bob'
console.log(hello())   // 'hello world'
```

However, be careful when someone pass the `null` value as function argument, in that case, the default parameter value is not used.

```javascript
console.log(hello(null))   // 'hello null'
```

For more documentation, checkout [MDN Docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters)

