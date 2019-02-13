# Lab 4: Add a navbar and link to pages Admin and Orders

This lab is to apply your knowledge of react router in a typical use case. 

## Feature details
- Navigate to the menu-app project directory on your computer
- checkout to the lab 4 branch

```
git checkout lab4
git branch
``` 

- In this lab you are required to create a NavBar linking to 3 pages:
  - Home page
    - http://localhost:3000/home
  - Admin
    - http://localhost:3000/admin
  - My Orders
    - http://localhost:3000/orders

- Create 2 react components
  - AdminPage
    - in src/components/AdminPage/AdminPage.jsx
    - Display a blank page with the words "Admin Page"
    - In a later lab you will build an admin console here, to view and manage the restaurant list
    - 
  - Order Page
    - in src/components/OrderPage/OrderPage.jsx
    - Display a blank page with the words "OrderPage"

- When you click on the link in the NavBar the page navigates to the corresponding page

- When you click on the FoodApp brand icon, it also navigates to the HomePage
  
## Expected Output
These screenshots are a sample of the expected output

![Home Page](../../../.gitbook/assets/front-end-web-development/react/menu-app-labs/lab4-output-1.png)

![Admin Page](../../../.gitbook/assets/front-end-web-development/react/menu-app-labs/lab4-output-2.png)

![My Orders page](../../../.gitbook/assets/front-end-web-development/react/menu-app-labs/lab4-output-3.png)


## Hints
- Use the [bootstrap navbar](https://getbootstrap.com/docs/4.1/components/navbar/#nav) style  
- To get the icon for the FoodApp brand, install fontawesome 
```
npm install @fortawesome/fontawesome-free"
```  

## Discussion
- After the lab we will discuss the sample answer and how to test the feature with react-testing-library