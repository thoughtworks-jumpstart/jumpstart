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

### (Optional) Setting up SSH Key with your GitHub account

You might find your self having to re-authenticate GitHub multiple times when you work with a project cloned from GitHub. To avoid typing your password multiple times, you can setup SSH Keys to let Github remember your machine in the future.

* [Github Generating SSH Keys](https://help.github.com/articles/generating-ssh-keys/)

After this step, when you clone new projects from GitHub, you can choose the "SSH" version of the repository URL, in addition to the "HTTPS" option.

This step is optional. If you skip this step, you can still clone the repository using HTTPS version of the URL.

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

## Yarn

We will use `yarn` as our node package manager.

You can install it by following the instructions [here](https://yarnpkg.com/lang/en/docs/install/#windows-tab)

In short, you need to run 

```shell
choco install yarn
```

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

## Insomnia

Insomnia is a tool to interact with REST web APIs. Don't worry about this term if you are not familiar with it yet.

We can either install it via Chocolatey

```shell
choco install insomnia-rest-api-client
```

Otherwise, you can always [download from their official website](https://insomnia.rest/download/)

## MongoDB

We will develop our applications based on MongoDB in this course. So let's install it now.

Following the instructions on their [official website](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-windows/) to install the latest release of Community Edition.

If you would like to view the database content using a GUI tool, you can download and install [Robo 3T](https://robomongo.org/download)