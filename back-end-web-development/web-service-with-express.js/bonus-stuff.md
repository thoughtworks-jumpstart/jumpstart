# Bonus stuff

## You can use express to build chatbots!

* [Facebook Messenger](https://messenger.fb.com/developers/resources/quickstart)
* [Telegram](https://core.telegram.org/api#getting-started)

## Express generator

There is npm package \(`express-generator`\) that can help us with the creation of an express app.

Here's are the steps for using it to create an express app

* Install express-generator: `npm install -g express-generator`
* Read about this program and how to use it on the commandline: `express --help`
* Create a directory for your express app and go into it: `mkdir my-express-app && cd $_`
* Generate express app!: `express --git -e`
  * Here's some explanation of the options
    * `--git`: this tells the `express` command line app to create a `.gitignore` file
    * `-e`: this tells `express` to add add ejs template engine support \(ejs stands for Embedded JavaScript and it's a views templating engine\)
* Install depdencies: `npm install`
* Start application: `nodemon bin/www`

`express` generates a file which is hard to read and potentially confusing if you are just getting started with express:

* `/bin/www`

  * This is nothing but a javascript file that calls the `app.listen()` method to start your function. If you don't like how confusing it looks, you can delete it and create a new file `./server.js` in your project root directory, with the following contents:

    \`\`\`javascript

    const app = require\("./app"\);

  const server = app.listen\(process.env.PORT \|\| 3000, function\(\) { console.log\(`Listening on port ${server.address().port}...`\); }\); \`\`\`

* Now, update `package.json` to use `"start": "node server.js"` instead
* Now you can implement your CRUD routes in `./routes`! \(feel free to delete any file that you don't need in your application. You can look at [this commit](https://github.com/thoughtworks-jumpstart/express-books-api/commit/550579b034ed03ebe2ed9af5e28447d01ed7b2d1) to see the changes\)

## Using Express + template engine to create CRUD app with views

In this course, we mainly teach you how to generate JSON responses and build REST APIs. Actually you can generate full HTML pages from the responses and build web applications. Checkout the resources below on examples:

* embedded javascript \(ejs\) \([docs 1](http://ejs.co/) and [docs 2](https://github.com/tj/ejs)\)
* [tutorial](https://scotch.io/tutorials/use-ejs-to-template-your-node-application)

## Frameworks Built on Top of Express

If you plan to build web service with Express, you can also consider to use some frameworks built on top of Express. They usually come with additional features for more complicated systems.

For example, [Kraken](http://krakenjs.com/) is a secure and scalable layer that extends express by providing structure and convention

## Alternatives to Express

Express is not the only web application framework built on top of NodeJS.

Other popular ones include:

* [Koa](https://koajs.com/)
* [HAPI](https://hapijs.com/)
* [Restify](http://restify.com/)
* [Loopback](https://loopback.io/)

