# Add database connection

There is one last-piece we need to add into the `app.js` file.

So far, when we run our test cases, the database connection is handled by the `setup` and `teardown` function in the `in_memory_mongodb_setup.js` file. The helper functions start a MongoDB for testing and manages connections for our test cases.

Which database should our application use in production environment?

## Specifying the database connection URL in environment

Since the database connection URL could change in different deployment environment (QA/Staging/Production), we shouldn't hard-code the database connection URL in our code. Instead, we should define that connection URL in an environment variable like "MONGODB_URI".

When you deploy the application on platforms like Heroku, you should read their documentation and figure out how to specify this environment variable.

When you run the application locally on your computer, you can put this environment variable in your `.env` file, and specify the MongoDB you can use for your local application instance.

## Make database connection in app.js

In `app.js`, we need to add the following lines:

```javascript

const mongoose = require("mongoose");

const isMongooseConnectionProvided = process.env.NODE_ENV === "integration";

if (!isMongooseConnectionProvided) {
  mongoose.connect(process.env.MONGODB_URI);
}
```

In our integration tests, we have one line in each test file, like 

```javascript
process.env.NODE_ENV = "integration"
```

So when the integration test runs, the NODE_ENV is set to `integration`, and the codes in `app.js` will not try to establish its own database connection (because the database connection for integration tests is already handled by that `in_memory_mongodb_setup.js`).

In other environment, the code above assumes the database connection URL is provided in the environment variable `MONGODB_URL`.

After making this change in `app.js`, you can add the variable in the `.env`.

For example, if you have a local MongoDB installed on your computer, you can set the variable as

```env
MONGODB_URL=mongodb://localhost/jwt_demo
```

Then you can run `npm run start` to start the server locally.

And you can test the APIs work by using tools like Insomia.