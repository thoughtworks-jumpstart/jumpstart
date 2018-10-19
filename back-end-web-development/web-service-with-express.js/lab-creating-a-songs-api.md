# Lab : Creating a Songs API

## Introduction

This section is the start of an extended lab to build a Songs API. Based on what you have learned so far you will build a CRUD API to store a song list.

As we proceed through the futher topics, the idea is to introduce to you a new feature of Express server followed by a practical lab in which you will have to incorporate what you have learnt into the Songs API.

By the end of the Express introduction and you would have a functional API complete with tests, error handling and validation.

The repository can be downloaded with:

```text
git clone https://github.com/thoughtworks-jumpstart/express-songs-api.git

```

Each lab consist of 2 branches, the lab branch for implementing your code, and the sample solution branch to be viewed after the lab

This git repository consist of 14 branches :

1. Lab: Build a basic CRUD API for the song list (Create / Read / Update / Delete)
0. Sample solution for the above
0. Lab: Implement tests with Jest and Supertest 
0. Sample solution for the above
0. Lab: Integrate app.param() middleware to find song from id
0. Sample solution for above
0. Lab: Integrate Express routers to organise your songs routes
0. Sample solution for above
0. Lab: Integrate a default error handler middleware for your songs routes
0. Sample solution or above
0. Lab: Integrate Joi validation library to validate data
0. Sample solution for above
0. Lab: Refactor your songs route handlers to be asynchronous with async and await
0. Sample solution for above


## Lab 1: Build a basic CRUD API for the song list (Create / Read / Update / Delete)

### Requirements
In this lab we will implement a basic CRUD API in Express for a song list with the below 5 routes:

**Get all  songs**
- Route: GET /songs 
- HTTP Response: 200      
- Expected response: 
```javascript
[ 
  { id: 1, name: xxx, artist: xxx }, 
  { id: 2, name: xxx, artist: xxx} 
]
```

**Create one song**
- Route: POST /songs 
- HTTP Response: 201
- Expected Response: 
```javascript
{ id: 1,  name: xxx, artist: xxx }
```

**Get song with id**
- Route: GET /songs/:id 
- HTTP Response: 200
- Expected Response: 
```javascript
{ id: 1, name: xxx, artist: xxx }
```

**Update song with id**
- PUT /songs/:id 
- HTTP Response: 200
- Expected Response: 
```javascript
{ id: 1, name: xxx, artist: xxx }
```

**Delete song with id**
- Route: DELETE /songs/:id
- HTTP Response: 200
- Expected Response: 
```javascript
{ id: 1, name: xxx, artist: xxx }
```

### Instructions
- Install and use Insomnia REST client to test your API 

- Fork the below repo to your github if you have not yet done so: 
[https://github.com/thoughtworks-jumpstart/express-songs-api](https://github.com/thoughtworks-jumpstart/express-songs-api)

- Clone the repo to your computer and navigate in

- Do `git branch` and ensure that you are on the master branch

- We will now do the first route together `GET /songs` in class and you can continue with the remaining 4 routes

### Solution
- After you have completed Lab 1, please commit all your work to the `master` branch

- You may optionally install the plugin **Git History Diff** for viewing the difference between git branches. This will allow you to easily compare your work with the sample solution 

- [https://marketplace.visualstudio.com/items?itemName=huizhou.githd](https://marketplace.visualstudio.com/items?itemName=huizhou.githd)

- Next checkout to the solution branch and we will walk through the sample solution
```
git checkout 2-crud-api-solution
``` 

- To view the difference between your work and the sample solution go to the VS Code file explorer, right click your folder and select `GitHD: Viwe Folder Diff` and select compare with `master` branch 

- The diff sidebar will popup and you can click on the files to view the difference between your work and the sample solution.

- When viewing the diff you can temporarily toggle the sidebar with `cmd + B` to hide it.


## Lab 2: Implement tests with Jest and Supertest 

In this lab we will introduce how to test the Songs CRUD API you implemented in the previous lab. The testing libraries we will be using is Jest and Supertest.

## Benefits of Tests**
- Tests are faster way to verify that your APIs are working correctly, as compared to Insomnia Rest client 
- Tests can act as a safety net when you are required to make changes to your API later
- Most importantly tests document a CONTRACT between your API and the clients accessing it

### Requirements
Based on the requirements stated in lab one we are required to write tests to ensure that our API are:
- returning the correct HTTP status code
- returning the correct response in the body
- for each of the 5 routes defined

### Instructions
- Navigate to the express-songs-api project folder

- Ensure that the work from your previous lab is already commited to `master` branch

- checkout to branch `3-testing-lab` to get started

```
git checkout 3-testing-lab
```
- open the file songs.test.js this is the file where you would need to fill in the test logic for each of your route

- We will now do the first test together `POST /songs` in class and you can continue with the remaining 4 routes

```javascript
const app = require("../app");
const request = require("supertest");

describe("routes/songs", () => {

  it("POST /songs should return a new song object", () => {
    requestBody = { name: "test song", artist: "rhianna"};
    
    return request(app)
    .post("/songs")
    .send(requestBody)
    
    .then(response => {
      expect(response.status).toEqual(201);
      expect(response.body).toMatchObject(requestBody);
    });
  });  
});
```


### Solution
- After you have completed Lab 2, please commit all your work to the `3-testing-lab` branch

- You may optionally install the plugin **Git History Diff** for viewing the difference between git branches. This will allow you to easily compare your work with the sample solution 

- [https://marketplace.visualstudio.com/items?itemName=huizhou.githd](https://marketplace.visualstudio.com/items?itemName=huizhou.githd)

- Next checkout to the solution branch and we will now walk through the sample solution
```
git checkout 4-testing-lab-solution
``` 

- To view the difference between your work and the sample solution go to the VS Code file explorer, right click your folder and select `GitHD: Viwe Folder Diff` and select compare with `3-testing-lab` branch 

- The diff sidebar will popup and you can click on the files to view the difference between your work and the sample solution.

- When viewing the diff you can temporarily toggle the sidebar with `cmd + B` to hide it.
