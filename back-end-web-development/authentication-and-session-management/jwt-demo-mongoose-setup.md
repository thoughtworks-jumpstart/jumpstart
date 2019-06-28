# JWT Demo: Mongoose Setup

Now let's add dependency on mongoose library and some helper file to make it easy to write test cases with MongoDB.

## Install NPM package

```text
npm install mongoose

npm install mongoose-unique-validator

npm install -D mongodb-memory-server

npm install -D mongoose-fixture-loader
```

[mongoose-unique-validator](https://www.npmjs.com/package/mongoose-unique-validator) helps us to specify that some fields in Mongoose schema should contain unique values.

[mongodb-memory-server](https://www.npmjs.com/package/mongodb-memory-server) spins up a actual/real MongoDB Server programmatically from node for testing. This package on first start downloads the latest MongoDB binaries and save it to ~/.mongodb-binaries folder. So first run may take a time. All further runs will fast, because use already downloaded binaries.

[mongoose-fixture-loader](https://www.npmjs.com/package/mongoose-fixture-loader) helps to create some test data to be used in test cases. We will see it in action in a minute.

## Create a helper module to start MongoDB in memory

We are going to write some test cases that require a in-memory MongoDB instance. That can be done using the `mongodb-memory-server` package, but there are still some codes required to start/stop the server. We can put those codes into a file to be shared by all test cases.

Create a new folder called `test_helper` in the project root folder.

Then create a new file named `in_memory_mongodb_setup.js` with the following content:

```javascript
/* eslint-disable no-console */

const MongodbMemoryServer = require("mongodb-memory-server").default;
const mongoose = require("mongoose");

mongoose.Promise = global.Promise;

// May require additional time for downloading MongoDB binaries
jasmine.DEFAULT_TIMEOUT_INTERVAL = 60000;

let mongoServer;

const setup = async () => {
  mongoServer = new MongodbMemoryServer();
  const mongoUri = await mongoServer.getConnectionString();

  const opts = { useNewUrlParser: true, useCreateIndex: true };
  await mongoose
    .connect(
      mongoUri,
      opts
    )
    .then(
      () => console.log("Mongo DB is ready."),
      error => console.error(error)
    );
};

const teardown = () => {
  mongoose.disconnect();
  mongoServer.stop();
};

module.exports = {
  setup,
  teardown
};
```

