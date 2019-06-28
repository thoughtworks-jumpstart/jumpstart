# Using Express Router

For a very small app, we can define all the API endpoints in one file, like what we did in the previous examples. However, as our application grows, it's a good idea to break the application into smaller modules. In terms of the API end points, it would be better to group API endpoints by their nature.

For example, if we are implementing an API for the library system, the API endpoint for `users` and `books` can be put into their own module. This is illustrated in the example `express_basic_example_with_router.js`.

This example uses one feature supported by Express Framework called `Router`. Each Router is like a `mini-app`, which means it can contain its own API endpoints \(together with many other things such as middleware and error handlers, as you will notice later.\)

To see this example in action:

```text
node express_basic_example_with_router.js
```

Then visit URLs like

```text
http://localhost:3000/users/
http://localhost:3000/users/gordon
http://localhost:3000/books/
http://localhost:3000/books/joy_in_clojure
```

You can see all the API points work as expected.

To get better understanding on Routing in Express, checkout [the official guide](https://expressjs.com/en/guide/routing.html)

## Lab 4: Integrate Express routers to organise your songs routes

Routers are used to organise your routes in your API into logical sections

An added benefit is you can attach different middleware in each router to process such routes differently

In this lab we have added another resource `movies` with CRUD routes in app.js. This is to simulate the situation where there are many routes in app.js and your task is to organise the routes by using seperate Routers.

### Requirements

* Create a directory named `routes`
* Create 2 files songs.js and movies.js in the routes directory
* Refactor the current routes in the songs api app.js into the separate router files
* Run the tests to ensure that nothing was broken in the refactoring process

### Instructions

* Navigate to the express-songs-api project folder
* Ensure that the work from your previous lab is already commited
* checkout to branch `7-add-router-demo` to get started

```text
git checkout 7-add-router-demo
```

### Solution

* After you have completed Lab 4, please commit all your work to the `7-add-router-demo` branch
* You may optionally install the plugin **Git History Diff** for viewing the difference between git branches. This will allow you to easily compare your work with the sample solution
* [https://marketplace.visualstudio.com/items?itemName=huizhou.githd](https://marketplace.visualstudio.com/items?itemName=huizhou.githd)
* Next checkout to the solution branch and we will now walk through the sample solution

  ```text
  git checkout 8-add-router-demo-solution
  ```

* To view the difference between your work and the sample solution go to the VS Code file explorer, right click your folder and select `GitHD: View Folder Diff` and select compare with `7-add-router-demo` branch
* The diff sidebar will popup and you can click on the files to view the difference between your work and the sample solution.
* When viewing the diff you can temporarily toggle the sidebar with `cmd + B` to hide it.

