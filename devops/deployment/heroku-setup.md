# Heroku CLI

Heroku supports a command line tool that allows you to control your deployment totally from commmand line. You can do everything from their website as well, but if you are a fan of command line, try it out.

## Installing Heroku CLI

Check if you already have it installed by running `heroku -v`\). If it's not installed, install it using:

* mac: `brew install heroku`
* windows: click on one of the windows installers [here](https://devcenter.heroku.com/articles/heroku-cli#download-and-install)
  * Not sure if your Windows OS is 32-bit or 64-bit? Follow [these steps](https://www.techjunkie.com/check-windows-10-32-64-bit/) to find out
  * Note: you will have to restart `Git Bash` after the installation is completed
* linux:  `curl https://cli-assets.heroku.com/install.sh | sh`
  * If this fails because of permission errors, try running it again with the `sudo` prefix: `sudo curl https://cli-assets.heroku.com/install.sh | sh`

## Usage

Read the [reference manual](https://devcenter.heroku.com/articles/heroku-cli-commands) on the tool.

### Useful `heroku` CLI commands

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
* Add mlab service into heroku project
  * `heroku addons:create mongolab:sandbox`
