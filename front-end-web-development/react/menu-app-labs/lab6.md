# Lab 6: Add feature to create a new restaurant in the Admin page

In this lab you are required to create a `Create New` button in the Admin page

0. When the Admin clicks on this button the page will navigate to a form to add a new restaurant
1. After form is filled, and the `Save` button is clicked, the page will navigate back to the restaurant table
1. The new restaurant should now be in the list

## Feature details

- Navigate to the menu-app project directory on your computer
- checkout to the lab 6 branch

```
git checkout lab6
git branch
```

## Step 1:
- Create an `Create New` button and place it on the top right hand side below the NavBar
- Link the `Create New` button to the Restaurant form page with the route `restaurants/new`
- Create route in App.js for `restaurants/new` and render the RestaurantForm

## Step 2:
- Create a RestaurantForm react component
  - in src/components/RestaurantForm/RestaurantForm.jsx
  - this component will contain all the form fields required for a new restaurant
  - Place the heading `Restaurant Form` in this component
- Ensure that the button navigates to the form when you click on it

## Step 3:
- Add the form fields to the RestaurantForm
  - use a Select field for Cuisine attribute
  - use Text fields for all other attributes
  - and will have `Save` button at the bottom

## Step 4:
- In order to avoid too complex a `render()` in RestaurantForm we need to extract the form fields to different components
  - Create a Input react component
    - in src/components/common/Input/Input.jsx
    - this component will render a text input or number input
  - Create a SelectInput component
    - in src/components/common/SelectInput/SelectInput.jsx
    - this component will render a select input

## Step 5:
- Create a form submit handler and link it to the `Save` button
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

- Lastly we will discuss the sample answer and how to test the feature with react-testing-library

# Demo
- After the lab we will have a code-along of how to make use of a third party library `simple-react-timefield library` to improve the handling of time input (to not allow entering of invalid time) 
- checkout to the lab 6 demo branch

```
git checkout lab6-demo
git branch
```
- We will first install this dependancy `simple-react-timefield library`
- Next we will create a new component `TimeInput` which will use this library to create an input that only allows the user to input a valid time
- In the last part we will use the TimeInput in the RestaurantForm

