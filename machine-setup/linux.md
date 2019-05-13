# Linux

## Package manager

Depending on your Linux distribution you will use a different package manager.

For Fedora based distributions (e.g. RHEL, CentOS) you will use `dnf`.

For Debian based distributions (e.g. Ubuntu) you will use `apt`.

NB: `dnf` is the next-generation version of `yum`. To install `dnf` run `yum install dnf`.

## Git

### Install Git

For Fedora based distributions

```
sudo dnf install git-all
```

For Debian based distributions

```
sudo apt install git-all
```

### Configure Git

To attach your full name to every commit you make simply add this line (of course, change it to your own name):

```
git config --global user.name "Jane Doe"
```

You can keep your email addresses private by using `<username>@users.noreply.github.com`. Just replace `<username>` with your actual GitHub username (e.g. `janedoe@users.noreply.github.com`)

```
git config --global user.email "<username>@users.noreply.github.com"
```

Add the following recommended configurations:

```
git config --global push.default simple
git config --global credential.helper cache
git config --global core.autocrlf input
git config --global pull.rebase true
git config --global rebase.autoStash true
git config --global core.editor 'code --wait'
```

## Node.js

### Install Node.js

Official Node.js [binary distributions](https://github.com/nodesource/distributions) for various Linux distributions are provided by NodeSource.

For Fedora based distributions, refer to installation instructions [here](https://github.com/nodesource/distributions/blob/master/README.md#rpminstall).

For Debian based distributions, refer to installation instructions [here](https://github.com/nodesource/distributions/blob/master/README.md#debinstall).

### Node Version Manager

When developing sofware for various projects, it is not uncommon to deal with multiple versions of Node.js. The best way to manage these versions is to use a Node Version Manager.

We recommed using `n`. You can read their [documentation](https://github.com/tj/n) and install it by running the following command:

```
npm install -g n
```

## Browsers

Chrome and Firefox are two recommended browsers that you should install for web development.

### Chrome

To install Chrome browser, follow the instructions [here](https://support.google.com/chrome/answer/95346?co=GENIE.Platform%3DDesktop&hl=en).

### Firefox

To install Firefox, follow the instructions [here](https://support.mozilla.org/en-US/kb/install-firefox-linux).
