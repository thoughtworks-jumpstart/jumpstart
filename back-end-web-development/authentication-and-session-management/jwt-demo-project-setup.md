# Project Setup

## Steps

Fork and clone the project at [https://github.com/thoughtworks-jumpstart/express-jwt-authentication-demo](https://github.com/thoughtworks-jumpstart/express-jwt-authentication-demo)

Then run `npm install` in the project root directory.

Create a new branch so that you can try this tutorial from scratch multiple times.

```shell
git checkout -b code_along
```

## Configuration

### Middlewares

The following middlewares are used. Read their home page to understand what they do.

- [bodyParser](https://www.npmjs.com/package/body-parser)
- [cors](https://www.npmjs.com/package/cors)
- [errorhandler](https://www.npmjs.com/package/errorhandler)
- [http-status](https://www.npmjs.com/package/http-status)
- [morgan](https://www.npmjs.com/package/morgan)
- [winston](https://www.npmjs.com/package/winston)

### Environment Variables

[dotenv](https://www.npmjs.com/package/dotenv) is used to load environment variables from a file.

You can put a `.env` file in your project root directory to define environment variables when you run the application on your developer environment.

This `.env` is ignored by the `.gitignore` file, so it won't be checked into code repository.

### ESLint + Prettier

This project is configured to format your codes with [ESLint](https://eslint.org/) and [Prettier](https://github.com/prettier/prettier).

If you are using VS Code, you need to install the following plugins:

- [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
- [VSCode ESLint extension](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)

### VSCode Debugger

This project comes with pre-configured VSCode debugger. You can debug your Express application, or the tests written in Jest.
