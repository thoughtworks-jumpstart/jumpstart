# Git - more advanced stuff

Now that you're more comfortable with git, it's time to take it to the next level with more advanced git commands

### Learning checklist
- Resetting and stashing local changes
  - `git reset --hard`
	- `git stash`/`git stash save my-awesome-stash` and `git stash pop`
	- `git checkout path/to/file`
- Working with branches
	- `git branch <branch-name>`
	- `git checkout <branch-name>`
	- `git checkout -b <branch name>`
	- `git branch -d <branch-name>`
- Explain what these terms mean
	- `branches`
	- `HEAD`
	- `commit sha - example: 8a295525f6c75325605bf4073c74e6afe02ad43c`
- How to edit commits
	- Amend commit messages: `git commit --amend`
	-	Amend contents of a commit: `git add <file(s)>` and  `git commit --amend --no-edit`
- `git pull` vs. `git pull --rebase`
	- `git pull` === `git fetch` + `git merge`
	- `git pull -r` === `git fetch` + `git rebase`
- Benefits of `git pull -r`
	- `git rebase` is that it solves the same problem as `git merge` - Both are designed to integrate changes from one branch into another branch—they just do it in very different ways.
	- The major benefit of rebasing is that you get a much cleaner project history. First, it eliminates the unnecessary merge commits required by git merge. Second, as you can see in the above diagram, rebasing also results in a perfectly linear project history—you can follow the tip of feature all the way to the beginning of the project without any forks. 
- Removing files from git (i.e. gitignoring files that have been committed)
- How to make a pull request
- Different strategies for working with Git
  - Branches
  - Trunk-based development


### Assignment
- [Learn branching](https://learngitbranching.js.org/?demo)

### Resources
- [Git from the bottom up (**recommended**)](http://ftp.newartisans.com/pub/git.from.bottom.up.pdf)
- [Git documentation](https://git-scm.com/docs)
- [Learn Git Branching](https://github.com/pcottle/learnGitBranching)
- [Trunk based development > Feature branches](https://martinfowler.com/bliki/FeatureBranch.html)
- [Git rebase](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase)