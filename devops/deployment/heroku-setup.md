# Heroku: Setup

Before deploying the heroku, you will need 2 things:

1\) an application that \(i\) works locally when you run `npm start` and \(ii\) is committed and pushed to github.

2\) `heroku` installed on your commandline \(check by running `heroku -v`\). If it's not installed, install it using:

* mac: `brew install heroku`
* windows: click on one of the windows installers [here](https://devcenter.heroku.com/articles/heroku-cli#download-and-install)
  * Not sure if your Windows OS is 32-bit or 64-bit? Follow [these steps](https://www.techjunkie.com/check-windows-10-32-64-bit/) to find out
  * Note: you will have to restart `Git Bash` after the installation is completed
* linux:  `curl https://cli-assets.heroku.com/install.sh | sh`
  * If this fails because of permission errors, try running it again with the `sudo` prefix: `sudo curl https://cli-assets.heroku.com/install.sh | sh`
