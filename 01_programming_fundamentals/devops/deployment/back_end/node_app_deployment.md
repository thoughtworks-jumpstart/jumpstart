# Deploy Node.JS Applications to Heroku

## Deploying Node.js application to Heroku

From the official website:
> Heroku is a cloud platform that lets companies build, deliver, monitor and scale apps — we're the fastest way to go from idea to URL, bypassing all those infrastructure headaches.

Follow the steps in [this tutorial](https://devcenter.heroku.com/articles/getting-started-with-nodejs) to get familar with features in Heroku.

## Sample Deployment Steps

https://github.com/mongolab/hello-mongoose/blob/master/README.md#deployment

## Configuration Management

You can use environment variables to configure your Node application. That makes it easy to use different configurations in different environments, such as the developer’s local machine, a testing server, a staging server, and production servers.

“how do I load the .env settings into environment variables that the app can use?”

For that, try dotenv for Node:

https://github.com/motdotla/dotenv

- https://devcenter.heroku.com/articles/config-vars
- https://medium.com/node-and-beyond/environment-dependent-node-js-configuration-b51149286e7e
- https://www.twilio.com/blog/2017/08/working-with-environment-variables-in-node-js.html
- http://codingsans.com/blog/node-config-best-practices

#### Secret Management

- http://pmuellr.blogspot.sg/2014/09/keeping-secrets-secret.html

## Tools
https://github.com/yyx990803/pod

using pm2
https://www.howtoforge.com/tutorial/how-to-deploy-nodejs-applications-with-pm2-and-nginx-on-ubuntu/

## Deployment Pipeline Setup

- CI/CD

concept: https://blog.risingstack.com/continuous-deployment-of-node-js-applications/

http://codeship.com/
travis-ci
circle-ci
https://semaphoreci.com/

- code quality tools

https://coveralls.io/
https://codeclimate.com/

- post-deployment tests

https://assertible.com/
https://assertible.com/blog/set-up-continuous-testing-with-nodejs

### Sample Pipeline

[Deploy Node.JS application in Docker to AWS](https://semaphoreci.com/community/tutorials/continuous-deployment-of-a-dockerized-node-js-application-to-aws-ecs)