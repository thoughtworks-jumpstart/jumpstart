# Machine Setup

## Common tools

### VS Code

We'll be using **Visual Studio Code** as our text editor of choice. You can download it from here: https://code.visualstudio.com/

### Opening VS Code from your terminal / Git Bash

Open a new shell terminal/Git Bash window, and type `code -v`. If your shell complains that code command is not found, do the following:
1. Open VS Code 
2. Open command palette (Windows: `Ctrl + Alt + P`, Mac: `Cmd + Shift + P`)
3. Type in: 'Shell'
4. Select 'Shell Command: Install 'code' command in PATH
<img src="../../images/add_vscode_to_PATH.png" width=500>

#### VS Code extensions

We have found the following VS Code extensions to be useful in improving our productivity. If you come across any other useful VS Code extensions, do share it with the class!

Open up VS Code, and open the command palette (Mac: `Cmd`+`Shift`+`p`; Windows: `Ctrl`+`Shift`+`P` or `F1`. Enter 'Install extensions'. Search for and install the following extensions one by one

- Javascript
  - ESLint
  - Jest Snippets
  - JS JSX Snippets
  - Prettier
  - vscode-js-import
- HTML
  - Auto Rename Tag
  - Live Server
- working with files/directories
  - advanced-new-file
  - Path Intellisense
- git
  - GitLens

### Slack

We will be using slack to communicate throughout the course. If you haven't joined the channel, you can do so by clicking on this [link](https://join.slack.com/t/jumpstart-1/shared_invite/enQtMzA1OTcyMjU4NTk2LTFhZDc0NWQ4NThlODZiNDdiOGQzYzNhM2I5YjNlYjNkYWNlYWNiNzA0NzgwZTY0YWMyNjA3MjJhMTBjOTM2MTI). You can login via the web browser, but downloading / installing the app is highly recommended.

[Download Slack](https://slack.com/downloads)

### Sign up on Useful Websites

- Create a github account at <https://www.github.com/>
- Create a medium account at <https://www.medium.com/>
- Create a heroku account at <https://www.heroku.com/>
- Create a travisCI account at <https://www.travis-ci.org/>

## OS-specific tools

- [Windows guide](./windows.html)
- [Mac guide](./mac.html)
<!-- TODO:
- add instructions for `brew upgrade <package>` if `brew install <package>` complains that something is already installed
- spell out instructions for verifying `git config`
- add mac os and windows instructions for setting user (self) as admin
- remove git SSH config
- add note to ask trainee to upgrade package if installed. if the exact same version is installed, he/she can skip the installation/upgrade step
 -->
