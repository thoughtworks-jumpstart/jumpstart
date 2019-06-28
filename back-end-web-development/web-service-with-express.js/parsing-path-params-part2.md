# Parsing path params \(Part 2\)

## You can define handlers when route parameters are captured.

Sometimes, you may want to do certain things automatically when an route parameter is captured. For example, once you capture a `userId` parameter, you may want to look up the user profile in database and automatically attach the user profile in the request \(which can be used by the route handlers for that request\).

To declare a handler for a route parameter, you can use the following API

```text
app.param(PARAMETER, HANDLER);
```

The handler function usually has the following signature:

```text
function(req, res, next, parameterValue) {...}
```

Where

* `req` is the request 
* `res` is the response
* `next` is the callback to notify the next handler to process the request
* `parameterValue` is the value of the captured parameter

This is illustrated in example `route_parameter_example_2.js`

```text
node route_parameter_example_2.js
```

## Lab 3: Integrate app.param\(\) middleware to find song from id

In this lab based on our understanding of how app.param\(\) works, you would need to make use of app.param\(\) in the Songs API.

### Requirements

If you look at the 5 routes currently 3 of the routes are have an `:id` path param:

1. GET /songs/:id
2. PUT /songs/:id
3. DELETE /songs/:id

You can identify a common logic that is used in all 3 routes.

After getting the :id param they all search though the songs array for the matching song object.

**Your task is to:**

* implement an app.param\(\) handler that grabs the :id from the path of an incomming request
* extract the search logic and place it in this handler
* save the song found into req.song 
* refactor the 3 routes to use req.song instead
* run all the tests to ensure that you have not broken anything 

### Instructions

* Navigate to the express-songs-api project folder
* Ensure that the work from your previous lab is already commited to `3-testing-lab` branch
* checkout to branch `5-extract-id-from-params` to get started

```text
git checkout 5-extract-id-from-params
```

* open the file app.js this is the file where you would need to create the app.param\(\) handler

### Solution

* After you have completed Lab 3, please commit all your work to the `5-extract-id-from-params` branch
* You may optionally install the plugin **Git History Diff** for viewing the difference between git branches. This will allow you to easily compare your work with the sample solution
* [https://marketplace.visualstudio.com/items?itemName=huizhou.githd](https://marketplace.visualstudio.com/items?itemName=huizhou.githd)
* Next checkout to the solution branch and we will now walk through the sample solution

  ```text
  git checkout 6-extract-id-from-params-solution
  ```

* To view the difference between your work and the sample solution go to the VS Code file explorer, right click your folder and select `GitHD: View Folder Diff` and select compare with `5-extract-id-from-params` branch
* The diff sidebar will popup and you can click on the files to view the difference between your work and the sample solution.
* When viewing the diff you can temporarily toggle the sidebar with `cmd + B` to hide it.

