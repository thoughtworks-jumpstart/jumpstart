# CircleCI

**Pre-requisites**:

* a [CircleCI account](https://circleci.com/dashboard)
* a project/app with a `npm test` and `npm start` command
* the project should be committed to git and github on the master branch


## Steps

The below instructions are for the setup of a CI/CD pipeline with 3 environments

  - Automation
  - Test
  - Production

1. Create 3 Heroku applications. These are to represent the servers of the above 3 environments. You can use the below names so that they are easy to identify. 
  - auto-\<app name\>
  - test-\<app name\>
  - \<app name\>

2. If your app uses a mongodb database. Go to the resources tab **for each app** add a free MLab DB plugin. 

3. Create a directory named `.circleci` in your project and a file named `config.yml` in it. \(i.e. you should create this file in your project directory: `.circleci/config.yml`\)

4. Paste the the `config.yml` example below in your `config.yml` file. Commit and push to master.

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
  deploy-auto:
    docker:
      - image: buildpack-deps:trusty
    steps:
      - checkout
      - run:
          name: Deploy Master to Automation
          command: git push https://heroku:$HEROKU_API_KEY@git.heroku.com/$AUTO_HEROKU_APP_NAME.git master --force
  deploy-test:
    docker:
      - image: buildpack-deps:trusty
    steps:
      - checkout
      - run:
          name: Deploy Master to Test
          command: git push https://heroku:$HEROKU_API_KEY@git.heroku.com/$TEST_HEROKU_APP_NAME.git master --force
  deploy-prod:
    docker:
      - image: buildpack-deps:trusty
    steps:
      - checkout
      - run:
          name: Deploy Master to Prod
          command: git push https://heroku:$HEROKU_API_KEY@git.heroku.com/$PROD_HEROKU_APP_NAME.git master --force
workflows:
  version: 2
  build-and-deploy:
    jobs:
      - build
      - deploy-auto:
          requires:
            - build
      - hold-deploy-test:
          type: approval
          requires:
            - deploy-auto
      - deploy-test:
          requires:
            - hold-deploy-test
      - hold-deploy-prod:
          type: approval
          requires:
            - deploy-test
      - deploy-prod:
          requires:
            - hold-deploy-prod
```

5. On [https://circleci.com/dashboard](https://circleci.com/dashboard), click on 'set up project' on the left bar, and search for your git repo \(you may need to refresh your page\), and click 'Set up project > Click the Build button

6. Next go to settings > project > Gear icon > environment variables and add the below environments to circleCI. For the value add the coresponding heroku app name to the variable.

- AUTO_HEROKU_APP_NAME
- TEST_HEROKU_APP_NAME
- PROD_HEROKU_APP_NAME

7. Go to Heroku account, click on your profile image on the top right > Account settings. Scroll down and click Reveal to show the API Key. Next copy the key and head back to circle ci save this key as HEROKU_API_KEY env variable

8. Next click on Jobs menu on circle ci
Click on the first job and click on rerun workflow and wait. Refresh the page to check that it has completed deploy.

- blue = running
- green = success
- red = failure

9. The pipeline should show Build and Automation successful and you can now visit the automation server's page in the browser to check that it is deploped successfully.

10. Try visiting test app it is not yet deployed. Next go back and click the approve button. Deploy to Test will start after your approval. 

11. Laatly click on Approve for deploy to prod and check that your app is successfuly deployed. 

12. After this last stage has passed, you have successfully configured the CI/CD pipeline for your application. Congratulations!


## Resources

https://circleci.com/docs/2.0/configuration-reference
