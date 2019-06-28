# Deploy React apps to Now

If you build a React app using `create-react-app`, you can deploy it to a few places

* [github pages](https://pages.github.com/)
* [surge](http://surge.sh/)
* [now](https://zeit.co/now)

There are many other platforms for deploying your applications. For React apps, the create-react-app README page has a great [write-up](https://github.com/facebook/create-react-app/blob/master/packages/react-scripts/template/README.md#deployment) on other ways to deploy your react applications.

## Now

If you are building a web application using create-react-app, you need to `build` the application first before you can deploy it to `now`.

There are two ways.

### Build the application by yourself

In your project root directory \(created by create-react-app\):

Run the following commands:

```text
npm run build
cd build
now
```

On the console, you will see the URL where your website is deployed to.

### Build the application on now's platform

For this approach, you need to provide a configuration file called `now.json` which tells `now` how to build your application.

The detailed steps can be found [here](https://zeit.co/docs/examples/create-react-app)

### Configuring environment variables on Now

If you cannot put the environment variables into `.env` file for some reason, you can also set it via Now.

Check out their [documentation](https://zeit.co/docs/getting-started/environment-variables).

If the environment variable is a secret, you should also be careful and don't check it into your public code repository.

Here is how you can [manage secrets on the Now platform](https://zeit.co/docs/getting-started/secrets)

## GitHub Pages

You can follow instructions [here](https://github.com/facebook/create-react-app/blob/master/packages/react-scripts/template/README.md#github-pages)

