# Git Cheat Sheet

A summary of commands and syntax which we've learnt so far

#### Scenario 1: Cloning another repo

1. On github.com, go to the repo which you'd like to clone

2. Fork the repo by clicking on the 'Fork' button on the top right corner of the page

3. In your terminal, `cd` to a folder where you want to keep this repo (e.g. Desktop/coding/week-1), and run
```
git clone http://www.github.com/YOUR_GITHUB_USERNAME/js-functions
```
4. You'll now have the repo running on your local machine! Awesome! After making changes to the files, run the following commands to commit and push your changes to github:
```
git add -A
git commit -m "your awesome commit message"
git push -u origin master
```
5. Your code is now on your repo on github!

#### Scenario 2: Creating your own repo

1. On github.com, create a new repo by clicking on the `+` button on the top right corner of the page.

2. [Skip this step if you've already created your folder, html file(s) and js file(s)] If you haven't, you can create your folder and files for your program:
```
mkdir my-awesome-repo
cd my-awesome-repo
touch index.html style.css script.js
```

3. In the terminal, `cd` to the folder which you want to push to github, and run:
```
git init
git remote add origin YOUR_GITHUB_REPO_URL
```

4. Your local repo is now linked to your github repo. To push your code to github, run the message commands as before:
```
git add -A
git commit -m "your awesome commit message"
git push -u origin master
```
5. Done! Remember to run step 4 (add, commit, push) regularly!