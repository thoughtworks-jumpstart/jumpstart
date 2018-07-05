# CircleCI

**Pre-requisites**:

* a [CircleCI account](https://circleci.com/dashboard)
* a project/app with a `npm test` and `npm start` command
* the project should be committed to git and github on the master branch
* heroku cli tool. Check if it's installed: `heroku -v`

## Steps

Now, you might have found the previous steps quite troublesome. Good news! Most CI tools \(including CircleCI\) allows us to configure the deployment via code \(in `.circleci/config.yml`\). To do this, do the following steps

1. On [https://circleci.com/dashboard](https://circleci.com/dashboard), click on 'set up project' on the left bar, and search for your git repo \(you may need to refresh your page\), and click 'Set up project'
2. Create a directory named `.circleci` in your project and a file named `config.yml` in it. \(i.e. you should create this file in your project directory: `.circleci/config.yml`\)
3. Paste the the `config.yml` example below in your `config.yml` file
4. \[Skip this step if you've already created a heroku app for this proejct\] Create heroku application: `heroku create`
5. If you look at the 'Deploy Master to Heroku' step, there are 2 environment variables. We need to define these in CircleCI, or else they will be undefined and the deployment will fail. To add environment variables on CircleCI:
   * Go to your projects page \([https://circleci.com/gh/YOUR\_USERNAME](https://circleci.com/gh/YOUR_USERNAME)\)
   * Go to project settings \(click on the gear icon next to the project name\)
   * Under Build Settings, click on **Environment Variables**
   * Click on **Add Variables**
     * HEROKU\_APP\_NAME : random-something-12345 \(replace with your heroku app name\)
     * HEROKU\_API\_KEY : 
       * To generate heroku api key, in your shell terminal, run `heroku auth:token`, and copy and paste the value here. \(alternatively, get it at the bottom of your heroku [account settings](https://dashboard.heroku.com/account)\)
6. Commit and push, and you'll see your app deployed automatically to Heroku, even if you 'Disable Automatic Deploy' on the heroku dashboard!

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

