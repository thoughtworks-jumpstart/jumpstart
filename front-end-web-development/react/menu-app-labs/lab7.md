# Lab 7: Add feature to edit existing restaurants in the Admin page

In this lab you are required to create an `Edit` button which allows the Admin to edit the information of an existing restaurant

0. When the Admin clicks on the `Edit` button the page will navigate to a form with the fields pre filled with the restaurant's information
1. If the Admin changes some values, and clicks the `Save` button, the page will navigate back to the restaurant table
2. The edited restaurant will have its information updated

## Feature details

- Navigate to the menu-app project directory on your computer
- checkout to the lab 7 branch

```
  git checkout lab7
  git branch
```

### Step 1: Link the Edit button to the RestaurantForm

- Create an `Edit` button and place it before the `Delete` button in the restaurants table
- Link the `Edit` button to the Restaurant form page with the route `restaurants/:id`
- Create route in App.js for `restaurants/:id` and render the RestaurantForm
- Ensure that when you click on the Edit button it is linked to the Form page

### Step 2: Display the values of the restaurant in the field

- In `ComponentDidMount()`, get the id of the restaurant from `this.props.match.params`
- Find the restaurant from its id with the `getRestaurants()` function
- Save the restaurant details to the state
- In `render()` read the values from the state and place them as the value attribute of each field

### Step 3: Modify the restaurant form title

- When RestaurantForm is used to create a new restaurant it is called `Create Restaurant`
- When the RestaurantForm is used to edit an existing restaurant, the title should change to `Edit Restaurant`

## Expected Output

This screenshot is a sample of the expected output

![Edit restaurant button on the Admin page](../../../.gitbook/assets/front-end-web-development/react/menu-app-labs/lab7-output-1.png)

![Restaurant form pre filled with values of restaurant](../../../.gitbook/assets/front-end-web-development/react/menu-app-labs/lab7-output-2.png)

## Hints

- if you have trouble displaying the value in the select field try replacing `defaultValue=""` with `value={value}`

## Discussion

- After the lab we will discuss the sample answer and how to test the feature with react-testing-library
