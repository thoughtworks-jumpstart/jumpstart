# Parsing path params (Part 1)

## You can capture parameters in your route path

Route parameters are named URL segments that are used to capture the values specified at their position in the URL. The captured values are populated in the req.params object, with the name of the route parameter specified in the path as their respective keys.

For example

```text
Route path: /users/:userId/books/:bookId
Request URL: http://localhost:3000/users/34/books/8989
req.params: { "userId": "34", "bookId": "8989" }
```

To see this in action, take a look at `route_parameter_example_1.js`

```text
node route_parameter_example_1.js
```

If you visit the URL [http://localhost:3000/users/34/books/8989](http://localhost:3000/users/34/books/8989), you can see the parameters are captured in the `req.params` object.