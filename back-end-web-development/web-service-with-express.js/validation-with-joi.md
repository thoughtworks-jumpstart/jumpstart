# Introduction

- As a security best practice we should not trust what the client sends us, validation of input should be the first step before the application logic saves or makes uses of these values.

- We can write the validation code manually using `if` condition checks however this is error prone to and tedious to code from scratch 
  - e.g.: if( !res.body.name || !res.body.artist)

- In a real world scenario your objects will also have many more attributes than just name/ artist.

- To address that issue we can use a validation library called Joi. This library is a popular javascript object validation library that allows developers to define a schema stating:
  - the attributes of an object and wheather it is an optional or required attribute
  - the type an attribute should have. eg: should it be a string or a number or email
  - the max or minimum length a field should be
  - for more features please visit the Joi library page at [https://github.com/hapijs/joi](https://github.com/hapijs/joi) 

- A schema is a very concise way to describe (in code) what data you expect to recieve from the client   

You can validate your request body against the schema and get:
  - a result object that contains a value and an error attribute 

```javascript 
  {
    error:
    value:
  }
```

  - if the validation passes the `value` attribute contain the object validated and the `error` attribute will be undefined
  - if the validation fails the the `value` attribute is undefined and the `error` attribute will contain a `details` array of errors messages. One for each validation failure that occurred. 

## Example Code

```javascript
//First define a schema describing your object 
const schema = {
    username: Joi.string().alphanum().min(3).max(30).required(),
    birthyear: Joi.number().integer().min(1900).max(2013),
    email: Joi.string().email({ minDomainAtoms: 2 })
}

requestBody = {
  username: "John Tan",
  birthyear: 1990
}

//Validate the 
result = Joi.validate(requestBody, schema);

if(result.error){
  console.log("The data is invalid")
  //return 400 bad request to the client
}
else {
  console.log("The data is valid!!")
  //save the data to db and return 200 OK to the client
}
```

## Lab 6: Integrate Joi validation library to validate data

In the previous lab we have validated that the song ids from the client, and return an error 404 if it is an invalid id. 

However there are still errors which could occur from invalid inputs sent from the client in the request body. Two routes currently get data from request body without validating it in this lab you have to fix that.


### Requirements
- Create a Joi schema in routes/songs.js

- the schema should validate that:
 - name field is present, and is of type string, and minimum 3 characters long 
 - artist field is present, and is of type string, and minimum 3 characters long

- Use this schema to validate the data posted in 
  1. POST /songs/
  2. PUT /songs/:id

- If the data is invalid to return HTTP response 400 Bad Request to the client with this response to the client

```javascript
{ 
  message : <specific error message returned from joi>
}
```

- Write the test for each route to prove that the route returns 400 when you POST or PUT invalid data to it, and that the error message is the one returned from Joi

- **Note** : the existing HTTP response 404 error messages for invalid id should still work as per normal.

- **Hint** : It is recommended to work on one route at a time, by first writing the test for it and then implementing the changes in the route handler. After that works you can move on to the second route.

### Instructions
- Navigate to the express-songs-api project folder
- Ensure that the work from your previous lab is already commited.
- checkout to branch `11-add-joi-validation` to get started

- Before you begin install joi to your project with: 

```
npm install joi
```
- read the Joi documentation from the resources section below if you need more information.

### Solution
- After you have completed Lab 6, please commit all your work

- You may optionally install the plugin **Git History Diff** for viewing the difference between git branches. This will allow you to easily compare your work with the sample solution 

- [https://marketplace.visualstudio.com/items?itemName=huizhou.githd](https://marketplace.visualstudio.com/items?itemName=huizhou.githd)

- Next checkout to the solution branch and we will now walk through the sample solution
```
git checkout 12-add-joi-validation-solution
``` 

- To view the difference between your work and the sample solution go to the VS Code file explorer, right click your folder and select `GitHD: View Folder Diff` and select compare with `11-add-joi-validation` branch 

- The diff sidebar will popup and you can click on the files to view the difference between your work and the sample solution.

- When viewing the diff you can temporarily toggle the sidebar with `cmd + B` to hide it.


## Resources

For more information on Joi, you can refer to the materials below:

- [Joi Validation https://github.com/hapijs/joi](https://github.com/hapijs/joi) 

