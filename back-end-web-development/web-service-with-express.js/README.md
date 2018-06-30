# Web Service with Express.js

This is a hands-on workshop to learn how to build REST-style API using `express`.

## What is Express

Express is a javascript library that allows you to create server-side web applications.

## Getting started

Steps for getting started: 
- Create a new directory for your project: `mkdir my-express-app`
- `cd my-express-app`
- Create an empty project: `npm init -y`
- Install dependencies: `npm install express`
- Make current project a git repo: `git init`
- Create a `.gitignore` file and add node_modules to it: `echo "node_modules" >> .gitignore`
- Start coding!

Run the following steps if you're including tests in your project:
- Install libraries which we'll use for writing tests: `npm install jest supertest`
- In `package.json` add the following scripts: 
```json
"scripts": {
  "test": "jest",
  "test:watch": "jest --watch"
},
```

## Workshop

To play with the examples in this workshop, you need to clone a project from our course's github repository:

```text
git clone https://github.com/thoughtworks-jumpstart/express-playground.git
```

After you clone the project, get into the project directory, and run

```text
npm install
```

## Assignment

[https://github.com/thoughtworks-jumpstart/express-url-shortener](https://github.com/thoughtworks-jumpstart/express-url-shortener)

