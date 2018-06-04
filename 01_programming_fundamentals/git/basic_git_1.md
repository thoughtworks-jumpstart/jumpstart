# Getting Started with Git

## Configure Git

Verify that your name and email are set:

- `git config user.name`
- `git config user.email`

Type the following commands one by one in your terminal:

- `git config --global pull.rebase true`
- `git config --global rebase.autoStash true`
- `git config --global core.editor 'code --wait'`

## Assignment: Git Basics

https://classroom.github.com/a/RbkhEFJT

## Using Git

### Cloning an existing git repo to our local machine

    git clone <repo-url>

### Committing changes to the local repository

- `git status` - See status of changes and commits
- `git add <path/to/file>` - Add a file to staging
	- `git reset <path/to/file>` - Remove file from staging	
- `git commit` - Commit the file to git

### Pushing local commits to the remote repository

    git push origin master

### Fetching new changes from the remote repository

    git pull

### Checking the log

    git log

### Creating a git repo locally and publishing it to GitHub

- `git init` - Initialize folder as a git repository
- `git remote add origin <repo-url>` (to get the url, create a repo on GitHub first)
- `git remote -v`
- `git remote set-url origin <repo-url>`
- `git push -u origin master`

## Take-home assignments

- Try Git (~15 minutes): https://try.github.io/levels/1/challenges/1
- Learn Git and Version Control: https://www.katacoda.com/courses/git

## Resources

- [Learn Just Enough Git to Be Dangerous](https://www.learnenough.com/git-tutorial)
- [Git - the simple guide](http://rogerdudler.github.io/git-guide/)
- [Git Cheat Sheet](https://gist.github.com/akras14/3d242d80af8388ebca60)
- [Another git Cheat Sheet](https://zeroturnaround.com/rebellabs/git-commands-and-best-practices-cheat-sheet/)
- [Most commonly used git tips and tricks](https://github.com/git-tips/tips)
- [Git documentation](https://git-scm.com/docs)
- [Git katas](http://blog.schauderhaft.de/gitkata/)
