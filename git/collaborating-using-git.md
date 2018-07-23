# Collaborating using Git

## Lab

[https://github.com/thoughtworks-jumpstart/git-newsroom](https://github.com/thoughtworks-jumpstart/git-newsroom)

## Learning checklist

* Collaborating on git
  * steps for fixing merge conflicts
    * manually fix merge conflict
      * search for '=======' or '&gt;&gt;&gt;&gt;&gt;'
      * make a decision on what lines to keep, and what lines to delete 
    * `git add .`
    * `git rebase --continue`
    * If anything gets messed up during rebase, and you want to start over, run: `git rebase --abort`
* Making good commits
  * small commits
  * clear commit messages
* How to avoid merge conflicts
  * Pull/push frequently
  * Avoid editing the same files at the same time
* Ignoring files with `.gitignore`
  * why do we need .gitignore
    * how to ignore files and directories
  * how to ignore wildcards
    * comments in .gitignore must start with \# and must start at beginning of the line
* Pull requests
* Some useful commands
  * `git reset --hard`
  * `git show <commit-sha>`
  * `git stash` , `git stash pop`, `git stash list`
* Explain what these terms mean
  * `repository`
  * `master` branch
  * `remote`
  * `origin`
  * `commit`
* `git config`
  * to see all current configuration: `git config -l`
* [Remove Sensitive Data from a Repository](https://help.github.com/articles/removing-sensitive-data-from-a-repository/)

## Resources

* git stash: [https://www.atlassian.com/git/tutorials/git-stash](https://www.atlassian.com/git/tutorials/git-stash)

