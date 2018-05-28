# OO Design Patterns

In software engineering, a software design pattern is a **general, reusable solution to a common problems within a given context in software design**. 

Fundamentally, the goal of object-oriented design patterns are aimed at creating software that's **extensible** and **maintainable** so that it can deal with **change**.

### Structure of a pattern

- Name
- Context (a.k.a. the situation)
- Problem
- Solution (usually, a class diagram will be helpful)
- Related patterns

### OO Basics
- Abstraction
- Encapsulation
- Polymorphism
- Inheritance

### OO Design Principles
- Favor composition over inheritance.
- Program to an interface (i.e. supertype), not an implementation
  - Programming to an implementation: `Dog d = new Dog(); d.bark();`
  - Programming to an interface: `Animal animal = new Dog(); animal.makeSound();`
- Encapsulate what varies
  - Here’s another way to think about this principle: take the parts that vary and encapsulate them, so that later you can alter or extend the parts that vary without affecting those that don’t.
- Strive for loosely coupled design 
- Classes should be open for extension but closed for modification
- Depend on abstractions (not concrete implementations)
- Talk to friends, not strangers
- Don't call us, we'll call you (the Hollywood principle)
- A class should only have one reason to change

### Resources

#### Recommended reading
- https://refactoring.guru/design-patterns/catalog
- [Head first design patterns](https://www.amazon.com/Head-First-Design-Patterns-Brain-Friendly/dp/0596007124)
- https://github.com/fbeline/Design-Patterns-JS
- http://www.dofactory.com/javascript/design-patterns

### Assignment

- Observer pattern lab: https://github.com/thoughtworks-jumpstart/observer-pattern-lab
