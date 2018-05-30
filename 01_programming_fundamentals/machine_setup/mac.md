# Machine Setup (Mac)

## Homebrew

Homebrew is a package manager that we will use to install various command line tools in our class.

Open up terminal, and paste the following command to install Homebrew. You might be prompted to install XCode Command Line Tools during the install process.

```shell
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

After the installation process, run the command `brew doctor`. If any warnings or errors are displayed, we will need to resolve them before proceeding with the rest of the install fest.

## Git
Before we do this process, please make sure you have signed up for an account on [Github](http://www.github.com). We will be installing a version of Git from home brew and also configuring it.

To install Git

```shell
brew install git
```

### Configuring Git

Using your email credentials for Git, run these commands with your user and email configured.

```shell
git config --global user.name "YOUR-USERNAME"
git config --global user.email "YOUR-EMAIL-ADDRESS"
git config --global push.default simple
git config --global credential.helper cache
git config --global core.autocrlf input
```

You can read more about what these commands are doing here: https://help.github.com/categories/setup/

## Node

To install Node

```shell
brew install node
```

If node is already installed, upgrade to the latest version of node using

```shell
brew upgrade node
```

Verify the installation afterwards by running

```shell
node -v
npm -v
```

The above should display without any errors.

To finish up your installation, run this command to allow for global installations of npm tools.

```shell
sudo chown -R $USER /usr/local/lib
```

## Configure Terminal shortcuts

If you don't have iterm2 installed yet, run the command below

```shell
brew cask install iterm2
```

**Important**: Spend 2 minutes to configure this shortcut and you'll be much more productive
- <https://coderwall.com/p/h6yfda/use-and-to-jump-forwards-backwards-words-in-iterm-2-on-os-x>

As you encounter pain points and manually intensive steps (e.g. having to move by character, rather than by words), take a few minutes and google ways to address this pain points.

## Install Oh My ZSH

We'll be using a shell and configuration package called [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh). To install, run:

```shell
curl -L http://install.ohmyz.sh | sh
```

Restart Terminal, and you should see a brand new and colorful command prompt.

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

If you have installed brew-cask, then you can install the Chrome browser via command line, like

```shell
brew cask install google-chrome
```

Otherwise, you can always [download it from Google official website](https://www.google.com/chrome/).
