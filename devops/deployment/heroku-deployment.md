# Deploy a create-react-app to Heroku

## Create a new application on Heroku website

On [your application dashboard](https://dashboard.heroku.com/apps), click the "New" button on top right corner and select "Create new app".

## Configure the buildpack for the application

Under the "Settings" -> "Buildpacks", add a buildpack for create-react-app with the following URL "https://github.com/mars/create-react-app-buildpack.git".

What is a "buildpack"? Check the explanation [here](https://devcenter.heroku.com/articles/buildpacks)

## Connect your Heroku app to the Github repository

  * Click on Deploy tab → Deployment method → select GitHub
  * Search for the repo of the application that you’re deploying → click Connect

    ![heroku\_connect\_github](../../.gitbook/assets/heroku_connect_github.png)
* Further below, click on 'Enable Automatic Deploy'

  ![heroku\_no\_ci](../../.gitbook/assets/heroku_no_ci.png)

## Trigger a manual depoly

(Only for the first time deploying this app) click on “Deploy branch” at the end of the page

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

