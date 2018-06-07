# forEach

The `.forEach()` method executes a provided function once for each array element.

Syntax:

```javascript
someArray.forEach(function(element[, index, array]) {

})
```

[Check out the docs.](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/foreach)

**Example**

```javascript
var friends = ["bob", "alice", "tim", "june"];

// using the old for loop
for (var i = 0; i < friends.length; i++) {
  console.log("Hello, " + friends[i] + "!");
}

// using .forEach()
friends.forEach(function (buddy) {
  console.log("Hi " + buddy + "!");
});

// both output the same thing
// > Hi bob!
// > Hi alice!
// > Hi tim!
// > Hi june!
```

**Note**

* The callback function \(`someCallback()`\) can either be an anonymous or named function \(like all callbacks\).
* This function can receive 3 positional parameters: `element`, `index`, `container`. The position matters, so the first variable name that you pass into this callback will always refer to `element`, no matter what you call it. 
* You can omit parameters from the parameter list if you are not using them
* `.forEach()` is just like `.map()`, except `.forEach()` always returns `undefined`

  \`\`\`javascript

  \[1,2,3\].forEach\(function\(element\) {

  return element

  }\); // returns undefined

\[1,2,3\].map\(function\(element\) { return element \* 2 }\); // returns \[2, 4, 6\]

```text
```javascript
[1,2,3].forEach(function(element, index, container) { 
  console.log("----")
  console.log("element value : " + element)
  console.log("index number  : " + index)
  console.log("container     : " + container)
})
// [ 1, 2, 3 ]
// [ 1, 2, 3 ]
// [ 1, 2, 3 ]
```

