# Prototype based inheritance

In ES6, we can define classes and extend one from another. Then a child class can reuse the logic defined in its parent class.

However, this is just `syntax sugar` to make JavaScript more look like other object oriented programming languages. Under the hood, the inheritance is actually based on a concept called `prototype`.

The picture below explains how does the `prototype-chain` works.

![prototype-inheritance](../../../.gitbook/assets/prototype-inheritance.png)

All constructor function has `prototype` property.

All objects has `__proto__` property, which is also denoted as `[[prototype]]`

```text
Object.__proto__ == Function.prototype
Function.__proto__ == Function.prototype
Array.__proto__ == Function.prototype
```

The reason why `Object.__proto__` points to Function.prototype is because Object\(\) by itself is a native function that instantiates an empty object. Therefore, Object\(\) is a function. You'll find that all the other major native types' `__proto__` properties point to `Function.prototype`. Object, Function, String, Number, and Array all inherit the Function prototype.

```text
Object.prototype.__proto__ == null
```

`Object.prototype` is at the top of the proto-type chain, and its `__proto__` property is `null`

## A simple example

Here are some [sample codes](https://github.com/thoughtworks-jumpstart/prototype_examples.git) showing you how to implement inheritance in three approaches:

* prototype chain
* classes in ES5
* classes in ES6

## References

* [http://javascript.info/function-prototype](http://javascript.info/function-prototype)
* [http://javascript.info/prototype-inheritance](http://javascript.info/prototype-inheritance)
* [https://giamir.com/js-prototype-chain-mechanism](https://giamir.com/js-prototype-chain-mechanism)
* [https://hackernoon.com/understanding-javascript-prototype-and-inheritance-d55a9a23bde2](https://hackernoon.com/understanding-javascript-prototype-and-inheritance-d55a9a23bde2)
* [https://stackoverflow.com/questions/572897/how-does-javascript-prototype-work](https://stackoverflow.com/questions/572897/how-does-javascript-prototype-work)
* [https://stackoverflow.com/questions/650764/how-does-proto-differ-from-constructor-prototype](https://stackoverflow.com/questions/650764/how-does-proto-differ-from-constructor-prototype)
* [https://stackoverflow.com/questions/9959727/proto-vs-prototype-in-javascript?noredirect=1&lq=1](https://stackoverflow.com/questions/9959727/proto-vs-prototype-in-javascript?noredirect=1&lq=1)
* [A Beginner's Guide to JavaScript's Prototype](https://tylermcginnis.com/beginners-guide-to-javascript-prototype/)

