# Functional Programming

> I’m tired of people from one school of thought dissing ideas from some other school of thought. I hunger for people who don’t care where the ideas come from, just what they mean and what they produce. So I came up with this Oath of Non-Allegiance:
>
> "I promise not to exclude from consideration any idea based on its source, but to consider ideas across schools and heritages in order to find the ones that best suit the current situation."
>
> \(Alistair Cockburn\)

## Learning checklist

* what is functional programming?
* what is the difference between declarative and imperative programming?
* what are the benefits of functional programming \(over OOP\)?
* higher-order functions in javascript \(i.e. functions that take functions as arguments\)
  * `.forEach()`
    * `.map()`
    * `.filter()`
    * `.reduce()`
* recursion

## What is functional programming \(FP\)?

Functional programming is a:

* programming paradigm
* programming ‎style
* ‎mindset

## Functions are First-Class Objects in JavaScript

In languages that support functional programming \(like JavaScript, Ruby, Scala, etc\), functions are first-class objects, that means:

* They can be saved as variables
* They can be passed to other functions as arguments
* They can be composed with each other
* They can have their own attributes

To see some examples of these ideas, checkout [this article](http://helephant.com/2008/08/19/functions-are-first-class-objects-in-javascript/)

## Examples

### Example 1

```javascript
const getFirstName = person => person.split(" ")[1]; // second word
const getFirstLetter = string => string[0];   // first letter

const getFirstInitial = person => {
 return getFirstLetter(getFirstName(person));   // nested function!
}

// try it
getFirstInitial("Doc Emmett Brown");  // "E"
```

You can make the code even more functional by using the `pipe` function from libraries like [Ramda](http://ramdajs.com/)

```javascript
const getFirstInitial = pipe(getFirstName, getFirstLetter);
```

Here is a longer [example](https://medium.com/@collardeau/intro-to-functional-programming-concepts-in-javascript-b0650773139c)

### Example 2

Instead of writing the code below

```text
var total = 0, count = 1;
while (count <= 10) {
  total += count;
  count += 1;
}
```

We can write it like the code below:

```text
sum(range(1, 11))
```

Which one is easier to understand?

Note: The [sum](http://ramdajs.com/0.19.1/docs/#sum) and [range](http://ramdajs.com/0.19.1/docs/#range) functions are also supported by Ramda library.

### Example 3

Instead of writing the code below:

```text
const students = [{name: 'david', score: 100}, {name: 'gordon', score: 90}, {name: 'jack', score: 50} ]

const qualifedStudents = [];
for (let i = 0; i < students.length; i++) {
  if (students[i].score >=60) {
    qualifedStudents.push(students[i]);
  }
}
```

You can write the same code like

```text
const qualifedStudents = students.filter(student => student.score >=60)
```

Which one is easier to read?

### Example 4, in SQL

Many people are not aware that pure SQL queries are actually written in functional \(declarative\) style.

```text
SELECT EMP_ID, LAST_NAME
FROM EMPLOYEE
WHERE CITY = 'Singapore'
ORDER BY EMP_ID;
```

Note how we specify **what** data we need, without worrying about **how** that data is retrieved by database.

## Key principles in functional programming

* Declarative &gt; Imperative
  * Specify what you need, instead of how to get it \(step by step\)
* Pure &gt; Side Effects
  * Calling the same function with same input, you always get back the same result
  * This leads to [referential transparency](https://www.sitepoint.com/what-is-referential-transparency/)
* Composition &gt; Inheritance
  * In order to reuse a piece of functionality, you should prefer to define it as a function ans reuse it.
  * Build a complex system by composing more basic components/functions.
* Immutability/Stateless &gt; State Mutation
  * Objects with mutable state are harder to analyze when they don't behave well
  * Prefer [Immutable Objects](https://facebook.github.io/immutable-js/)
* Recursion &gt; Loops/Iteration
  * for/while loops are more imperative style
  * Warning: watch out for [stack overflow problem](https://en.wikipedia.org/wiki/Stack_overflow) because there is a [max limit on stack size in JavaScript engines](http://2ality.com/2014/04/call-stack-size.html). When stack overflow happens, either you need to rewrite your function as [tail-recursive](http://2ality.com/2015/06/tail-call-optimization.html) or fall back to iteration.
* Treat functions as first class objects \(i.e. functions are just like everyone else - numbers, strings, objects, booleans\). They may be stored in arrays, passed around as function parameters and assigned to variables\)
  * Higher order functions \(i.e. functions that return/take in functions\)

## FP vs OOP

| Object Oriented                                              | Functional                                                                                           |
| :----------------------------------------------------------- | :--------------------------------------------------------------------------------------------------- |
| You have a lot of classes and each offers only a few methods | You only have a few well known data structures \(e.g. list, map\) and they support tons of functions |
| Classes/Objects are the first class citizen                  | Functions are the first class citizen                                                                |
| You build programs by composing objects                      | You build programs by composing functions                                                            |

## Benefits of FP

* easier to test \(just test input -&gt; output is mapped correctly\)
* easier to reason about \(don’t need to worry about side-effects\)
* composability / modularity
* scalability / concurrency
* \(can be\) less verbose

## Useful Libraries for functional programming in JavaScript

* [immutable.js](https://facebook.github.io/immutable-js/)
  * [introduction to immutable.js](https://auth0.com/blog/intro-to-immutable-js/)
* [lodash.js](https://lodash.com/)
* [ramda.js](http://ramdajs.com/)

## Native JavaScript API for Functional Programming

The JavaScript core API offers some of the functions that are very useful too:

* [every](http://devdocs.io/javascript/global_objects/array/every)
* [some](http://devdocs.io/javascript/global_objects/array/some)
* [filter](http://devdocs.io/javascript/global_objects/array/filter)
* [map](http://devdocs.io/javascript/global_objects/array/map)
* [reduce](http://devdocs.io/javascript/global_objects/array/reduce)

## A Note on Recursion

Recursion is a problem-solving technique where the solution to a problem depends on solutions to smaller instances of the same problem.

For example, in Math, the definition of `Factorial` can be expressed as

```javascript
factorial(n) = n * factorial(n-1) when n > 1
factorial(1) = 1
```

Based on this definition, we can write the `Factorial` function as

```javascript
var factorial = function(number) {
  if (number <= 0) {
    throw new Error("The number must be positive");
  }
  if (number === 1) { // terminal case
    return 1;
  } else { // reduce to smaller problem
    return (number * factorial(number - 1));
  }
};
```

Not all problems can be solved in this way, though. For a problem to be solved in this way, the problem usually need so satisfy two conditions:

* The solution of a bigger problem depends on the solution of a smaller problem
* There are a few \(usually one\) `terminal case` which are very trivial to solve \(hence they don't depend on other solutions anymore\).

In most of the cases, if there is a recursive version of the solution, there is also an iterative version of the solution. For example, the `factorial` function can also be written using loops:

```javascript
var factor = function(number) {
  if (number <= 0) {
    throw new Error("The number must be positive");
  }

  var result = 1;
  var count;
  for (count = number; count > 1; count--) {
    result *= count;
  }
  return result;
};
```

Here is a quick comparison of the two versions:

* Recursive version is usually easier to understand
* Iterative version can help to avoid the stack-over-flow problem

Quick challenge: write a function to reverse a string with recursion approach.

You can find some [help](https://codeburst.io/learn-and-understand-recursion-in-javascript-b588218e87ea), or [a few more examples](https://medium.freecodecamp.org/recursion-in-javascript-1608032c7a1f) on problems you can solve with recursion.

## References

* [First Class Function](https://en.wikipedia.org/wiki/First-class_function)
* [Functional Programming](https://en.wikipedia.org/wiki/Functional_programming)
* [Functional programming jargons explained](https://functional.works-hub.com/learn/Functional-Programming-Jargon)

## Recommended Reading

* [What is functional programming?](https://medium.com/javascript-scene/master-the-javascript-interview-what-is-functional-programming-7f218c68b3a0)
* [Functional Programming Fundamentals](https://www.matthewgerstman.com/functional-programming-fundamentals/)
* [List processing with map, filter and reduce](https://scotch.io/tutorials/list-processing-with-map-filter-and-reduce)
* [Video: Functional programming in ES6](https://www.youtube.com/watch?v=HvMemAgOw6I)
* [Immutable JavaScript using ES6 & Beyond](https://wecodetheweb.com/2016/02/12/immutable-javascript-using-es6-and-beyond/)
* [Don't be afraid of functional programming](https://www.smashingmagazine.com/2014/07/dont-be-scared-of-functional-programming/)
* [Functional Programming with JavaScript](https://stephen-young.me.uk/2013/01/20/functional-programming-with-javascript.html)
* [Video: Functional Programming in JavaScript](https://www.youtube.com/playlist?list=PL0zVEGEvSaeEd9hlmCXrk5yUyqUag-n84)
* [Practical Functional Programming](https://www.youtube.com/watch?v=I_uIXgSmkDo&index=7&t=0s&list=WL)

## Books

* [Functional Light JavaScript](https://github.com/getify/Functional-Light-JS)
* [Professor Frisby's Mostly Adequate Guide to Functional Programming](https://drboolean.gitbooks.io/mostly-adequate-guide/content/)
* [Structure and Interpretation of Computer Programs](https://sarabander.github.io/sicp/)
* [How to Design Programs](https://www.htdp.org/)
* [Learn You a Haskell for Great Good!](http://learnyouahaskell.com)

## Assignment

* [Higher order functions](https://github.com/thoughtworks-jumpstart/higher-order-functions-exercises)
* [More exercises on Functional JavaScript](https://github.com/timoxley/functional-javascript-workshop)
