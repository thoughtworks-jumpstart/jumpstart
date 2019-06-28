# Test Driven Development \(TDD\) with react-testing-library

## Prerequisite

* To have completed the food-app Lab 1 to Lab 8
* Knowledge on how to write react components
* Knowledge of how to write tests with react-testing-library

## What happened previously

Previously in the labs we have approached development in this order

1. Write component code
2. Create test and run that single test case in watch mode
3. Write test to cover the behaviour of the component
4. Ensure test goes from red to green
5. Commit

This workflow is beneficial for developers who are still new to the syntax for React and react-testing-library, as it allows us to focus on coding and testing individually so that there are not many "moving pieces" that we need to worry about at the start.

However that is Not the Recomended way to develop, as we might:

* Write redundant code that is not actually required
* Not fully test all the behaviours of the app

Now that we have mastered the syntax for React and React testing, we would like to modify our workflow to use Test Driven Development \(TDD\), which is a development best practice and discipline we should follow.

## What are the benefits of Test Driven Development \(TDD\)

In TDD, as its name implies, we first start by writing tests and only when it fails, then we are allowed to switch to the component code to develop. Once the test passes, we must switch back to writing more tests before we can write more component code.

In this way, TDD ensures that only essential code is written, and it would also be impossible to have a feature that does not have a corresponding test.

In the TDD process we would :

1. Run all tests in watch mode, and ensure that all are passing \(Green\) before we begin
2. Create test case for the component we wish to build
3. Render the component in the test, and watch the test fail \(Red\)
4. Go ahead to create the component file and watch the test pass \(Green\)
5. Switch back to the test and create an expect/assertion and watch the test fail
6. Develop the simplest code you can do to make the test pass
7. Refactor the code if it is not clean \(Refactor\)
8. Add a new test with another expect/assertion and watch the test fail
9. Develop the simplest code you can do to make the test pass again
10. Keep repeating the cycle till the component is fully tested and developed

## FAQ

### 1. In the Labs we run only the test which we are developing, while in TDD we run all tests. Why is that so?

Ans: In the first workflow we run all the tests when we are developing, but once the development phase is over, we no longer touch the App code. Hence we can choose to run only the test we are developing, so that there is less noise on the console

In TDD we are developing all the time. We need to run all tests as a safety net to help us detect when we have broken something.

### 2. I have heard about TDD and the term `Red - Green - Refactor`. How are these related?

Ans: `Red - Green - Refactor` is describing the process of writing a test and letting it fail \(Red\), writing the code to pass the test \(Green\), and looking at the code from the previous cycle and the current cycle, and cleaning up if that is required \(Refactor\)

### 3. Can you explain what is the `Refactor` step and why do we need to do this ?

Ans: Since TDD consists of many cycles of code change, rather than a upfront design of what you wish to code. As the code from the cycles accumulate, reduandant code could build up. eg: Code repetition, bad naming of variables or functions etc. If this is not cleaned up, it could become a `tech debt`, and make the code hard to maintain in the future.

Hence the `Refactor` steps means to clean the code so that it has the same behaviour as in the `Green` stage but is shorter and more readable, and has no repetition.

## Lab Instructions

This repo contains the starter project for building a comments list by Test Driven Development \(TDD\).

We will follow the steps in the blog post [Creating Readable Tests Using React Testing](https://medium.com/flatiron-labs/creating-readable-tests-using-react-testing-library-2bd03c49c284) to build a comment app with TDD

1. Fork this repository to your github account and clone it to your computer
2. [https://github.com/thoughtworks-jumpstart/comment-app](https://github.com/thoughtworks-jumpstart/comment-app)
3. The `master` branch contains the final solution
4. You should checkout to the `lab` branch do an `npm install` before starting this lab

## What does this repo contain

The sample repo is created using `create-react-app`

The initial libraries installed besides react, are

For testing:

* react-testing-library
* jest-dom

  Note: We do not need to install `jest` as it is already installed by `create-react-app`

For development:

* props-types \(this an optional library for ensuring the correct type of props is passed to a component\)

For styling:

* bootstrap \(and imported in index.js\)

## Additional Articles

* How to arrange the code in your test case: [Unit Testing and the Arrange, Act and Assert \(AAA\) Pattern](https://medium.com/@pjbgf/title-testing-code-ocd-and-the-aaa-pattern-df453975ab80)
* An interesting article explaining how to extract the truthy/falsey value in JS [JavaScript “Bang, Bang. I shot you down” - Use of double bangs \(!!\) in JavaScript.](https://medium.com/@pddivine/javascript-bang-bang-i-shot-you-down-use-of-double-bangs-in-javascript-7c9d94446054)
* This is [another excellent tutorial](https://learntdd.in/react/) you should checkout.
* If you would like to see how Kent \(the author of react-testing-library\) does testing, you can checkout his [online course](https://testingjavascript.com/)

