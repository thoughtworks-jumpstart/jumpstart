# Classes

## Learning checklist

* what does the word `class` mean?
* what are classes, and what they are used for
* how to define classes
* how to instantiate objects of a given class using the `new` keyword
* what is `this`
* how to extend a class to create a new subclass
* what does `super()` and `super.someMethod()` do
* rule of thumb for naming: use nouns for class names \(e.g. `Person`, `Student`, `Teacher`\), use verbs for function/method names \(`.walk()`, `.talk()`, etc\)

### Classes

Classes are blueprints for instantiating \(i.e. creating\) Javascript objects. ![](../../.gitbook/assets/class_inheritance.png)

* how to define a class

```javascript
class Person {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }
};
```

* what is constructor\(\)
  * The `constructor()` method is a special method for creating and initializing an object created with a class. There can only be one special method with the name "constructor" in a class. A SyntaxError will be thrown if the class contains more than one occurrence of a constructor method.
  * `constructor()` is called at the moment an object is instantiated. It usually has the same name as the class containing it.
  * constructors are optional
* how to use classes to instantiate objects

```javascript
var david = new Person('david', 30);
var gordon = new Person('gordon', 18);
```

* how to define methods within a class

```javascript
class Person {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }

    makeIntroduction() {   // this is a method
        console.log('hi! i am', this.name);
    }
};

var gordon = new Person('gordon', 18);
gordon.makeIntroduction()
```

### Subclassing

* inheritance
* `super()` and `super.someMethod()` - The `super` keyword is used to call methods on an object's parent.

```javascript
class Person {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }

    makeIntroduction() {
        console.log('hi! i am', this.name);
    }

    sayAge() {
        console.log('i am', this.age, 'years old');
    }
}


class JumpStarter extends Person {
  constructor(name, age, specialSkill) {
      super(name, age)          // this calls the constructor of the super class (Person)
      this.specialSkill = specialSkill
  }

  makeIntroduction() {
    super.makeIntroduction();
    console.log('i am a JumpStarter and my special skill is ' + this.specialSkill );
  }

  writeCode() {
    console.log('writing code!');
  }
}

tom = new JumpStarter('tom', 10, 'TDD');
tom.sayAge();            // inherited method
tom.makeIntroduction();  // overriden method
tom.writeCode();         // new method
```

## Resources

* [MDN Class docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes)
* [Understanding this](http://javascript.info/object-methods)
* [What is 'this' in Javascript](https://blog.bitsrc.io/what-is-this-in-javascript-3b03480514a7)

## Assignment

* [https://github.com/thoughtworks-jumpstart/javascript-classes](https://github.com/thoughtworks-jumpstart/javascript-classes)

