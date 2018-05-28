# Deploying our application

Our app is of no use to anyone if we don't deploy it!

### What does 'deploying' an application mean?

> Simply put, deployment is taking your application (which we've comfortably been running on our machine, on localhost:xxxx) to another machine(s) so that the other people can access it.

It may look complicated, but the steps required for deploying an application is very similar to what you've done so far to get your app running on `localhost` in your browser:
1. Get/provision machine (e.g. get machines on heroku/AWS/Google Cloud Platform)
2. Configure machine (e.g. install system-level dependencies (e.g. node and npm), open firewall, find out address to the machine)
3. Install project-level dependencies (e.g. `yarn install`)
4. Run tests (e.g. `yarn test`)
5. Start application (e.g. `yarn start`)

That's all! It can be that simple!
