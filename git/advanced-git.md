# Git - more advanced stuff

Now that you're more comfortable with git, it's time to take it to the next level with more advanced git commands

## Useful Git commands

## Basic commands
- Initialise a new git repository
  - `git init`

- View modifications made in working dir / View staged files
  - `git status`

- Undo modifications to file
  - `git checkout <file name>`

- Undo all modifications in working dir
  - `git checkout .`

- View details of local changes
  - `git diff`

- Add change to staging area
  - `git add`
  - `git add -p`

- Undo staged change
  - `git reset <file name>` 

- Commit changes in staging to the local repository
  - `git commit`
  - `git commit -m "commit message here"`

## Commands to view commit history and details

- Show details of a commit
  - `git show <commit-sha>`

- Show git commit history list
  - `git log`

- Show all branches of commit history title in a graph 
  - `git log --all --oneline --graph`

- View graphical UI of commit history graph and commit details
  - `gitk`

## Commands to modify local commits (commits which has not been pushed)

- Make changes to the last commit (eg: add or remove file, edit commit message)
  - `git add .`
  - `git commit --amend`

- Make changes to the last commit (eg: add or remove file, Do not edit commit message)  
  - `git add .`
  - `git commit --amend --no-edit`

- Undo commits to a certain point in time (changes from commit dumped to working dir)
  - `git reset <commit SHA to reset to>` 

- Delete commits to a certain point in time (Warning: also deletes any uncommitted changes)
  - `git reset --hard <commit SHA1 to reset to>` 

## Commands to undo commits which are already pushed to remote
As we should never modify commits which are already on remote, we can only revert it with a new commit.

Create a new commit which is the exact opposite of specified commit SHA
  - `git revert <SHA>`

## Commands to save local changes temporarily 
eg: when you need to pause the feature you are working on, to work on something else urgent

Saves changes from working dir and staging to stash area
  - `git stash`

Saves changes from working dir and staging area and new files, to stash area 
  - `git stash -u`

Save stash with a description
  - `git stash save my-awesome-stash`

Remove last stashed changes and dump them to the working dir   
  - `git stash pop`

Remove second last stashed and dump to the working dir
  - `git stash pop stash@{1}`

Dump last stashed to the working dir, but leave stash intact  
  - `git stash apply`

List all stashed changes
  - `git stash list`

## Working with branches
Best practices: Do a git pull to get the lastest code before creating a branch

Create branch
  - `git branch <branch-name>`

Switch working dir to specified branch
  - `git checkout <branch-name>`

Create branch and switch to branch (2-in-1 command)  
  - `git checkout -b <branch name>`

Delete specified branch  
  - `git branch -d <branch-name>`

Force delete specified branch (to delete branch even if it has changes unmerged to master)
  - `git branch -D <branch-name>`

## Getting latest changes from remote
- `git pull` vs. `git pull --rebase`

  - `git pull` === `git fetch` + `git merge`
  - `git pull --rebase` === `git fetch` + `git rebase`

  - Benefits of `git pull -r` - `git rebase` is that it solves the same problem as `git merge` - Both are designed to integrate changes from one branch into another branch—they just do it in very different ways. 
  
  - The major benefit of rebasing is that you get a much cleaner project history. First, it eliminates the unnecessary merge commits required by git merge. Second rebasing also results in a perfectly linear project history
  
  — you can follow the tip of feature all the way to the beginning of the project without any forks.

## Customize Git Configuration

  - `git config`
  - to see all current configuration: `git config -l`

## Getting help

  - Use search engines
  - `git [subcommand] --help`
    - Examples:
      - `git --help`
      - `git status --help`
      - `git commit --help`
  - [Git documentation](https://git-scm.com/doc)



## Further Exploration
- Removing files from git (i.e. gitignoring files that have been committed)

- Explain what these terms mean

  - `repository`
  - `master` branch
  - `remote`
  - `origin` - `commit sha - example: 8a295525f6c75325605bf4073c74e6afe02ad43c`

- [Learn branching](https://learngitbranching.js.org/?demo)

- [Remove Sensitive Data from a Repository](https://help.github.com/articles/removing-sensitive-data-from-a-repository/)


## Resources

- [**Recommended** Git from the bottom up](https://jwiegley.github.io/git-from-the-bottom-up/)
- [**Recommended** Git from the bottom up (PDF version)](http://ftp.newartisans.com/pub/git.from.bottom.up.pdf)
- [Mastering Git](https://thoughtbot.com/upcase/mastering-git)
- [Git documentation](https://git-scm.com/docs)
- [Learn Git Branching](https://github.com/pcottle/learnGitBranching)
- [Trunk based development > Feature branches](https://martinfowler.com/bliki/FeatureBranch.html)
- [Git rebase](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase)
- [Git cheatsheet](https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf)
- [Git Stash](https://www.atlassian.com/git/tutorials/git-stash)
- [Another Git Stash Tutorial](http://www.gitguys.com/topics/temporarily-stashing-your-work/)
- [Git Flight Rules](https://github.com/k88hudson/git-flight-rules). A guide for programmers about what to do when things go wrong.
- [Git Katas](https://github.com/praqma-training/git-katas)