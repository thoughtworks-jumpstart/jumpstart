# Object Equality


## What does `==` or `===` compare?

For `==` or `===`, they just compare the value of left-hand-side operand and right-hand-operand. When an operand is a reference to an object, the comparison is done by checking the memory address of the object.

For example:

```javascript

let gordon1 = { name: "Gordon"}
let gordon2 = { name: "Gordon"}

console.log(gordon1 == gordon2)
```

In this example, `gordon1 == gordon2` returns false because they are two unique objects and have different memory address. Although they seem to contain the same values, they are actually different objects.

## What if I want to compare objects by their values instead of memory address?

In this case, you have to apply some tricks.

The most common solution is to use external libraries, such as [lodash's isEqual() function](https://lodash.com/docs/4.17.5#isEqual)

## References

- [Object equality in JavaScript](http://adripofjavascript.com/blog/drips/object-equality-in-javascript.html)
- [Explain values vs references in JavaScript](https://codeburst.io/explaining-value-vs-reference-in-javascript-647a975e12a0)
