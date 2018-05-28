# Object-Oriented Programming (OOP)

## What is it?

Object-oriented programming (OOP) is one of the **programming paradigms**.  Another major programming paradigm is Functional Programming (FP), which we will talk about later.

The basic idea of OOP is that we use **objects** to model real world things that we want to represent inside our programs (Source: [MDN](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Object-oriented_JS)). OOP envisions **software as a collection of cooperating objects rather than a collection of functions or simply a list of commands (as is the traditional / procedural view)**. 

Today, many popular programming languages (such as Java, JavaScript, C#, C++, Python, PHP, Ruby and Objective-C) support OOP.

## Why is it useful?

It's a technique to help organizing large-scale codebase. It helps to answer the question: given a piece of code/functionality, where should we put it?

OOP promotes **greater flexibility and maintainability** in programming, and is widely popular in large-scale software engineering. Because OOP strongly emphasizes **modularity**, object-oriented code is simpler to develop and easier to understand and extend later on. 

## Learning Checklist
- Building Blocks
  - Class 
    - Constructor
    - Field/Property
    - Method
  - Object/Instance 
- OO Concepts
  - Abstraction
  - Encapsulation
  - Inheritance
  - Overriding & Polymorphism
  - Composition
- OO Modeling with UML
- (Optional) Patterns and Principles for OO Modeling
  - Mutable vs Immutable Objects
  - SOLID principles
  - Design Patterns
- (Optional) Duck Typing

### Building Blocks

What is a Class?
- A named concept that represent a group of things with same characteristics 

What is a Field/Property
- A named property of a given Class.
- these properties can be any value (i.e. string, number, function, or even other objects)

What is a Method?
- A named function or procedure, with or without parameters, that implements some behavior for a class.
- The property/method in a class should be aligned with the purpose/role/responsibility of the class.

What is an Instance of a Class?
- When you use the `new` operator to create a new object out of the given class, that object is an instance of the class.

Here are a few examples of classes and methods:

```javascript
class Movie {
  constructor(title, price, duration) {
    this.title = title;
    this.price = price;
    this.duration = duration;
  }
}

class Theater {
  constructor(name, seats) {
    this.name = name;
    this.seats = seats;
  }

  getAvailableSeats() {
    // return a list of available seats
  }

  markSeatAsBlocked(seatNumber) {
    // block the given seat
  }

  markSeatAsAvailable(seatNumber) {
    // cancel the blocking on the seat
  }

  markSeatAsSold(seatNumber) {
    // mark the seat as sold
  }
}

const SEAT_AVAILABLE = "available";
const SEAT_BLOCKED = "blocked";
const SEAT_SOLD = "sold";

class Seat {
  constructor(seatNumber) {
    this.seatNumber = seatNumber;
    this.status = SEAT_AVAILABLE;
    this.capacity = 1; 
  }

  getStatus() {
    return this.status;
  }

  block() {
    this.status = SEAT_BLOCKED;
  }

  free() {
    this.status = SEAT_AVAILABLE
  }

  sold() {
    this.status = SEAT_SOLD;
  }
}

class CoupleSeat extends Seat {
  constructor(seatNumber) {
    super(seatNumber);
    this.capacity = 2;
  }
}

class Ticket {
  constructor(showTime, movieTitle, theaterName, seatNumber, price) {
    this.showTime = showTime;
    this.movieTitle = movieTitle;
    this.theaterName = theaterName;
    this.seatNumber = seatNumber;
    this.price = price;
  }

  toString() {
    // generate a string representation of the ticket
  }
}

```

### OO Concepts

#### Abstraction

Creating a simple model of a more complex thing, which represents its most important aspects in a way that is easy to work with for our program's purposes.

- derive generalised concept from concrete examples
- ignore/drop irrelevant details 
- give it a name 

#### Encapsulation

- data and the operation using/manipulating those data are usually put into the same class
- some of the implementation details are declared as 'private' and hidden from public interface. (Some language like Java makes it very easy to declare private fields, but Javascript does not have straightforward support on this.)
- the functionality offered by an instance is only accessed through the public interface.

#### Inheritance

 - A class may inherit the fields and methods of its super-class/parent-class. 
 - An instance of child class is also an instance of the parent class. This is called `is-a` relationship. 
 - Inheritance is **transitive**, so a class may inherit from another class which inherits from another class, and so on, up to a base class (typically Object, possibly implicit/absent). 
 - Subclasses may **override** some methods and/or fields to alter the default behavior.

##### Class-based Inheritance vs Prototype-based Inheritance

- Class-based Inheritance: a child class inherits methods from its parent/ancestor class.
- Prototype-based Inheritance: one object inherits methods from its prototype object.

Some languages (like Java, C#) adopts Class-based Inheritance.

Javascript actually follows Prototype-based Inheritance, although the class syntax gives us an illusion of class-based inheritance. This is an advanced topic we can cover later.

#### Polymorphism

Polymorphism is one of the tenets of Object Oriented Programming (OOP). It is the practice of designing objects to share behaviors and to be able to override shared behaviors with specific ones. Polymorphism takes advantage of inheritance in order to make this happen.

Polymorphism means "One name, with many forms."

Through inheritance, polymorphism manifests through a technique called "override", where multiple object types to implement the same functionality (in different way).

#### Illustration: inheritance and polymorphism

Let's say we're modelling 3 animals (dog, cat and lion) and we want to put them in an array. For each animal, we want them to make their unique sound. Let's look at an implementation **without** polymorphism, before we look at a better implementation with polymorphism.

```javascript
class Dog {
  woof() {
    console.log("i'm a dog, hear me woof!");
  }
}

class Cat {
  meow() {
    console.log("i'm a cat, hear me meow!");
  }
}

class Lion {
  roar() {
    console.log("i'm a lion, hear me roar!");
  }
}

var dog = new Dog();
var cat = new Cat();
var lion = new Lion();
var animals = [dog, cat, lion];

// this for-loop shows how messy things can get when we don't design 
// our classes with polymorphism in mind. 
for (let i = 0; i < animals.length; i++) {
  var currentAnimal = animals[i];
  if (currentAnimal.constructor === Dog) {
    currentAnimal.woof();
  } else if (currentAnimal.constructor === Cat) {
    currentAnimal.meow();
  } else if (currentAnimal.constructor === Lion) {
    currentAnimal.roar();
  }
}

```

**Polymorphism to the rescue!!** Steps to achieving polymorphism:
- make `Dog`, `Cat` and `Lion` extend `Animal`
- make `Dog`, `Cat` and `Lion` implement the same method: `makeSound()`

```javascript
class Animal {
  makeSound() {
    // do nothing, because we actually can't implement this method.
    // think about it. what sound does Animal make?
  }
}
class Dog extends Animal {
  makeSound() {
    console.log("i'm a dog, hear me woof!");
  }
}

class Cat extends Animal {
  makeSound() {
    console.log("i'm a cat, hear me meow!");
  }
}

class Lion extends Animal {
  makeSound() {
    console.log("i'm a lion, hear me roar!");
  }
}

// Wow! polymorphism just made our life so much simpler!
// Now we can scale nicely to a circus with many more types of animals with ease!
for (let i = 0; i < this.animals.length; i++) {
  this.animals[i].makeSound();
}
```

#### Composition

Each object is a building block, and we can build more complex classes with other classes/objects.

Imagine that our animals now need a trainer. To create an instance of a `trainer`, we need to implement a `Trainer` class. Our implementation can be simplified by using **composition**.

As before, let's look at an implementation **without** composition, before we look at a better implementation with composition.

```javascript
class Trainer {
  woof() {
    console.log("i'm a dog, hear me woof!");
  }

  meow() {
    console.log("i'm a cat, hear me meow!");
  }

  roar() {
    console.log("i'm a lion, hear me roar!");
  }

  makeAnimalSound() {
    this.woof()
    this.meow()
    this.roar()
  }
}
// There are several problems with this implementation:
// 1. Duplication. 
// We had to rewrite the logic for woof(), meow() and roar().

// 2. Incorrect modelling. 
// Trainer should not know how to meow/woof/roar
// What if the method was eat()? Trainer now needs to eat raw meat like a lion! Yikes!
```
**Object composition to the rescue!!** Steps to achieving composition:
- Pass in the animal objects into the constructor of the Trainer class (that's why it's called **composition**. We are composing trainers using other objects)
- rely on the animal object's methods (e.g. `dog.makeSound()`)!


```javascript
class Trainer {
  constructor(animals) {
    this.animals = animals;
  }

  makeAnimalSound() {
    for (let i = 0; i < this.animals.length; i++) {
      var currentObject = this.animals[i];
      currentObject.makeSound();
    }
  }
}

```

### How to design classes (object oriented modeling)

What does it mean to "design/model a class"?

When you design a class, you need to considering the following aspects:

- What are the fields/properties?
- What are the methods/behaviors?
- Does it inherit from another class?
- Does it use/compose another class? (i.e. how does this class collaborate with other classes?)

To help people thinking about these questions (and to capture the design), someone created a tool called [UML (Unified Modeling Language)](https://en.wikipedia.org/wiki/Unified_Modeling_Language)

The most useful parts are some diagrams that helps to capture the gist of the design.

#### UML Diagrams

##### Class Diagram

Class Diagrams helps to visualise the relationship among classes (e.g. inheritance relationship)

![class diagram](http://agilemodeling.com/images/models/classDiagramInheritance.jpg)

- https://www.uml-diagrams.org/class-diagrams-overview.html
- http://www.agilemodeling.com/artifacts/classDiagram.htm

##### Sequence Diagram

Sequence Diagrams helps to visualize the interactions among objects (i.e. how can multiple objects collaborate with each other to implement a use case). 

![sequence diagram](https://www.ibm.com/developerworks/rational/library/content/RationalEdge/feb04/3101_figure11.jpg)

- https://www.uml-diagrams.org/sequence-diagrams.html

### Patterns and Principals of Object Oriented Modelling

#### Composition vs Inheritance

When you need to reuse some logic, there are at least two choices:

- via Inheritance. You can define the logic in a parent class and all children class can inherit it and reuse it.
- via Composition. You can define the logic in a helper class and then whoever need that function can keep a reference to that helper and reuse it.

In many cases, reusing logic via composition is the preferred approach because it's more flexible. You may sometimes hear an advice like "[favoring composition over inheritance](https://en.wikipedia.org/wiki/Composition_over_inheritance)".

However, that does not mean we should always avoid Inheritance. That's still a valid technique in OOP.

Here is a rule of thumb to help you decide when to use Inheritance and when to use Composition.

- You should declare a class B inherits from class A only when there is a true `is-a` relationship between the two classes.
  - This means, don't let a class inherit another parent class just because you need to reuse some logic in parent class. Code reuse via composition could be a better choice here.
- You should compose class B with class A (i.e. keeping a reference to class A in class B) when there is a `has-a` relationship between the two classes.

Here is a bad example on how to abuse Inheritance where you should really use Composition.

```javascript

// Assuming we want to define the Stack data structure by reusing some functionality from Array
class Stack extends Array {
  push(element) {
    // add the element to the end of array
  }
  pop() {
    // the the element at the end of array
  }
}
```

This is bad because there is no `is-a` relationship between `Stack` and `Array`.

A better implementation is through Composition:

```javascript
class Stack {
  constructor() {
    this.data = [];
  }
  push(element){
    this.data.push(element);
  }
  pop() {
    return this.data.pop();
  }
}
```

Here is a quick quiz: would you model `Square` as a child class of `Rectangle`? Why, or Why not?

#### SOLID Principles

- **S** ingle responsibility principle
- **O** pen/closed principle
- **L** iskov substitution principle
- **I** nterface segregation principle
- **D** ependency inversion principle

References

- [SOLID Principle](https://github.com/ryanmcdermott/clean-code-javascript/#solid)
- [SOLID explained in a funny way](http://www.daedtech.com/visualization-mnemonics-for-software-principles/)
- [SOLID OO Design in Javascript](https://medium.com/@cramirez92/s-o-l-i-d-the-first-5-priciples-of-object-oriented-design-with-javascript-790f6ac9b9fa)

#### Design Patterns

Design Patterns are well known code patterns/structures that solve well known problems.

https://refactoring.guru/design-patterns/catalog

### Duck Typing

> “When I see a bird that walks like a duck and swims like a duck and quacks like a duck, I call that bird a duck.”

#### Example 

We can define a logger that rely on `log` method on the given `target` object to log a given message.

```
const logger = (target) => (msg) => {
  target.log(msg);
};
```

We can simply use it with a console because `console` has a method `log`.

```
const log = logger(console);
log("Hello world!");
```

We can use it with a file logger if we define a `log` method.

```
const fs = require("fs");

class FileLogger {
  constructor(path){
    this.stream = fs.createWriteStream(path);
  }
  
  log(msg) {
    this.stream(`[${new Date().toString()}] ${msg}\n`); 
  }
  
  close() {
    this.stream.end();
  }
}

module.exports = FileLogger;
```

Here is how we can use the `logger` function with an instance of `FileLogger`

```javascript
const FileLogger = require("./FileLogger");
const fileLogger = new FileLogger("log.txt");

const log = logger(fileLogger):
log("Hello world!");

fileLogger.close();
```

Reference: https://medium.com/front-end-hacking/javascript-and-duck-typing-7d0f908e2238

Note that this is possible in Javascript because Javascript is a `dynamically typed language`, which means the type information is not hard coded in the source code, and it can change at runtime.

In our example, the type of `target` object that the `logger` function accepts can change at run time, as long as it supports the `log` method.

This is a useful feature in Javascript to write more reusable functions.

#### Resources

- [MDN docs on OOP in Javascript](https://developer.mozilla.org/ms/docs/Web/JavaScript/Introduction_to_Object-Oriented_JavaScript)
- [OOP In JavaScript: What You NEED to Know](http://javascriptissexy.com/oop-in-javascript-what-you-need-to-know/)
- [Introduction to object-oriented JavaScript](https://webplatform.github.io/docs/concepts/programming/javascript/OOJ/)
- [How to create private variables in Javascript](https://marcusnoble.co.uk/2018-02-04-private-variables-in-javascript/)

#### Assignment

Let's try to doing some modeling exercises:
- Mars Rover
- [MatchMaker](https://www.github.com/davified/oo-matchmaker)?
- Lift
- Parking Lot
- Hospital Appointment System
- Model an online movie booking system
