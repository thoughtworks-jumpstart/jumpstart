# Git - more advanced stuff

Now that you're more comfortable with git, it's time to take it to the next level with more advanced git commands

## Learning checklist

- Show details of a commit
  - `git show <commit-sha>`

- Show git commit history
  - `git log [--oneline]`

- View local changes
  - `git diff`

- Discard un-committed changes
  - `git reset --soft`
  - `git reset --hard`

- Save local changes temporarily
	- `git stash`
	- `git stash save my-awesome-stash` 
	- `git stash pop`
	- `git stash list`

- Working with branches
	- `git branch <branch-name>`
	- `git checkout <branch-name>`
	- `git checkout -b <branch name>`
	- `git branch -d <branch-name>`

- Explain what these terms mean
  - `repository`
  - `master` branch
  - `remote`
  - `origin`
	- `commit sha - example: 8a295525f6c75325605bf4073c74e6afe02ad43c`

- How to undo previous commit
  - `git revert <commit-sha>`

- How to edit commits
	- Amend commit messages: `git commit --amend`
	-	Amend contents of a commit: `git add <file(s)>` and  `git commit --amend --no-edit`

- Customize Git Configuration
  - `git config`
  - to see all current configuration: `git config -l`

- Getting help
  - Use search engines
  - `git [subcommand] --help`
    - Examples:
      - `git --help`
      - `git status --help`
      - `git commit --help`
  - [Git documentation](https://git-scm.com/doc)

- [Remove Sensitive Data from a Repository](https://help.github.com/articles/removing-sensitive-data-from-a-repository/)

- `git pull` vs. `git pull --rebase`
	- `git pull` === `git fetch` + `git merge`
	- `git pull --rebase` === `git fetch` + `git rebase`
  - Benefits of `git pull -r`
	  - `git rebase` is that it solves the same problem as `git merge` - Both are designed to integrate changes from one branch into another branch—they just do it in very different ways.
	  - The major benefit of rebasing is that you get a much cleaner project history. First, it eliminates the unnecessary merge commits required by git merge. Second, as you can see in the above diagram, rebasing also results in a perfectly linear project history—you can follow the tip of feature all the way to the beginning of the project without any forks. 

- Removing files from git (i.e. gitignoring files that have been committed)

- Different strategies for working with Git
  - Branches
  - Trunk-based development

## Assignment

- [Learn branching](https://learngitbranching.js.org/?demo)

## Resources

- [Git from the bottom up](https://jwiegley.github.io/git-from-the-bottom-up/)
- [Git from the bottom up (**recommended**)](http://ftp.newartisans.com/pub/git.from.bottom.up.pdf)
- [Git documentation](https://git-scm.com/docs)
- [Learn Git Branching](https://github.com/pcottle/learnGitBranching)
- [Trunk based development > Feature branches](https://martinfowler.com/bliki/FeatureBranch.html)
- [Git rebase](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase)
- [Git cheatsheet](https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf)
- [Git Stash](https://www.atlassian.com/git/tutorials/git-stash)
- [Another Git Stash Tutorial](http://www.gitguys.com/topics/temporarily-stashing-your-work/)
