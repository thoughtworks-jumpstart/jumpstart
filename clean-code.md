# Clean Code

![martin fowler quote](.gitbook/assets/martin_fowler_code_readability_quote.jpg)

> Poorly factored code is a problem because it's hard to understand. Code that's hard to understand is hard to modify, whether to add new features or to debug - Martin Fowler

The idea of writing clean code is to ensure that the software is: readable, maintainable and extensible. Clean code enables businesses to iterate quickly and create value without tearing too much hair out.

## Tips on Writing Clean Code

* [code smells](https://sourcemaking.com/refactoring/smells)
* basic hygiene:
  * clear and intention-revealing variable names
  * use constants instead of magic numbers
  * small functions and classes
  * one level of abstraction per function
  * don't use comments to explain what the code is doing
  * functions should do one thing
  * avoid [deep nesting / multiple levels of indentation](http://wiki.c2.com/?ArrowAntiPattern) 
  * consistent formatting / linting
  * error handling \(fail loudly and quickly\)
  * don't modify arguments of a function
  * avoid return null
* Kent Beck's [4 rules of simple design](https://blog.jbrains.ca/permalink/the-four-elements-of-simple-design):
  * Pass the tests
  * Reveal intention \(i.e. make your code readable\)
  * No duplication
  * Fewest elements    
* Design Guidelines
  * [SOLID Principle](https://github.com/ryanmcdermott/clean-code-javascript/#solid)
  * [Separation of Concerns](http://aspiringcraftsman.com/2008/01/03/art-of-separation-of-concerns/)
  * [Favour composition over inheritance](https://www.youtube.com/watch?v=wfMtDGfHWpA)
  * [Convention over Configuration](https://en.wikipedia.org/wiki/Convention_over_configuration)
  * [Do one thing and do it well](https://en.wikipedia.org/wiki/Unix_philosophy#Do_One_Thing_and_Do_It_Well)
  * [Loose coupling, high cohesion](https://thebojan.ninja/2015/04/08/high-cohesion-loose-coupling/)
  * Tell, don't ask \(a.k.a [Law of Demeter](https://en.wikipedia.org/wiki/Law_of_Demeter)\)
* Rule of Thumb
  * Don't Repeat Yourself \(DRY\)
  * Keep it stupid, simple \(KISS\) 
    * [YAGNI](https://martinfowler.com/bliki/Yagni.html) \(You are not going to need it\)
    * [Do the simplest thing that could possibly work](http://wiki.c2.com/?DoTheSimplestThingThatCouldPossiblyWork)
    * Avoid [Accidental Complexity](http://wiki.c2.com/?AccidentalComplexity)
    * Avoid [Big Design Up Front](http://wiki.c2.com/?BigDesignUpFront)
    * "Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away."
* [The Boy Scout Rule](http://programmer.97things.oreilly.com/wiki/index.php/The_Boy_Scout_Rule)
* procedure vs functions
  * A procedure does not return anything and has side effects
  * A \(pure\) function has no side effect and return a result
* unit tests
  * one assertion per test
    * arrange/action/assert pattern
* [Refactoring techniques](https://sourcemaking.com/refactoring/refactorings)
  * Composing methods
    * Extract Method vs. Inline Method
    * Extract Variable vs. Inline Temp
    * Replace Temp with Query
  * Organizing data
    * Replace Magic Number with Symbolic Constant
  * And much much more!! \(see resources below for more refactoring techniques\)

## 5S Principles \(from Clean Code\)

* **Seiri**, or organization \(think “sort” in English\). Knowing where things are—using approaches such as suitable naming—is crucial. You think naming identifiers isn’t important?
* **Seiton**, or tidiness \(think “systematize” in English\). There is an old American saying: A place for everything, and everything in its place. A piece of code should be where you expect to find it—and, if not, you should re-factor to get it there.
* **Seiso**, or cleaning \(think “shine” in English\): Keep the workplace free of hanging wires, grease, scraps, and waste. What do the authors here say about littering your code with comments and commented-out code lines that capture history or wishes for the future? Get rid of them.
* **Seiketsu**, or standardization: The group agrees about how to keep the workplace clean. Do you think this book says anything about having a consistent coding style and set of practices within the group? Where do those standards come from? Read on.
* **Shutsuke**, or discipline \(self-discipline\). This means having the discipline to follow the practices and to frequently reflect on one’s work and be willing to change.

## Tips on Doing Refactoring Safely

* **Make sure you have automated tests in place to cover the system you are going to change.** If there is no test cases yet, you need to write [Characterization Test](https://michaelfeathers.silvrback.com/characterization-testing) or generate [Golden Master Test](http://blog.thecodewhisperer.com/permalink/surviving-legacy-code-with-golden-master-and-sampling) first.
* **Don't change system behavior \(e.g. fixing bugs, adding new features, etc\) during refactoring**
* **Make small changes, step by step**. If you need to do a big refactor it is better to do multiple small changes
* **Commit frequently**. You can make a commit after each small change, when all the tests are still passing.
* **Make good use of IDE support on refactoring**. For VS Code, there are some good plugins like [Javascript Booster](https://marketplace.visualstudio.com/items?itemName=sburg.vscode-javascript-booster) and [Surround](https://marketplace.visualstudio.com/items?itemName=yatki.vscode-surround) which helps you to automate some of the code changes.
* **Track the issues in a todo list**. If you notice some issues and you cannot work on it right away, you need to track it in the issue system.
* **Add unit tests along the way**. If you only have Golden Master Test and no Unit Tests, you should start adding Unit Tests while you do refactoring.

## Learning Resources

* Code Smells
  * [List of code smells](https://refactoring.guru/refactoring/smells)
  * [Another list of code smells](http://wiki.c2.com/?CodeSmell)
* Refactoring Techniques
  * [Martin Fowler's refactoring techniques catalogue](https://www.refactoring.com/catalog/index.html)
  * [List of refactoring techniques](https://sourcemaking.com/refactoring)
* SOLID Principles
  * [SOLID explained in a funny way](http://www.daedtech.com/visualization-mnemonics-for-software-principles/)
  * [SOLID OO Design in Javascript](https://medium.com/@cramirez92/s-o-l-i-d-the-first-5-priciples-of-object-oriented-design-with-javascript-790f6ac9b9fa)
* [Kent Beck's 4 rules of simple design](https://martinfowler.com/bliki/BeckDesignRules.html)
* [Clean code in Javascript](https://github.com/ryanmcdermott/clean-code-javascript/)
* [How to write unmaintainable codes](https://github.com/Droogans/unmaintainable-code)
* [Clean Code Cheat Sheet](https://www.planetgeek.ch/2014/11/18/clean-code-cheat-sheet-v-2-4/)
* [Object calisthenics](http://aimforsimplicity.com/post/objectcalisthenicsgameoflifekata/)
* [Clean Code: A Handbook of Agile Software Craftsmanship](https://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882)
* [Clean Coders](https://cleancoders.com/)
* [The worst mistake of computer science](https://www.lucidchart.com/techblog/2015/08/31/the-worst-mistake-of-computer-science/)

## Labs

### 1. Refactoring Kata

Instructions:

* Pair up and refactor each other's code
* Jot down code smells \(see list of code smells [here](https://github.com/ryanmcdermott/clean-code-javascript)\) and apply the refactoring techniques that you've learnt to make it better
* If you have any doubts, clarify it with your pair

Steps:

* Add your pair to your repo
* Clone your pair's repo
* set up
  * Install dependencies

    `npm install`

  * check test coverage first and write tests first if necessary:`npm test -- --coverage`
* Read each other's code and list down code smells
* Start refactoring!
  * Pair up, and refactor one repo at a time
  * Keep tests \(watch mode\) in sight
  * Commit often
  * Communicate - ask questions when in doubt

### 2. Refactoring video store

Fork the [Refactoring a JavaScript video store](https://github.com/thoughtworks-jumpstart/videostore-refactoring-exercise) and refactor the codes by applying the principals learned in this session.

### 3. Refactoring the-ugly-trivia-game

Fork the [Refactoring the ugly trivia game](https://github.com/thoughtworks-jumpstart/trivia_refactoring_kata) and refactoring the codes.

Note that in the repository there is a `golden_master` folder which contains Golden Master Test for the game.

Golden Master Test \(a.k.a Characterization Test\) is a technique used to record the existing behavior of the system under test and make sure your modifications do not cause behavior changes.

For more information on this technique, check out these two blog posts:

* [Surviving Legacy Code with Golden Master and Sampling](http://blog.thecodewhisperer.com/permalink/surviving-legacy-code-with-golden-master-and-sampling)
* [Legacy Coderetreat: Part 3 – Golden Master](http://blog.adrianbolboaca.ro/2014/05/golden-master/)

### 3. Code Retreat

* List of Problems to Choose From
  * [Mars Rover](http://kata-log.rocks/mars-rover-kata)
  * [Bowling Game](http://codingdojo.org/kata/Bowling/)
  * [Game of Life](https://codingdojo.org/kata/GameOfLife/)

