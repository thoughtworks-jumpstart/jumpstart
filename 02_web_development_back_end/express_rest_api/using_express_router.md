### Introducing express.Router()

For a very small app, we can define all the API endpoints in one file, like what we did in the previous examples. However, as our application grows, it's a good idea to break the application into smaller modules. In terms of the API end points, it would be better to group API endpoints by their nature.

For example, if we are implementing an API for the library system, the API endpoint for `users` and `books` can be put into their own module. This is illustrated in the example `express_basic_example_with_router.js`.

This example uses one feature supported by Express Framework called `Router`. Each Router is like a `mini-app`, which means it can contain its own API endpoints (together with many other things such as middleware and error handlers, as you will notice later.)

To see this example in action:

```
node express_basic_example_with_router.js
```

Then visit URLs like 
```
http://localhost:3000/users/
http://localhost:3000/users/gordon
http://localhost:3000/books/
http://localhost:3000/books/joy_in_clojure
```

You can see all the API points work as expected.

To get better understanding on Routing in Express, checkout [the official guide]( https://expressjs.com/en/guide/routing.html) 
