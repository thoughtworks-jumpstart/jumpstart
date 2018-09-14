# Mac

## Homebrew

Homebrew is a package manager that we will use to install various command line tools in our class.

Open up terminal, and paste the following command to install Homebrew. You might be prompted to install XCode Command Line Tools during the install process.

```text
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

After the installation process, run the command `brew doctor`. If any warnings or errors are displayed, we will need to resolve them before proceeding with the rest of the install fest.

## Git

Before we do this process, please make sure you have signed up for an account on [Github](http://www.github.com). We will be installing a version of Git from home brew and also configuring it.

To install Git

```text
brew install git
```

### Configuring Git

Using your email credentials for Git, run these commands with your user and email configured.

```text
git config --global user.name "YOUR-USERNAME"
git config --global user.email "YOUR-EMAIL-ADDRESS"
git config --global push.default simple
git config --global credential.helper cache
git config --global core.autocrlf input
git config --global pull.rebase true
git config --global rebase.autoStash true
git config --global core.editor 'code --wait'
```

You can verify your git configuration by running: `git config --list | cat`. The values which you had keyed in earlier should be listed.

You can read more about what these commands are doing here: [https://help.github.com/categories/setup/](https://help.github.com/categories/setup/)

## Node

> Warning: If you already installed node without using homebrew \(e.g. using another installer\), you may encounter errors while trying to re-install node using the homebrew command below. If the node version on your computer is relatively new, you can keep your current node installation and skip this step. Otherwise, you need to [uninstall your current node installation](https://stackoverflow.com/questions/11177954/how-do-i-completely-uninstall-node-js-and-reinstall-from-beginning-mac-os-x) before you install again using homebrew

To install Node

```text
brew install node
```

If node is already installed with homebrew, you can upgrade to the latest version of node using

```text
brew upgrade node
```

Verify the installation afterwards by running

```text
node -v
npm -v
```

The above should display without any errors.

To finish up your installation, run this command to allow for global installations of npm tools.

```text
sudo chown -R $USER /usr/local/lib
```

## Configure Terminal shortcuts

If you don't have iterm2 installed yet, run the command below

```text
brew cask install iterm2
```

**Important**: Spend 2 minutes to configure this shortcut and you'll be much more productive

* [https://coderwall.com/p/h6yfda/use-and-to-jump-forwards-backwards-words-in-iterm-2-on-os-x](https://coderwall.com/p/h6yfda/use-and-to-jump-forwards-backwards-words-in-iterm-2-on-os-x)

As you encounter pain points and manually intensive steps \(e.g. having to move by character, rather than by words\), take a few minutes and google ways to address this pain points.

## Install Oh My ZSH

We'll be using a shell and configuration package called [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh). To install, run:

```text
curl -L http://install.ohmyz.sh | sh
```

Now, restart Terminal, and you should see a new and more colorful command prompt.

### **Optional plugins**

Install zsh-autosuggestions for better productivity when using command line

* **zsh-autosuggestions**

**Steps**

1. Clone this repository into `~/.oh-my-zsh/plugins`
2. `git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions`
3. Add the plugin to the list of plugins for Oh My Zsh to load\(inside ~/.zshrc\):
4. `plugins=(zsh-autosuggestions)`
5.  Start a new terminal session by typing:
6.  `source ~/.zshrc`

## Verify installation for everything

```text
git --version
node -v
npm -v
code -v
```

## Chrome Browser

We will need the developer tools come with Google Chrome browser.

If you have installed brew-cask, then you can install the Chrome browser via command line, like

```text
brew cask install google-chrome
```

Otherwise, you can always [download it from Google official website](https://www.google.com/chrome/).

