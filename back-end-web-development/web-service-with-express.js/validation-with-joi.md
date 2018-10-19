# Introduction

- As a security best practice should not trust what the client sends us, validation of input should be the first step before the application logic saves or makes uses of these values.

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
result = Joi.validate(req.body, schema);

if(result.error){
  console.log("The data is invalid")
  //return 400 bad request to the client
}
else {
  console.log("The data is valid!!")
  //save the data to db and return 200 OK to the client
}
```

## Lab Instructions

To work on the lab please navigate to your forked copy of the `express-songs-api` project folder and checkout branch `11-add-joi-validation`

### Task List

- Install joi to your project with 

```
npm install joi
```
- Create a joi schema in routes/songs.js
- Use this schema to validate the data posted in 
  1. POST /songs/
  2. PUT /songs/:id

- If the data is invalid to return HTTP response 400 Bad Request to the client with this response to the client
```javascript
{ 
  message : error message returned joi
}
```

- Write the test for each route to prove that the route will really return 400 when you POST or PUT invalid data to it

- **Note** : the existing HTTP response 404 error messages for invalid id should still work as per normal.

- **Hint** : It is recommended to work on one route at a time, by first writing the test for it and then implementing the changes in the route handler. After that works you can move on to the second route.

- After the lab commit your code to `11-add-joi-validation` and checkout the solution branch

```terminal
git add --all
git commit -m "Added joi validation for songs POST and PUT"
git checkout 12-add-joi-validation-solution
```

- In the class we will go through the sample solution by comparing branch `12-add-joi-validation-solution` to branch `11-add-joi-validation`

## Resources

For more information on Joi, you can refer to the materials below:

- [Joi Validation https://github.com/hapijs/joi](https://github.com/hapijs/joi) 

