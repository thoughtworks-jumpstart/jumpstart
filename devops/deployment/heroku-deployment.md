# Heroku: Deployment

## Deployment to Heroku

To deploy your app to heroku, run the following steps:

* create a heroku application from the command line

```text
# run this command if you're deploying create-react-app app
heroku create --buildpack https://github.com/mars/create-react-app-buildpack.git

# run this command if you're deploying any other app
heroku create
```

* Go to [https://dashboard.heroku.com/](https://dashboard.heroku.com/) to complete the Heroku-Github integration
  * Click on the project you created in the first step
  * Click on Deploy tab → Deployment method → select GitHub
  * Search for the repo of the application that you’re deploying → click Connect

    ![heroku\_connect\_github](../../.gitbook/assets/heroku_connect_github.png)
* Further below, click on 'Enable Automatic Deploy'

  ![heroku\_no\_ci](../../.gitbook/assets/heroku_no_ci.png)

* \[Only for the first time deploying this app\] click on “Deploy branch” at the end of the page

That's all! You can now visit the URL: [https://randomly-generated-app-name.herokuapp.com/](https://randomly-generated-name.herokuapp.com/).

With every push to GitHub, your code is **automatically deployed** and accessible by anyone with internet access. Awesome!

### Other useful `heroku` CLI commands

* Open app in browser:
  * From your project directory, run `heroku open`
* Rename your app:
  * `heroku apps:rename newname --app oldname`
* View logs
  * view last 42 lines of logs: `heroku logs -n 42`\(you can replace 42 with any number\)
  * view logs live: `heroku logs --tail`
* View app locally before deploying
  * `heroku local web`
* General help
  * `heroku --help`

### Resources

* For deploying `create-react-app` apps
  * [https://blog.heroku.com/deploying-react-with-zero-configuration](https://blog.heroku.com/deploying-react-with-zero-configuration)
  * [`create-react-app-buildpack`](https://github.com/mars/create-react-app-buildpack) \(Browse the docs to understand what's going on and how you can add custom configuration\)
* For deploying other node.js apps \(e.g. server-side applications created with `express`\)
  * [https://devcenter.heroku.com/articles/getting-started-with-nodejs\#introduction](https://devcenter.heroku.com/articles/getting-started-with-nodejs#introduction)
  * [https://devcenter.heroku.com/articles/deploying-nodejs](https://devcenter.heroku.com/articles/deploying-nodejs)
  * [https://devcenter.heroku.com/articles/node-best-practices](https://devcenter.heroku.com/articles/node-best-practices)

