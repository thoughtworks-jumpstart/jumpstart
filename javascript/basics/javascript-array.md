# Arrays

An array is a data structure that allows us to store a collection of values in a single variable.

## Syntax

Defining an array:

```javascript
const myArray = [1, 5, 10, 42];
```

Accessing array element\(s\)

```javascript
myArray[0]; // returns 1
myArray[1]; // returns 5
myArray[2]; // returns 10
myArray[3]; // returns 42
myArray[4]; // returns undefined
```

Adding array element\(s\)

```javascript
myArray.push(43);
// Note: this mutates the state of the original array. We will learn another way of doing this in the ES6 chapter that does not mutate the original array
```

Removing array elements

* `myArray.slice(i, [j])`
  * `i` is the starting index
  * `j` \(optional\) is the ending index \(non-inclusive of the element at index `j`\). If excluded, the ending index is
  * this method does not mutate myArray. Rather, it returns a new array

    ```javascript
    const animals = ['ant', 'bison', 'camel', 'duck', 'elephant'];

    animals.slice(2);  // returns ["camel", "duck", "elephant"]

    animals.slice(2, 4); // returns ["camel", "duck"]

    animals.slice(1, 5); // returns ["bison", "camel", "duck", "elephant"]
    ```

Joining arrays to form strings

```javascript
// syntax: someArray.split(someDelimiter)

['hello', 'who', 'are', 'you'].join('_') // 'hello_who_are_you'
['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd'].join('') // returns 'hello world'
```

Creating arrays from strings using `String.split()`

```javascript
// syntax: someString.split(someDelimiter)

'hello world'.split(' ') // returns ['hello', 'world']
'hello world'.split('') // returns ['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd']
```

You can also create arrays from strings using `Array.from()`

```javascript
Array.from('hello world') // returns ['h', 'e', 'l', 'l', 'o', ' ', 'w', 'o', 'r', 'l', 'd']
```

## Resources

* [Array Explorer](https://sdras.github.io/array-explorer/)
* [MDN Array docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/prototype)
* [Array iteration methods](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/prototype#Iteration_methods)

## Lab

* [https://github.com/thoughtworks-jumpstart/js-basics-3](https://github.com/thoughtworks-jumpstart/js-basics-3)
* [https://github.com/thoughtworks-jumpstart/javascript-basics](https://github.com/thoughtworks-jumpstart/javascript-basics)

