# Deploy React apps + backend API

Now you are able to build applications with both frontend and backend.

For example, you build an online book store. The frontend is a React application, and the backend is a REST API built with Express and MongoDB.

For such an application with both web frontend and backend, how can you deploy them?

There are two choices:

* You can develop/build/deploy the frontend and backend as separate projects
* You can develop/build/deploy the frontend and backend in the same project

## Treat frontend and backend as separate projects

With this choice, you can create two separate projects:

* A project for frontend React app
* A project for the backend API

You can keep them in separate GitHub repositories, and you can deploy them into separate applications into the cloud platform \(like Heroku\).

### Configure backend API URL in environment variables

The tricky thing is to configure the React app with the URL of backend API \(because your React app needs to perform the CRUD operations with your backend API, and it needs to know the URL\).

This is tricky because the backend API URL is different in different **environments**:

* During **development**, when you run both the frontend and backend on your local computer, the URL of your backend application could be "[http://localhost:3001](http://localhost:3001)".
* In **production** environment \(e.g. when you deploy your application to Heroku\), the URL of your backend application could be "[http://my-backend-api.heroku.com](http://my-backend-api.heroku.com)".

How to configure the frontend React application with the corresponding URL for the backend API, in each environment?

You need to use libraries like [dotenv](https://www.npmjs.com/package/dotenv) so that you can specify environment-specific variables.

If you use `create-react-app`, this is already built-in.

Here is what you need to do:

* Create a `.env.development` file under the root directory of React project, which contains the following entry:

```text
REACT_APP_BACKEND_API_URL=http://localhost:3001
```

* Create a `.env.production` file under the root directory of React project, which contains the following entry:

```text
REACT_APP_BACKEND_API_URL=https://my-backend-api.heroku.com
```

You need to check in these two files into your code repository.

With these two files, when you run your React application on your local computer with `npm run start`, the environment variables defined in `.env.development` would be used. When you deploy your React application into Heroku, the environment variables defined in `.env.production` would be used.

A demo project can be found [here](https://github.com/songguoqiang/react-environment-variable-demo).

You can start it locally and see what shows on your browser UI

```text
git clone https://github.com/songguoqiang/react-environment-variable-demo.git
cd react-environment-variable-demo
npm install
npm run start
```

The demo application is deployed to Heroku, you can visit it [here](https://react-app-env-demo.herokuapp.com/).

Checkout what's shown on your browser and compare it with the content when you run the app locally. You can see the backend URL is different.

### Enable CORS support in your backend API

If you deploy your frontend and backend as two separate applications on Heroku, you also need to enable CORS \(Cross Origin Resource Sharing\) between the two applications.

For example, assume your frontend and backend are deployed to the following two URLs:

* [https://my-backend-api.heroku.com](https://my-backend-api.heroku.com)
* [https://my-react-app.heroku.com](https://my-react-app.heroku.com)

Your users would visit "[https://my-react-app.heroku.com](https://my-react-app.heroku.com)" to download the frontend React app into their browser, and then the JavaScript in your React app needs to make calls to your backend API, which is "[https://my-backend-api.heroku.com](https://my-backend-api.heroku.com)". This is **NOT** allowed by the browsers by default, due to Same Origin Policy.

The walk around is to enable CORS in your backend API.

If you build the API using Express, you can configure the Express CORS middleware to allow the API to be called by another React application loaded from Heorku.

For example, here is a sample code for `app.js` in Express:

```javascript
const express = require("express");
const cors = require("cors");

var corsOptions = {
  origin: [/http:\/\/localhost:.*/, /http[s]*:\/\/.*\.herokuapp.com/],
  credentials: true
};

const app = express();
app.use(cors(corsOptions));
```

### `fetch` API in the frontend project

The frontend application needs to use the **full backend API URL** in the calls to `fetch` API as well.

For example, `fetch` request with full URL \(as loaded from environment variable\):

```javascript
fetch(process.env.REACT_APP_BACKEND_API_URL + "/api/users/login", {
    method: "post",
    headers: { "Content-Type": "application/json" },
    mode: "cors",
    credentials: "include",
    body: JSON.stringify({
      user: {
        email: email,
        password: password
      }
    })
```

Note that, besides using full URLs in the request, you also need to enable CORS with the two options for the `fetch`:

```javascript
    mode: "cors",
    credentials: "include",
```

## Keep frontend and backend in the same project

Another choice is to keep your frontend and backend in the same project.

The idea is discussed in [this tutorial](https://originmaster.com/running-create-react-app-and-express-crae-on-heroku-c39a39fe7851).

You can follow [this tutorial](https://medium.com/crowdbotics/deploy-a-mern-stack-app-on-heroku-b0c255744a70) step-by-step to deploy a frontend \(in React\) and backend \(in Express and MongoDB\) as one project.

We also created a [sample demo application](https://github.com/songguoqiang/react-express-mongodb-starter/tree/react-context) with this idea.

You can get the sample application via

```text
git clone https://github.com/songguoqiang/react-express-mongodb-starter.git
cd react-express-mongodb-starter
git checkout -b react-context origin/react-context
```

Follow the README file to setup your local development environment.

### What's in "client" and "server" folder?

The "client" folder contains a project generated by `create-react-app`.

The "server" folder contains a project built with Express and Mongoose.

Both "client" and "server" have its own "package.json", which describes how to build/run them individually.

There is also a "package.json" file in the root directory of the project, which allows you to build/run/deploy both the fronend and backend in one go.

### `fetch` API in the frontend sub-project

If you look at the codes in frontend application, you can see the `fetch` API is call like the way below:

```javascript
fetch("/api/users/login", {
    method: "post",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      user: {
        email: email,
        password: password
      }
    })
```

Note that there is no hostname included in the URL. In this case, the HTTP request is sent back to the same host where the JavaScript is downloaded.

To make this work, when you run them locally, you need to configure the `webpack-dev-server` as a proxy for the Express application; when you run the application on Heroku, you need to build the frontend React application, and serve it using the same server that hosts the Express application.

### Running frontend and backend locally

When you run the frontend and backend locally on your computer, you need to run them as separate process:

To run frontend React application

```text
cd client
npm run start
```

This will start a [webpack-dev-server](https://survivejs.com/webpack/developing/webpack-dev-server/) which hosts your React application on port 3000. \(This port 3000 should be specified in the `FRONTEND_PORT` variable in your .env file.\)

To run the backend application

```text
cd server
npm run dev
```

This will start a Express application, listening on port 3001. \(This port 3001 should be specified in the `PORT` variable in your .env file\).

You can visit the URL for frontend React application at \`[http://localhost:3000](http://localhost:3000)".

#### Configure webpack-dev-server as a proxy for Express server

When you interact with the React application in browser, it may need to call the backend API.

In this setup, there is a special "proxy" configuration in the `webpack-dev-server` which allows it to forward the requests to the backend API.

This proxy configuration can be found in the "package.json" in the "client" directory:

```javascript
...
"proxy": "http://localhost:3001",
...
```

This configuration tells the `webpack-dev-server` to forward the requests to the given proxy-ed URL whenever it receives some requests \(from browsers\) that it does not know how to handle.

With this proxy setup, when the React app \(running in browser\) tries to make the following API call, like

```javascript
fetch("/api/users/login", {
    method: "post",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      user: {
        email: email,
        password: password
      }
    })
```

This will result in a POST HTTP request sent from browser to "[http://localhost:3000/api/users/login](http://localhost:3000/api/users/login)".

Since the `webpack-dev-server` does not know how to handle this request, it forwards the request to the proxy URL configured, so the request is translated to "[http://localhost:3001/api/users/login](http://localhost:3001/api/users/login)".

The Express application listening on port 3001 knows how to handle this requests. The response from the Express server is sent to the `webpack-dev-server` and then forwarded back to the browser.

In this case, the `webpack-dev-server` acts as a **proxy** in between the React app \(running in browser\) and the Express app.

### Deploying frontend and backend as one application on Heroku

When you deploy the application into Heorku, you can deploy them as one application, that hosts both the frontend application and the Express application.

The trick is to let Heroku to perform an additional step which builds the React application, and put the output into a "build" folder. Then the Express application can serve those HTML/JavaScript/CSS files as static files.

#### The build configuration for Heroku

In the `package.json` file of the project root directory, you can find two lines under "scripts" section:

```javascript
"build": "concurrently \"cd client && yarn build\"",
"heroku-postbuild": "yarn build",
```

This tells Heroku to call the "build" script when you deploy the application. The "build" script basically call the "build" command in the "client" project, which is to build the React application. \(If you don't use `yarn`, you can replace `yarn build` with `npm run build`\)

When this "build" script is called, the output of building the React app is saved in the "client/build" folder.

#### Configure Express application to serve the build files of React app

Now, we need to configure Express application to serve the React application's HTML/JavaScript/CSS files in the "client/build" directory.

In the "server/app.js" file, you can find the following lines:

```javascript
const staticFiles = express.static(path.join(__dirname, "../client/build"));

if (isProduction) {
  app.use(staticFiles);
}
```

With this configuration, the application that we deploy to Heorku can serve both the React app, and the APIs built with Express.

