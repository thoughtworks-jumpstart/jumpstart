#### Running tests before deployment (using TravisCI)

In this example, we are deploying to Heroku, but we're going run tests on TravisCI before deploying to Heroku. 

**Pre-requisites**:
- a [travisCI account](http://www.travis-ci.org/)
- a react app that's committed to git and github on the master branch
- heroku cli tool. Check if it's installed: `heroku -v` (if not, install it with: `brew install heroku`)

**Steps**:

- On www.travis-ci.org, sign in, go to your profile page and enable the repository you want to build
  <img src="../../../../images/enable_travisci.png">
- Launch a terminal and change current directory to home directory of your project
- [If you haven't deployed your app to Heroku yet] Create heroku app using create-react-app buildpack: `heroku create -b https://github.com/mars/create-react-app-buildpack.git`
- create an empty `.travis.yml` file in your project directory: `touch .travis.yml`
- add the following configuration to `.travis.yml`:

```yml
language: node_js
node_js:
  - "9"
cache:
  directories:
  - node_modules
script:
  - yarn test
  - yarn build
deploy:
  provider: heroku
  app: swift-waters-95000 # replace this with the name of your heroku app
  on:
    repo: davified/temp_heroku_travis   # replace this with your_github_username/your_repo
```

- Generate secure api_key in `.travis.yml`: `travis encrypt $(heroku auth:token) --add deploy.api_key`
- `git add .travis.yml`, `git commit` and `git push` 

#### Recommended reading
- [Understanding the .travis.yml file](https://docs.travis-ci.com/user/customizing-the-build/)

#### Resources
- [Demo app on TravisCI](https://github.com/davified/temp_heroku_travis)
- [TravisCI and Heroku](https://github.com/verekia/js-stack-from-scratch/blob/master/tutorial/09-travis-coveralls-heroku.md#readme)
- [Running cypress e2e tests on TravisCI](https://docs.cypress.io/guides/guides/continuous-integration.html)
- [Adding multiple stages on TravisCI](https://docs.travis-ci.com/user/build-stages/deploy-heroku/)