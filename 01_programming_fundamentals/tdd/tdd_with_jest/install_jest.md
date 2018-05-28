### Installation

**Option 1: Project-specific installation**

1. Create a project: `yarn init`
2. Install jest in the project: `yarn add --dev jest`
3. Add the test script to `package.json`:

```json
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

4. Run tests with `yarn test`

**Option 2: Global installation**

```
yarn add global jest
```

Note:

* Global installations are an **anti-pattern**. Do it for convenience in your personal projects/practice, but not when you're collaborating with others or working with a CI server!
* When you install jest globally, it will be available on the command via the `jest` command. Read more about the jest cli [here](https://facebook.github.io/jest/docs/en/cli.html)

### VS Code Extension
- Install Jest Snippets (andys8.jest-snippets). This will be handy 
  - Open command palette: Shift + Cmd + P
  - Type 'install extensions' and hit enter
  - Search for 'Jest Snippets'
  - Install and reload
  - Start using the autocomplete feature in your test file (e.g. `test→`)!
    - See list of commands here: https://github.com/andys8/vscode-jest-snippets 