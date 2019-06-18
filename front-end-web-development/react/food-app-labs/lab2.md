# Lab 2: Filter restaurants by cuisine

## Feature details
- In this lab you are required to build a FilterBar that can modify the displayed restaurants when the user selects a cuisine

- Navigate to the food-app project directory on your computer
- checkout to the lab 2 branch
```
  git checkout lab2
  git branch
``` 

- Create a FilterBar component
- in src/components/FilterBar/FilterBar.jsx
- This component will be used by the HomePage component
- it will display 5 categories
  - All
  - Western
  - Japanese
  - Thai
  - Chinese

- Create a handler in HomePage component to change the state when a button on the FilterBar is clicked

- When the `All` button is clicked all restaurants are listed
- When the `Japanese` button is clicked, only Japanese restaurants are listed
  

## Expected Output
This screenshot is a sample of the expected output

![FilterBar upon page load](../../../.gitbook/assets/front-end-web-development/react/food-app-labs/lab2-output-1.png)

![Restaurant listing after the Japanese category is selected](../../../.gitbook/assets/front-end-web-development/react/food-app-labs/lab2-output-2.png)


## Hints
- The style is for the FilterBar component is a [bootstrap button group](https://getbootstrap.com/docs/4.1/components/button-group/) 
- be aware of binding `this` to the handler
- you will be required to pass a param to the handler

## Solution
- After you have completed Lab 2, please commit all your work to the `lab2` branch

- You may optionally install the plugin **Git History Diff** for viewing the difference between git branches. This will allow you to easily compare your work with the sample solution 

- [https://marketplace.visualstudio.com/items?itemName=huizhou.githd](https://marketplace.visualstudio.com/items?itemName=huizhou.githd)

- Next checkout to the solution branch and we will now walk through the sample solution
```text
git checkout lab3
``` 

- To view the difference between your work and the sample solution go to the VS Code file explorer, right click your folder and select `GitHD: View Folder Diff` and select compare with `lab2` branch 

- The diff sidebar will popup and you can click on the files to view the difference between your work and the sample solution.

- When viewing the diff you can temporarily toggle the sidebar with `cmd + B` to hide it.

## Testing
- Next we will discuss how to test the feature with react testing library