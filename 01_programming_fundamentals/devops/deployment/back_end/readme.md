# Deploying your Node.js App to Heroku

### Learning checklist
- How to deploy a Node.js app to heroku
- How to run tests on TravisCI
- The importance of the `start` script in `package.json`
- How to install and use `heroku` cli

### How to deploy a Node.js app to heroku using Heroku.com GUI

See in-class demo

### How to deploy a Node.js app to heroku using Heroku CLI
- Prerequisites
  - Create [heroku](https://dashboard.heroku.com) account
  - Install heroku command line app
    - Mac: `brew install heroku` 
    - Windows: `choco install heroku-cli`
- In package.json
  - Ensure all dependencies are listed
  - Specify node version:
  ```
  "engines": {
    "node": "9.x.x"
  },
  ```
  - Specify start script: e.g. `start: node server.js`
- Code hygiene
  - Make sure .gitignore contains:
    - node_modules
    - **/*.log 
    - anything else that you're not supposed to commit to git (e.g. passwords)
- Dry run (check if everything works locally)
  - Run `heroku local web` on your command line
  - Visit localhost to verify that app is running fine
- Time to deploy!
  - Authenticate yourself: `heroku login`
  - Create a heroku app: `heroku create`
  - Push your app to heroku: `git push heroku master`
  - Open app: `heroku open`
  - If you want to rename your app, you can run: `heroku apps:rename newname --app oldname`

### Resources

#### Recommended reading
- https://devcenter.heroku.com/articles/deploying-nodejs
- https://devcenter.heroku.com/articles/node-best-practices

### Assignment

- Deploy your express apps to Heroku
- Bonus: Integrate TravisCI