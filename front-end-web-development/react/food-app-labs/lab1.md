# Lab 1: List all restaurants from restaurant service

## Fork Lab Repository (One time only)
0. Ensure you are logged in to your github webpage 
0. Navigate to the lab directory at [https://github.com/thoughtworks-jumpstart/food-app.git](https://github.com/thoughtworks-jumpstart/food-app.git)
0. Click on the Fork button on the top right, and wait for the repo to be copied to your github account
0. After it has completed, click on "Clone or Download" button and copy the URL 
0. On the terminal on your computer clone the repository 
```
  git clone https://github.com/enter-your-account-here/food-app.git
```

## Feature details

- In this lab you are required to render a list of 10 restaurants upon page load

- Navigate to the food-app project directory on your computer
- checkout to the lab 1 branch

```
cd food-app
git checkout lab1
git branch
```

- Create 2 react components
  - HomePage
    - in src/components/HomePage/HomePage.jsx
    - this component will contain a list of Restaurant components
    - this component's state will store the list of restaurants
  - Restaurant
    - in src/components/Restaurant/Restaurant.jsx
    - this component will display the information of one restaurant

## Expected Output

This screenshot is a sample of the expected output after the page has loaded

![Restaurants listing](../../../.gitbook/assets/front-end-web-development/react/food-app-labs/lab1-output.png)

## Hints

- The style is for the Restaurant component is a [bootstrap card](https://getbootstrap.com/docs/4.1/components/card/)
- you can access the restaurant data from RestaurantService `getRestaurants()`
- You can optionally install node-sass for using scss stylesheets
```
  npm install node-sass
```

## Solution
- After you have completed Lab 1, please commit all your work to the `lab1` branch

- You may optionally install the plugin **Git History Diff** for viewing the difference between git branches. This will allow you to easily compare your work with the sample solution 

- [https://marketplace.visualstudio.com/items?itemName=huizhou.githd](https://marketplace.visualstudio.com/items?itemName=huizhou.githd)

- Next checkout to the solution branch and we will now walk through the sample solution
```text
git checkout lab2
``` 

- To view the difference between your work and the sample solution go to the VS Code file explorer, right click your folder and select `GitHD: View Folder Diff` and select compare with `lab1` branch 

- The diff sidebar will popup and you can click on the files to view the difference between your work and the sample solution.

- When viewing the diff you can temporarily toggle the sidebar with `cmd + B` to hide it.

## Testing

- Next we will discuss how to test the feature with react-testing-library
- To test React components in our project, we need to install test libraries:
```
  npm install react-testing-library jest-dom --save-dev
```
- Note: It is not required to install jest as `create-react-app` already installs jest by default. And installing a different version on top of that can affect starting the app

