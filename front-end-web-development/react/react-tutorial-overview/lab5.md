# Lab 5: Add a table to list and delete restaurants in the Admin page

In this lab you are required to create a table in the Admin page listing all restaurants

## Feature details

* Navigate to the food-app project directory on your computer
* checkout to the lab 5 branch

```text
  git checkout lab5
  git branch
```

* Create a RestaurantTable react component
  * in src/components/RestaurantTable/RestaurantTable.jsx
  * this component will list the restaurants in a table
  * and have a delete button for each restaurant
  * in the button event handler you can call `deleteRestaurant()` from RestaurantService to remove the restaurant from the list.
  * the listing should be in alphabetical order of the resstaurant name.

## Expected Output

This screenshot is a sample of the expected output

![Restaurant table in the admin page](../../../.gitbook/assets/lab5-output-1%20%281%29.png)

## Hints

* Use the [bootstrap table](https://getbootstrap.com/docs/4.1/content/tables/#examples) style

## Solution

* After you have completed Lab 5, please commit all your work to the `lab5` branch
* You may optionally install the plugin **Git History Diff** for viewing the difference between git branches. This will allow you to easily compare your work with the sample solution
* [https://marketplace.visualstudio.com/items?itemName=huizhou.githd](https://marketplace.visualstudio.com/items?itemName=huizhou.githd)
* Next checkout to the solution branch and we will now walk through the sample solution

```text
git checkout lab6
```

* To view the difference between your work and the sample solution go to the VS Code file explorer, right click your folder and select `GitHD: View Folder Diff` and select compare with `lab5` branch
* The diff sidebar will popup and you can click on the files to view the difference between your work and the sample solution.
* When viewing the diff you can temporarily toggle the sidebar with `cmd + B` to hide it.

## Testing

* Next we will discuss how to test the feature with react testing library

