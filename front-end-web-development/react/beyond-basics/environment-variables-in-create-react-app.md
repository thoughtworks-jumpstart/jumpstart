# How to manage the environment variables in a create-react-app

In a real project, you may have multiple "environments" to deploy your application, e.g.

- A "dev" environment, where you keep deploying your latest version of the codes
- A "qa" environment, where QA expert in your team can test the features in the app
- A "staging" environment, where some users can test your application and give you feedbacks
- A "production" environment, which is accessible by all users.

When your applications run under those different environment, they may need different configuration. For example, your React app may need to load data from a backend web API, and the URL of the backend API could vary from one environment to another. E.g. the React app running in the "dev" environment should call the corresponding URL of the backend API running in their own "dev" environment.

Because of these configurable information could change from one environment to another, we cannot hard-code those values in the codes. Instead, we need to put them into configuration files.

An NPM package called ["dotenv"](https://www.npmjs.com/package/dotenv) is developed for this purpose. Create-react-app has built-in support for this.

The README file of the create-react-app mentions [how to manage the environment variables in files like `.env`, `.env.local`, `.env.prod`.](https://github.com/facebook/create-react-app/blob/master/packages/react-scripts/template/README.md#adding-custom-environment-variables).

This [blog article](https://medium.com/@tacomanator/environments-with-create-react-app-7b645312c09d) also explains it pretty well.