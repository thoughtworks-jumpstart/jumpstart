# Code test coverage

You can see your code coverage locally by running `yarn test -- --coverage`

However, when we work in a team, we may want to see the code coverage on a web UI. In this section, we will learn how to add code test coverage in our Travis CI pipeline.

**Steps**
- Update your `.travis.yml` file as such

```yaml
language: node_js
node_js:
- '9'
cache:
  directories:
  - node_modules
install:                            # install codecov
  - yarn add global codecov         # install codecov
jobs:
  include:
    - stage: unit_tests
      script: yarn test -- --coverage --coverageDirectory=./coverage/     
      # add the `--coverage` and `--coverageDirectory` options to the `yarn test` command

    - stage: publish coverage
      script: codecov
      # run the `codecov` command to publish coverage to https://codecov.io

    - stage: build
      script: yarn build
    - stage: deploy
      script: skip
      deploy:
        # add the usual deploy config
```

### Resources:
- https://blog.ashwinchat.com/continuous-integration-code-coverage-and-unit-testing/