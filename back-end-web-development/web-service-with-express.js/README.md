# Web Service with Express.js

This is a hands-on workshop to learn how to build REST-style API using `express`.

## What is Express

Express is a javascript framework that allows you to create server-side web applications.

## Getting started

Steps for getting started:

* Create a new directory for your project: `mkdir my-express-app`
* `cd my-express-app`
* Create an empty project: `npm init -y`
* Install dependencies: `npm install express`
* Make current project a git repo: `git init`
* Create a `.gitignore` file and add node\_modules to it: `echo "node_modules" >> .gitignore`
* Create a file which will serve as the entry point to your app: \`touch app.js\`
* Start coding! Open the project in VS code: \`code .\`
* To start your express app, run: \`npx nodemon app.js\`

Run the following steps if you're including tests in your project:

* Install libraries which we'll use for writing tests: `npm install --save-dev jest supertest`
* Update your `package.json` and add the following two scripts:

  ```javascript
  "scripts": {
  "test": "jest",
  "test:watch": "jest --watch"
  },
  ```

## Workshop

To play with the examples in this workshop, you need to for and clone a project from our course's github repository:

```text
git clone https://github.com/thoughtworks-jumpstart/express-playground.git
```

After you clone the project, get into the project directory, and run

```text
npm install
```

## Lab

After you learned the basics of building REST API with express.js, you can build some REST APIs yourself:

* [API to generate shorten URLs](https://github.com/thoughtworks-jumpstart/express-url-shortener)

