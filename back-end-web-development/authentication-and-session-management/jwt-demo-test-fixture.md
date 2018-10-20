# Test Fixtures

Before we write more test cases, we need to introduce the concept of Test Fixture.

A **test fixture** is a fixed state of a set of objects used as a baseline for running tests. The purpose of a test fixture is to ensure that there is a well known and fixed environment in which tests are run so that results are repeatable. Examples of fixtures:

- Preparation of input data and setup/creation of fake or mock objects
- Loading a database with a specific, known set of data
- Copying a specific known set of files creating a test fixture will create a set of objects initialized to certain states.

## Creating dummy users

For the remaining integration tests, we need some test user to exist in our test database, before we run those test cases. These test users are **test fixtures**.

Since we use MongoDB in this project, we use a library [mongoose-fixture-loader](https://www.npmjs.com/package/mongoose-fixture-loader) to help saving some test users into the database.

In the `test_helper` folder, create a new file called `fixtures.js`, with the following content:

```javascript
const loadFixture = require("mongoose-fixture-loader");
const User = require("../src/model/user");

const fixtures = {};

function getNewUser(username, email, password) {
  const user = new User({
    username,
    email
  });
  user.setPassword(password);

  return user;
}

async function createNewUser(userName) {
  const password = "mypassword";
  const user = await loadFixture(
    User,
    getNewUser(userName, `${userName}@example.com`, password)
  );
  // store the plaintext password for the test cases to simulate login
  // this is not stored in database
  user.password = password;
  return user;
}

async function loadFixtures() {
  fixtures.users = {};
  const userNames = ["tom", "jacky"];
  for (let userName of userNames) {
    let user = await createNewUser(userName);
    fixtures.users[userName] = user;
  }
}

module.exports = {
  fixtures,
  load: loadFixtures
};
```

This helper exports a `load` function. When the `load` function is called, it creates two users (with name `tom` and `jacky`) and save them into the MongoDB database (which is the same one used by our test cases).

It also exports the `fixtures`, which contains the test users created.

We will see how these fixtures are used in the integration test for login.