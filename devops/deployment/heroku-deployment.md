# Deploy React apps to Heroku

## Create a new application on Heroku website

On [your application dashboard](https://dashboard.heroku.com/apps), click the "New" button on top right corner and select "Create new app".

## Configure the buildpack for the application

Under the "Settings" -&gt; "Buildpacks", add a buildpack for create-react-app with the following URL "[https://github.com/mars/create-react-app-buildpack.git](https://github.com/mars/create-react-app-buildpack.git)".

What is a "buildpack"? Check the explanation [here](https://devcenter.heroku.com/articles/buildpacks)

## Configure the environment variables used by your application

If you build your React application using create-react-app, you can put some of the environment variables into `.env` file. During build and deployment, these environment variables would be filled into the HTML/JavaScript files that refers to those variables. You can read the [create-react-app documentation](https://facebook.github.io/create-react-app/docs/adding-custom-environment-variables) for more details.

However, some environment variables \(e.g. the secret keys for calling those APIs\) cannot be put into the `.env` files \(because they are secret and should not be checked into code repository\), you should declare those variables in Heroku.

On Heroku dashbaord, you can set this under "Settings" -&gt; "Config Variables"

More documentation can be found [here](https://devcenter.heroku.com/articles/config-vars)

## Connect your Heroku app to the Github repository

* Click on Deploy tab → Deployment method → select GitHub
* Search for the repo of the application that you’re deploying → click Connect

  ![heroku\_connect\_github](../../.gitbook/assets/heroku_connect_github.png)

  * Further below, click on 'Enable Automatic Deploy'

  ![heroku\_no\_ci](../../.gitbook/assets/heroku_no_ci.png)

## Trigger a manual depoly

\(Only for the first time deploying this app\) click on “Deploy branch” at the end of the page

That's all! You can now visit the URL: [https://randomly-generated-app-name.herokuapp.com/](https://randomly-generated-name.herokuapp.com/).

Subsequently, with every push to GitHub, your code is **automatically deployed** and accessible by anyone with internet access. Awesome!

### Resources

* For deploying `create-react-app` apps
  * [https://blog.heroku.com/deploying-react-with-zero-configuration](https://blog.heroku.com/deploying-react-with-zero-configuration)
  * [`create-react-app-buildpack`](https://github.com/mars/create-react-app-buildpack) \(Browse the docs to understand what's going on and how you can add custom configuration\)
* For deploying other node.js apps \(e.g. server-side applications created with `express`\)
  * [https://devcenter.heroku.com/articles/getting-started-with-nodejs\#introduction](https://devcenter.heroku.com/articles/getting-started-with-nodejs#introduction)
  * [https://devcenter.heroku.com/articles/deploying-nodejs](https://devcenter.heroku.com/articles/deploying-nodejs)
  * [https://devcenter.heroku.com/articles/node-best-practices](https://devcenter.heroku.com/articles/node-best-practices)

