# Yarn

Besides `npm`, there is another widely used node package manager called [`yarn`](https://yarnpkg.com/en/).

Both of them are roughly equal in functionality. Initially, people choose `yarn` because it was better in the following ways:

* Speed. Yarn caches every package it downloads so it never needs to download it again. It also parallelizes operations to maximize resource utilization so install times are faster than ever.
* Security. Yarn uses checksums to verify the integrity of every installed package before its code is executed.
* Version locking. Using a detailed, but concise, lockfile format, and a deterministic algorithm for installs, Yarn is able to guarantee that an install that worked on one system will work exactly the same way on any other system. No more 'works on my machine' problems!

Recently, `npm` has already caught up and there is no clear advantage of using `yarn` anymore. However, we still cover it here for your awareness.

## Learning checklist

* how to install yarn:
  * mac: `brew install yarn`
  * windows: `choco install yarn`
* key `yarn` commands
  * how to create a yarn project
    * `yarn init`
    * This creates a `package.json` file \(our project configuration file\)
  * how to add packages with yarn \(we will use `cows` npm package, just for good fun\)
    * `yarn add <package-name>`
    * `yarn add <package-name> --dev`
  * how to remove packages with yarn 
    * `yarn remove <package-name>`
    * `yarn remove <package-name> --dev`
  * how to add remove packages globally
    * `yarn global add <package-name>`
    * `yarn global remove <package-name>`
* understand the mapping between yarn-npm
* `yarn.lock` file
  * don't modify `yarn.lock` file manually, run `yarn upgrade` to update the dependencies
  * commit `yarn.lock` file into code repository

## Code along

Let's try the npm package that we installed!

* create a file \(`main.js`\) and paste the code snippets below
* Open the terminal in VS Code: `Ctrl` + \`
* Run this file: `node main.js`

```javascript
const cows = require("cows");

cow = cows()[0]; // try different array indexes (e.g. 1, 2, 3)

console.log(cow);
```

## Resources

### Recommended reading

* [yarn-npm mapping guide](https://yarnpkg.com/lang/en/docs/migrating-from-npm/)

