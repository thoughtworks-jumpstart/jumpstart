# Deploy React Apps to Heroku

### Pre-requisites:

* a React app created with `create-react-app` that \(i\) works locally when you run `npm start` and \(ii\) is committed and pushed to github,
* `heroku` installed on your commandline \(check by running `heroku -v`. if not installed, install it using:
  * mac: `brew install heroku`
  * windows: click on one of the windows installers [here](https://devcenter.heroku.com/articles/heroku-cli#download-and-install)
    * Not sure if your Windows OS is 32-bit or 64-bit? Follow [these steps](https://www.techjunkie.com/check-windows-10-32-64-bit/) to find out
  * linux:  `curl https://cli-assets.heroku.com/install.sh | sh`
    * If this fails because of permission errors, try running it again with the `sudo` prefix: `sudo curl https://cli-assets.heroku.com/install.sh | sh`

### Steps for deployment

* create a heroku application from the command line

  ```bash
  $ heroku create --buildpack https://github.com/mars/create-react-app-buildpack.git
  ```

* Go to [https://dashboard.heroku.com/](https://dashboard.heroku.com/) to complete the Heroku-Github integration
* Click on the project you created in the first step
* Click on Deploy tab → Deployment method → select GitHub

  ![heroku\_1](../../../.gitbook/assets/heroku_1%20%281%29.png)

* Search for the repo of the application that you’re deploying → click Connect

  ![heroku\_2](../../../.gitbook/assets/heroku_2.png)

* Further below, click on 'Enable Automatic Deploy'
* \[Only for the first time deploying this app\], click on “Deploy branch” at the end of the page

That's all! You can now visit the URL that's displayed in your console: [https://randomly-generated-name.herokuapp.com/](https://randomly-generated-name.herokuapp.com/). With every push to GitHub, your code is **automatically deployed** and accessible by anyone with internet access. Awesome!

## Resources

* [https://blog.heroku.com/deploying-react-with-zero-configuration](https://blog.heroku.com/deploying-react-with-zero-configuration)
* [`create-react-app-buildpack`](https://github.com/mars/create-react-app-buildpack) \(Browse the docs to understand what's going on and how you can add custom configuration\)

