# Deploy React Apps to Heroku

Assuming you have:

* a React app created with `create-react-app` that \(i\) works locally when you run `npm start` and \(ii\) is committed and pushed to github,
* `heroku` installed on your commandline \(check by running `heroku -v`. if not installed, install it using:
  * mac: `brew install heroku`
  * windows: click on one of the windows installers [here](https://devcenter.heroku.com/articles/heroku-cli#download-and-install)
    * Not sure if your Windows OS is 32-bit or 64-bit? Follow [these steps](https://www.techjunkie.com/check-windows-10-32-64-bit/) to find out
  * linux:  `curl https://cli-assets.heroku.com/install.sh | sh`
    * If this fails because of permission errors, try running it again with the `sudo` prefix: `sudo curl https://cli-assets.heroku.com/install.sh | sh`

 You simply need to run the following:

```bash
$ heroku create -b https://github.com/mars/create-react-app-buildpack.git

# verify heroku remote exists
$ git remote -v 

# if there is not remote by the name of heroku, run: 
git remote add heroku <your heroku.git url>

$ git push heroku master
```



That's all! You can now visit the URL that's displayed in your console: [https://some-random-name.herokuapp.com/](https://some-random-name.herokuapp.com/) \(do NOT click on the link that looks like this: [https://git.heroku.com/some-random-name.git](https://git.heroku.com/some-random-name.git) - this is the link to where heroku stores your source code, not your app.\)

## Resources

* [https://blog.heroku.com/deploying-react-with-zero-configuration](https://blog.heroku.com/deploying-react-with-zero-configuration)
* [`create-react-app-buildpack`](https://github.com/mars/create-react-app-buildpack) \(Browse the docs to understand what's going on and how you can add custom configuration\)

