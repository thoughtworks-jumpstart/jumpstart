# Create a User model

Before we create some REST API to sign up and login to the application, we need to create a user model first.

We will follow Test-Driven-Development approach, by writing the tests cases first. Each test case would specify what the User model needs to support, then we can implement the User model accordingly.

## Test case for creating a new User model

Create a new `model` folder under `src`.

Then create an empty file `user.js` in the `model` folder.

Then create a `user.test.js` file in the `model` folder.

For the first test case, we would test we can create a new user with name, email and save it to database.

The `user.test.js` should contain the test below:

```javascript
const test_mongodb = require("../../test_helper/in_memory_mongodb_setup");

beforeAll(test_mongodb.setup);
afterAll(test_mongodb.teardown);

const User = require("./user");

describe("User model", () => {
  const username = "kevin";
  const email = "kevin@example.com";

  let user = new User({ username, email });

  it("can be saved", async () => {
    await expect(user.save()).resolves.toBe(user);
  });
});
```

Note that we are using a instance of MongoDB in memory, so the models we create in this test case is saved into that database.

Now run the test with `npm run test:watch`, you will see the test case fails with the following error on console:

```txt
User model › encountered a declaration exception

    TypeError: User is not a constructor
```

To fix this problem, we need to declare the `User` model in `user.js`.

```javascript
// in user.js

const mongoose = require("mongoose");

const UserSchema = new mongoose.Schema({
  username: {
    type: String,
    index: true
  },
  email: {
    type: String,
    index: true
  }
});

module.exports = mongoose.model("User", UserSchema);
```

In the implementation, I decide to add index on both `username` and `email` field because I expect we are going to search users based on these two fields, so it would make search faster if we build database index on these two fields.

This model looks simple, but it comes with a lot of built-in feature from Mongoose. For example, now we can search users, update users and delete users.

To verify this, you can add the following test caess below your first test case:

```javascript
it("can be searched by _id", async () => {
  let searchResult = await User.findById(user._id);
  expect(searchResult.username).toEqual(username);
  expect(searchResult.email).toEqual(email);
});

it("can be searched by username", async () => {
  let searchResult = await User.findOne({ username });
  expect(searchResult.username).toEqual(username);
  expect(searchResult.email).toEqual(email);
});

it("can be searched by email", async () => {
  let searchResult = await User.findOne({ email });
  expect(searchResult.username).toEqual(username);
  expect(searchResult.email).toEqual(email);
});

it("can be updated", async () => {
  const newEmail = "kevin2@example.com";
  user.email = newEmail;
  await user.save();
  let searchResult = await User.findById(user._id);
  expect(searchResult.email).toEqual(newEmail);
});

it("can be deleted", async () => {
  await user.remove();
  let searchResult = await User.findById(user._id);
  expect(searchResult).toBeNull();
});
```

## Test cases for checking fields with unique values in the User model

Some of the fields in the model like `username` and `email` need to be unique in the whole database.

We can add some constraints in the schema to validate that.

Again, we can start with a test case.

Firstly, add a new require statement on top of the `user.test.js`.

```javascript
const ValidationError = require("mongoose").ValidationError;
```

Then add a new `describe` block with the first test case to check a user with same name cannot be added.

```javascript
describe("Unique fields in User model", () => {
  const username1 = "kevin";
  const email1 = "kevin@example.com";

  const username2 = "gordon";
  const email2 = "gordon@example.com";

  let user1 = new User({ username: username1, email: email1 });

  beforeEach(async () => await user1.save());

  it("should not allow two users with the same name", async () => {
    let userWithSameName = new User({ username: username1, email: email2 });
    await expect(userWithSameName.save()).rejects.toThrow(ValidationError);
  });
});
```

In the test case, we expect a `ValidationError` to be thrown when we try to save the second user with the same name. However, you would see this test case fails on the console, with the following error:

```txt
Expected received Promise to reject, instead it resolved to value
      {"__v": 0, "_id": "5bcb070ce1584e43cfd498f2", "email": "gordon@example.com", "username": "kevin"}
```

This is because we haven't specify the uniqueness constraint in the User schema yet.

Let's update the UserSchema in `user.js` with the following one:

```javascript
const UserSchema = new mongoose.Schema({
  username: {
    type: String,
    index: true,
    unique: true
  },
  email: {
    type: String,
    index: true
  }
});
```

We also need to add the `mongoose-unique-validator` as a plugin to the schema.

```javascript
const uniqueValidator = require("mongoose-unique-validator");

const UserSchema = new mongoose.Schema({
  username: {
    type: String,
    index: true,
    unique: true
  },
  email: {
    type: String,
    index: true
  }
});

UserSchema.plugin(uniqueValidator, { message: "should be unique" });
```

Now the test case should pass.

Similarly, we can add another test case to check the emails must be unique.

```javascript
it("should not allow two users with the email", async () => {
  let userWithSameEmail = new User({ username: username2, email: email1 });
  await expect(userWithSameEmail.save()).rejects.toThrow(ValidationError);
});
```

And we can make this test case pass by adding the `unique` constraint on the `email` field in the schema as well.

```javascript
const UserSchema = new mongoose.Schema({
  username: {
    type: String,
    index: true,
    unique: true
  },
  email: {
    type: String,
    index: true,
    unique: true
  }
});
```

### A different way to write assertion on errors

Before we move on, I would like to show you there is a different way to write the test cases. Instead of expecting the call to throw `ValidationError`, you could also specify the error messages you expect to be thrown with the error. For example:

```javascript
it("should not allow two users with the same name", async () => {
  let userWithSameName = new User({ username: username1, email: email2 });
  await expect(userWithSameName.save()).rejects.toThrow(
    "name: should be unique"
  );
});
```

When you try to save a user with duplicated user name, the `mongoose-unique-validator` throws an `ValidationError` with error message `name: should be unique`.

In this case, you could write a test case to expect the call throws `ValidationError`, you could also write the test case to specify the error message.

Both approaches are fine.

## Test cases for checking some fields are case-insensitive in the User model

We expect the values in `username` and `email` should be treated case insensitively. We can write some test cases first:

```javascript
describe("Some fields in User model are case insensitive", () => {
  const username1 = "joe";
  const email1 = "joe@example.com";

  const username2 = "jack";
  const email2 = "jack@example.com";

  let user1 = new User({ username: username1, email: email1 });

  beforeEach(async () => await user1.save());

  test("username is case insensitive", async () => {
    let userWithSameNameButDifferentCase = new User({
      username: username1.toUpperCase(),
      email: email2
    });
    await expect(userWithSameNameButDifferentCase.save()).rejects.toThrow(
      ValidationError
    );
  });

  test("email is case insensitive", async () => {
    let userWithSameEmailButDifferentCase = new User({
      username: username2,
      email: email1.toUpperCase()
    });
    await expect(userWithSameEmailButDifferentCase.save()).rejects.toThrow(
      ValidationError
    );
  });
});
```

And we can make these two test case pass by make sure the values are saved in lowercase in the database.

```javascript
const UserSchema = new mongoose.Schema({
  username: {
    type: String,
    index: true,
    lowercase: true,
    unique: true
  },
  email: {
    type: String,
    index: true,
    lowercase: true,
    unique: true
  }
});
```

## Test cases to check some fields are mandatory when creating a new User model

We would require a user to always provide their name and email. So we need to make sure this constraint is declared in the schema as well.

Firstly, let's add the test cases:

```javascript
describe("Some of the fields in User model are required", () => {
  const username1 = "peter";
  const email1 = "peter@example.com";

  test("username is required", async () => {
    let userWithoutName = new User({
      email: email1
    });
    await expect(userWithoutName.save()).rejects.toThrow(ValidationError);
  });

  test("email is required", async () => {
    let userWithoutEmail = new User({
      username: username1
    });
    await expect(userWithoutEmail.save()).rejects.toThrow(ValidationError);
  });
});
```

In the test cases, we expect a `ValidationError` to be thrown when we try to save a user without username or email.

To make these tests pass, we just need to declare the fields as `required` in the schema:

```javascript
const UserSchema = new mongoose.Schema({
  username: {
    type: String,
    index: true,
    lowercase: true,
    required: [true, "cannot be blank"],
    unique: true
  },
  email: {
    type: String,
    index: true,
    lowercase: true,
    required: [true, "cannot be blank"],
    unique: true
  }
});
```

## Test cases for setting user password

Now, we also want to save a password for each user. This is a bit tricky, since we should not store a user's password in plain text in database. Instead, we need to store the hashed passwords. To make it secure, we also use some kind of [salt](<https://en.wikipedia.org/wiki/Salt_(cryptography)>) to make the hash value safer.

Firstly, let's write the test case:

```javascript
describe("Setting and validation of password field on User model", () => {
  const username = "kate";
  const email = "kate@example.com";
  const password = "mypassword";

  let user = new User({ username, email });

  beforeAll(async () => {
    await user.save();
  });

  it("should save user passwords into hash and salt fields of User model", () => {
    expect(user.passwordSalt).toBeUndefined();
    expect(user.passwordHash).toBeUndefined();

    user.setPassword(password);

    expect(user.passwordSalt).toBeDefined();
    expect(user.passwordSalt).not.toBeNull();
    expect(user.passwordHash).toBeDefined();
    expect(user.passwordHash).not.toBeNull();
  });
});
```

The test case would fail because we haven't declared the `setPassword` function on the User model yet.

We can update the `user.js` accordingly.

We need to require a new library in `user.js`:

```javascript
const crypto = require("crypto");
```

This new library is used in the `setPassword` function:

```javascript
UserSchema.methods.setPassword = function(password) {
  this.passwordSalt = generateSalt();
  this.passwordHash = hashPassword(password, this.passwordSalt);
};

function generateSalt() {
  return crypto.randomBytes(16).toString("hex");
}

function hashPassword(password, salt) {
  return crypto
    .pbkdf2Sync(password, salt, 10000, 512, "sha512")
    .toString("hex");
}
```

We should also update the UserSchema by saving these two new fields `passwordHash` and `passwordSalt`
in the schema:

```javascript
const UserSchema = new mongoose.Schema({
  username: {
    type: String,
    index: true,
    lowercase: true,
    required: [true, "cannot be blank"],
    unique: true
  },
  email: {
    type: String,
    index: true,
    lowercase: true,
    required: [true, "cannot be blank"],
    unique: true
  },
  passwordHash: String,
  passwordSalt: String
});
```

For the next step, we also need a function to verify passwords. That would be used when a user tries to login to our system. We will get a plain text password from the user, and we can compute the hash value to check if it matches the password hash saved in our database.

Here is the test case for this case:

```javascript
it("should be able to verify user password afterwards", () => {
  expect(user.validPassword(password)).toBeTruthy();
});
```

We can make this test case pass by adding the `verifyPassword` in the `user.js`:

```javascript
UserSchema.methods.validPassword = function(password) {
  return this.passwordHash === hashPassword(password, this.passwordSalt);
};
```

## Test cases for creating JWT tokens

When a user login successfully, we need to generate a JWT token with the details of the user. In this case, it makes sense to put the JWT generation function inside the User model as well.

Let's create the test case first:

```javascript
describe("JWT tokens", () => {
  const username = "jeff";
  const email = "jeff@example.com";

  let user = new User({ username, email });

  beforeEach(async () => {
    await user.save();
  });
  test("JWT tokens can be generated and verified", () => {
    const token = user.generateJWT();
    expect(user.verifyJWT(token)).toBeTruthy();
  });

  test("invalid JWT tokens cannot be verified", () => {
    expect(user.verifyJWT("invalid token")).toBeFalsy();
  });
});
```

To make this test pass, there are quite a few steps.

### Install required NPM packages

Firstly, we need to install the `jsonwebtoken` package so that we can sign and verify JWT tokens.

```shell
npm install jsonwebtoken
```

### Set secret in .env file

Then we also need a secret to sign JWT tokens. This secret needs to be configured in environment variable. For this project, we have configured it to use `dotenv`, which can load environment variables from a `.env` file in your project root directory.

Create this `.env` file if it does not exist yet, and put one line into it:

```env
JWT_SIGNING_SECRET=asfas2qwr
```

### Load the JWT secret from the .env file

Since this is a configuration of the application, we should put the logic into the `config` folder.

Create the `config` folder under your project root directory.

Then create a `jwt.js` file inside the `config` folder, with the following content.

```javascript
require("dotenv").config();

function getJWTSingingSecret() {
  const secret = process.env.JWT_SIGNING_SECRET;
  if (!secret) {
    throw new Error("Missing secrets to sign JWT token");
  }
  return secret;
}

module.exports = {
  secret: getJWTSingingSecret()
};
```

### Update user.js with functions to sign and verify JWT tokens

Add the two lines below at the top of `user.js`

```javascript
const jwt = require("jsonwebtoken");
const { secret } = require("../../config/jwt");
```

Then add the following functions:

```javascript
UserSchema.methods.generateJWT = function() {
  const today = new Date();
  const exp = new Date(today);
  exp.setDate(today.getDate() + 60);

  return jwt.sign(
    {
      userid: this._id,
      username: this.username,
      exp: parseInt(exp.getTime() / 1000)
    },
    secret
  );
};

UserSchema.methods.verifyJWT = function(token) {
  try {
    jwt.verify(token, secret);
    return true;
  } catch (err) {
    return false;
  }
};
```

### More on the `exp` field in the JWT payload

In the example above, the expiration date of the JWT token is set to 60 days later after it's generated. Then the expiration time is saved into the `exp` field of the JWT token.

What is this `exp` field? Why must I use this term?

It represents `Token Expiration`, and you can find [more details here](https://www.npmjs.com/package/jsonwebtoken#token-expiration-exp-claim)

Once this field is set in a token, it's validated later on when we call the `jwt.verify(token, secret)`. So a token that passes the expiration time will fail the verification.

## Exercises

Can you think of more test cases for the model? How to support new constraints on the User model, e.g.

- each user name must be at least 8 characters?
- a user name must be one word (i.e. no white spaces allowed in between)?
- the email address is valid (i.e. it must be in name@domain.com format)
