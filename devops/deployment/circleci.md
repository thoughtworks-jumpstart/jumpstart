# CircleCI

## Part 1: Running tests before deployment

In this example, we are deploying to Heroku, but we're going run tests on CircleCI before deploying to Heroku.

**Pre-requisites**:

* a [CircleCI account](https://circleci.com/dashboard)
* a project/app with a `npm test` and `npm start` command
* the project should be committed to git and github on the master branch
* heroku cli tool. Check if it's installed: `heroku -v`

**Steps**:

* On [https://circleci.com/dashboard](https://circleci.com/dashboard), click on 'set up project' on the left bar, and search for your git repo \(you may need to refresh your page\), and click 'Set up project'
* follow the instructions on the 'Set Up Project' page
* \[Skip this step if you've already created your heroku app\] Create heroku app
  * heroku create 
  * \[Use this instead if you're deploying a `create-react-app` app\] heroku create --buildpack [https://github.com/mars/create-react-app-buildpack.git](https://github.com/mars/create-react-app-buildpack.git)
* Go to [https://dashboard.heroku.com/](https://dashboard.heroku.com/) to complete the Heroku-Github integration
  * Click on your project
  * Click on Deploy tab → Deployment method → select GitHub

    ![heroku\_1](../../.gitbook/assets/heroku_connect_github.png)

  * Search for the repo of the application that you’re deploying → click Connect

    ![heroku\_ci](../../.gitbook/assets/heroku_ci.png)
* Further below, click on ‘Wait for CI to pass before deploy’ and ‘Enable Automatic Deploy’
  * Lastly, add any database add-ons that you're using on heroku and add the necessary config vars \(if any\) on the heroku dashboard

## Part 2: 100% automation using `.circleci/config.yml` \(from `git push` to a heroku deployment\)

Now, you might have found the previous steps quite troublesome. Good news! Most CI tools \(including CircleCI\) allows us to configure the deployment via code \(in `.circleci/config.yml`\). To do this, do the following steps

1. Update config.yml to include \(i\) a deploy stage and \(ii\) a workflow \(you can copy the `config.yml` example below\)
2. \[Skip this step if you've already created a heroku app for this proejct\] Create heroku application: `heroku create`
3. If you look at the 'Deploy Master to Heroku' step, there are 2 environment variables. We need to define these in CircleCI, or else they will be undefined and the deployment will fail. To add environment variables on CircleCI:
   * Go to your projects page \([https://circleci.com/gh/YOUR\_USERNAME](https://circleci.com/gh/YOUR_USERNAME)\)
   * Go to project settings \(click on the gear icon next to the project name\)
   * Under Build Settings, click on **Environment Variables**
   * Click on **Add Variables**
     * HEROKU\_APP\_NAME : random-something-12345 \(replace with your heroku app name\)
     * HEROKU\_API\_KEY : 
       * To generate heroku api key, in your shell terminal, run `heroku auth:token`, and copy and paste the value here. \(alternatively, get it at the bottom of your heroku [account settings](https://dashboard.heroku.com/account)\)
4. Commit and push, and you'll see your app deployed automatically to Heroku, even if you 'Disable Automatic Deploy' on the heroku dashboard!

```yaml
# .circleci/config.yml
version: 2
jobs:
  build:
    docker:
      - image: circleci/node:10
    steps:
      - checkout
      - restore_cache: # special step to restore the dependency cache
          key: dependency-cache-{{ checksum "package.json" }}
      - run:
          name: Setup Dependencies
          command: npm install
      - save_cache: # special step to save the dependency cache
          key: dependency-cache-{{ checksum "package.json" }}
          paths:
            - ./node_modules
      - run: # run tests
          name: Run Test
          command: npm test
  deploy:
    docker:
      - image: buildpack-deps:trusty
    steps:
      - checkout
      - run:
          name: Deploy Master to Heroku
          command: git push https://heroku:$HEROKU_API_KEY@git.heroku.com/$HEROKU_APP_NAME.git master

workflows:
  version: 2
  build-and-deploy:
    jobs:
      - build
      - deploy:
          requires:
            - build
```

## Resources

* [CircleCI 2.0 docs](https://circleci.com/docs/2.0/)
* [CircleCI - some useful articles](https://circleci.com/docs/2.0/#further-resources-and-links)
* [https://circleci.com/blog/what-is-yaml-a-beginner-s-guide/](https://circleci.com/blog/what-is-yaml-a-beginner-s-guide/)

