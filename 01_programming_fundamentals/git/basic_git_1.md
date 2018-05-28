# Git - getting started part 1

### Learning checklist

- What is `git`: a version control systems
- How does `git` work - auto diffing
- Why is `git` important
- Section 1: Making a folder a git repository
  - `git init` - Initialize folder as a git repository
	- `git status` - See status of changes nad commits
	- `git add <path/to/file>` - Add a file to staging
		- `git reset HEAD <path/to/file>` - Remove file from staging	
	- `git commit -m 'message'` - Commit the file to git
- Section 2: Pushing our `git` repo to a remote repository (e.g. GitHub)
	- `git remote add origin <repo-url>` (to get the url, create a repo on GitHub first)
	- `git remote -v`
	- `git remote set-url origin <repo-url>`
	- `git pull --rebase` or `git pull -r`
		 - git configuration: apply auto stash when rebasing: `git config --global rebase.autoStash true`
	- `git push origin master`
	- Other useful commands:
		- `git diff`
		- `git log`
- Section 3: Cloning other people's `git` repo to our local machine
	- `git clone <repo-url>`



### Resources
- [Learn Just Enough Git to Be Dangerous](https://www.learnenough.com/git-tutorial)
- [Git - the simple guide](http://rogerdudler.github.io/git-guide/)
- [Git Cheat Sheet](https://gist.github.com/akras14/3d242d80af8388ebca60)
- [Another git Cheat Sheet](https://zeroturnaround.com/rebellabs/git-commands-and-best-practices-cheat-sheet/)
- [Most commonly used git tips and tricks](https://github.com/git-tips/tips)
- [Git documentation](https://git-scm.com/docs)
- [Git katas](http://blog.schauderhaft.de/gitkata/)

### Assignment: News lab
https://github.com/thoughtworks-jumpstart/git-newsroom

#### Take-home assignment
https://www.katacoda.com/courses/git

