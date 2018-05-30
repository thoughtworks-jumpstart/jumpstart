# Machine Setup (Windows)

## Chocolatey (package manager)

Following the instructions at the page below. Note that you need to run the installation commands on a PowerShell (or CMD window) with administrator privilege.

<https://chocolatey.org/install>

## Git Bash

This will install 2 things `git` (a source code management tool) and `bash` (a unix command line tool)

<https://gitforwindows.org/>

### Configuring Git

Using your email credentials for Git, run these commands with your user and email configured.

```shell
git config --global user.name "YOUR-USERNAME"
git config --global user.email "YOUR-EMAIL-ADDRESS"
git config --global push.default simple
git config --global credential.helper cache
git config --global core.eol lf
git config --global core.autocrlf true
```

You can read more about what these commands are doing here: https://help.github.com/categories/setup/

## Node

To install Node

```shell
choco install nodejs
```

If node is already installed, upgrade to the latest version of node using

```shell
choco upgrade nodejs
```

For more details, see <https://chocolatey.org/packages/nodejs>

Alternatively, you can also download nodejs and npm from <https://nodejs.org/en/>


## VS Code Configurations

### Integrate VS Code with Bash Terminal

You can open a terminal within VS Code by typing `ctrl + ~`, and that's very handy sometimes. 

By default, the VS Code on Windows would integrate with the PowerShell (or CMD) by default. If you prefer to use Bash shell, open User Settings (`Ctrl` + \`) and add this line:
```json
{
  // ... other configuration
  "terminal.integrated.shell.windows": "C:\\Program Files\\Git\\bin\\bash.exe"  
}
```
You can read more about custom shell configuration for windows [here](https://code.visualstudio.com/docs/editor/integrated-terminal#_windows)

### Enable opening of VS Code from Git Bash

Follow instructions here: https://www.seangwright.me/blog/tools/how-to-open-visual-studio-code-from-git-bash-in-windows/

### Configure VS Code to use LF as end-of-line character

Since some of your team mates are using Mac, we need to be careful about end-of-line characters (because those two systems use different conventions. For more details, you can read about it [here](http://adaptivepatchwork.com/2012/03/01/mind-the-end-of-your-line/)).

To keep it simple, we will use LF as the end-of-line character on both Windows and Mac.

On Windows, we need to configure VS Code in user settings:

- Open user settings with shortcut `ctrl` + `,`
- In user settings, set `"files.eol": "\n"`

## Verify installation for everything

```shell
git --version
node -v
npm -v
yarn -v
code -v
```

## Chrome Browser

We will need the developer tools come with Google Chrome browser.

We can either install it via Chocolatey

```shell
choco install googlechrome
```

Or just [download it from Google official website](https://www.google.com/chrome/).
