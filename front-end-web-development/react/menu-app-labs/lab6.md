# Lab 6: Add feature to create a new restaurant in the Admin page

In this lab you are required to create a `Create New` button in the Admin page

0. When the Admin clicks on this button the page will navigate to a form to add a new restaurant
1. After form is filled, and the `Save` button is clicked, the page will navigate back to the restaurant table
2. The new restaurant should now be in the list

## Feature details

- Navigate to the menu-app project directory on your computer
- checkout to the lab 6 branch

```
git checkout lab6
git branch
```

- Create a RestaurantForm react component

  - in src/components/RestaurantForm/RestaurantForm.jsx
  - this component will contain all the form fields required for a new restaurant
    - use a Select field for Cuisine attribute
    - use Text fields for all other attributes
  - and will have `Save` button at the bottom
  - in the form handler you can call `saveRestaurant()` from RestaurantService to save the new restaurant
  - Note: you are not required to do form validation at this stage. Assume that all input will be valid data.

## Expected Output

This screenshot is a sample of the expected output

![Create New restaurant button on the Admin page](../../../.gitbook/assets/front-end-web-development/react/menu-app-labs/lab6-output-1.png)

![Create new restaurant form](../../../.gitbook/assets/front-end-web-development/react/menu-app-labs/lab6-output-2.png)

![Options in the cuisine select field](../../../.gitbook/assets/front-end-web-development/react/menu-app-labs/lab6-output-3.png)

![Restaurant table now contains the newly created restaurant](../../../.gitbook/assets/front-end-web-development/react/menu-app-labs/lab6-output-4.png)

## Hints

- Use the [bootstrap form-group](https://getbootstrap.com/docs/4.1/components/forms/#overview) style for the form

## Discussion

- After the lab we will discuss the sample answer and how to test the feature with react-testing-library
- How to make use of third party library `simple-react-timefield library` to improve the handling of time input (to not allow entering of invalid time)
