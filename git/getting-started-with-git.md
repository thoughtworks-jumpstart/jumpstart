# Getting Started with Git

## Configure Git

Verify that your name and email are set:

* `git config user.name`
* `git config user.email`

## Code-along to understand basics of Git
* Create a base directory on your local machine with the following:
* Create directory `mkdir` called `myapp`
  * `touch` two files in the directory
    * `app.js`
    * `index.html`
* `git init` - Initialize folder as a git repository
* `git add <file>` - Add selected files to staging area
  * `git add .` - Add all files to staging area
  * `git rm --cached <file>` - Remove selected file from staging area
* `git status` - Check status of the working directory and staging area
* `git commit` - Make a commit to git
  * `git commit -m` - Make a commit with a message flag to git
* `git log` - Check previous commits made in the repository
* `git remote add origin` - This is to link the local repo to the remote repo with the name origin
* `git push -u origin master` - This is to push the local repo code to the origin master branch
* `git clone` - Clone remote repo to your local machine
* `git pull` - Pull latest changes down to your local machine

## Life cycle of file status

![](../.gitbook/assets/file_status_lifecycle.png)

## Assignment: Git Basics

[https://github.com/thoughtworks-jumpstart/git-basics](https://github.com/thoughtworks-jumpstart/git-basics)

## Using Git

### Cloning an existing git repo to our local machine

```text
git clone <repo-url>
```

### Committing changes to the local repository

* `git status` - See status of changes and commits
* `git add <path/to/file>` - Add a file to staging
  * `git reset <path/to/file>` - Remove file from staging
* `git commit` - Commit the file to git

You need to write **good** commit messages. What is a good commit message then? You can follow the tip below:

![image](../.gitbook/assets/git_commit_message.png)

### Ignoring files with `.gitignore`

* why do we need .gitignore
  * how to ignore files and directories
* how to ignore wildcards
  * comments in .gitignore must start with \# and must start at beginning of the line

### Pushing local commits to the remote repository

```text
git push origin master
```

### Fetching new changes from the remote repository

```text
git pull
```

### Checking the log

```text
git log
```

### Creating a git repo locally and publishing it to GitHub

* `git init` - Initialize folder as a git repository
* `git remote add origin <repo-url>` \(to get the url, create a repo on GitHub first\)
* `git remote -v`
* `git remote set-url origin <repo-url>`
* `git push -u origin master`

## Take-home assignments

* Learn Git and Version Control: [https://www.katacoda.com/courses/git](https://www.katacoda.com/courses/git)

## Resources

* [Learn Just Enough Git to Be Dangerous](https://www.learnenough.com/git-tutorial)
* [Git - the simple guide](http://rogerdudler.github.io/git-guide/)
* [Git Cheat Sheet](https://gist.github.com/akras14/3d242d80af8388ebca60)
* [Another git Cheat Sheet](https://zeroturnaround.com/rebellabs/git-commands-and-best-practices-cheat-sheet/)
* [Git Tutorial: 10 Common Git Problems and How to Fix Them](https://www.codementor.io/citizen428/git-tutorial-10-common-git-problems-and-how-to-fix-them-aajv0katd)
* [Most commonly used git tips and tricks](https://github.com/git-tips/tips)
* [Git documentation](https://git-scm.com/docs)
* [Git katas](https://github.com/praqma-training/git-katas/blob/master/Overview.md)
* [Visualizing Git Concepts with D3](http://onlywei.github.io/explain-git-with-d3/)

