# Installing Jest

## Installation

**Project-specific installation**

1. Create a project: `npm init -y`
2. Install jest in the project: `npm install --save-dev jest`
3. Add the test script to `package.json`:

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

1. Run tests with `npm test`

## VS Code Extension

* Install Jest Snippets \(andys8.jest-snippets\). This will be handy 
  * Open command palette: Shift + Cmd + P
  * Type 'install extensions' and hit enter
  * Search for 'Jest Snippets'
  * Install and reload
  * Start using the autocomplete feature in your test file \(e.g. `test→`\)!
    * See list of commands here: [https://github.com/andys8/vscode-jest-snippets](https://github.com/andys8/vscode-jest-snippets) 

