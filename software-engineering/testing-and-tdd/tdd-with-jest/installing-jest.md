# Installing Jest

## Installation

**Project-specific installation**

* Create a project: `npm init -y`
* Install jest in the project: `npm install --save-dev jest`
* Add the test script to `package.json`:

```javascript
{
  "name": "my-project",
  "version": "1.0.0",
  ...
  "scripts": {
      "test": "jest",     
      "test:watch": "jest --watch"
  },
  ...
}
```

* Run tests with `npm test`

## VS Code Extension

* Install Jest Snippets \(andys8.jest-snippets\). This will be handy 
  * Open command palette: Shift + Cmd + P
  * Type 'install extensions' and hit enter
  * Search for 'Jest Snippets'
  * Install and reload
  * Start using the autocomplete feature in your test file \(e.g. `test→`\)!
    * See list of commands here: [https://github.com/andys8/vscode-jest-snippets](https://github.com/andys8/vscode-jest-snippets) 

## Help: VS Code does not automatically show the choices for expect\(\)

In VS Code, if you type `expect(something).`, then you should see a pop up of choices for what to expect \(e.g. `toEqual`, `toBeTrue`\). If you don't see this list, that means your project is not configured properly and VS Code does not know what to show.

To fix this, run the command in your project directory `npm install add -D @types/jest`

