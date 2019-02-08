# Windows

**Note**, run the commands below in a CMD or PowerShell window with admin privilege.

If you don't know how to open a CMD or PowerShell with admin privilege, checkout the tutorials here:

- [CMD with Admin Privilege](https://www.howtogeek.com/194041/how-to-open-the-command-prompt-as-administrator-in-windows-8.1/)
- [PowerShell with Admin Privilege](https://www.thewindowsclub.com/how-to-open-an-elevated-powershell-prompt-in-windows-10)

## Chocolatey \(package manager\)

`Chololatey` is a package manager on windows that helps to install other software packages.

Following the instructions at the page below. Note that you need to run the installation commands on a PowerShell \(or CMD window\) with administrator privilege.

[https://chocolatey.org/install](https://chocolatey.org/install)

## Git for Windows

After that, we need to install 2 things `git` \(a source code management tool\) and `bash` \(a unix command line tool\).

For this purpose, we need to install [Git for windows](https://gitforwindows.org/). It provides git installation on windows, and an emulation of [bash shell](https://en.wikipedia.org/wiki/Bash_(Unix_shell))

### Configuring Git

Using your email credentials for Git, run these commands with your user and email configured.

```text
git config --global user.name "YOUR-USERNAME"
git config --global user.email "YOUR-EMAIL-ADDRESS"
git config --global push.default simple
git config --global credential.helper cache
git config --global core.eol lf
git config --global core.autocrlf true
git config --global pull.rebase true
git config --global rebase.autoStash true
git config --global core.editor 'code --wait'
```

You can verify your git configuration by running: `git config --list | cat`. The values which you had keyed in earlier should be listed.

You can read more about what these commands are doing here: [https://help.github.com/categories/setup/](https://help.github.com/categories/setup/)

## Node

To install Node

```text
choco install nodejs
```

If node is already installed, upgrade to the latest version of node using

```text
choco upgrade nodejs
```

For more details, see [https://chocolatey.org/packages/nodejs](https://chocolatey.org/packages/nodejs)

Alternatively, you can also download nodejs and npm from [https://nodejs.org/en/](https://nodejs.org/en/)

### (Optional) Node Version Manager

The instructions above will install the latest version of node on your computer. If you need to use an older version of node for some reason (e.g. you are working on a project with older version of node), then you can use this tool called [nvm-windows](https://github.com/coreybutler/nvm-windows) to install specific version of node on your computer.

Read the instructions of the tool to learn how to use it.

## VS Code Configurations

### Integrate VS Code with Bash Terminal

By default VS Code runs the `cmd` command on windows when you try to open a terminal window. Since the Git for windows comes with a bash shell (called `Git Bash`), you can configure your VS Code to launch a `bash` terminal window instead:

* Open command palette \(Press `F1`\)
* Type 'Select default shell' and click on the suggestion that says 'Terminal: Select default shell'
* Select Git Bash
* Open terminal in VS Code \(Press Ctrl + \`\)
* If it says 'bash', you're done! If it says otherwise, click on the trash bin icon and repeat the previous step

### Configure VS Code to use LF as end-of-line character

Since some of your team mates are using Mac, we need to be careful about end-of-line characters \(because those two systems use different conventions. For more details, you can read about it [here](http://adaptivepatchwork.com/2012/03/01/mind-the-end-of-your-line/)\).

To keep it simple, we will use LF as the end-of-line character on both Windows and Mac.

On Windows, we need to configure VS Code in user settings:

* Open user settings with shortcut `ctrl` + `,`
* In user settings, set `"files.eol": "\n"`

## Chrome Browser

We will need the developer tools come with Google Chrome browser.

We can either install it via Chocolatey

```text
choco install googlechrome
```

Or just [download it from Google official website](https://www.google.com/chrome/).

## Verify installation for everything

```text
git --version
node -v
npm -v
code -v
```
