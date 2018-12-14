# Comparing 3 approaches

In the code snippet below, you can compare and contrast the syntax differences between callbacks, promises and async await.

This snippet will be better understood if you have covered the chapters on `express` and `mongoose`. Nonetheless, even if you haven't learned those, it can still be useful to compare how the same thing is done in the 3 different flavours of handling asynchronous methods.

Note: In this case, `Book.find({})` is an asynchronous method defined by `mongoose`, and it supports all 3 callback approaches. If no function is passed in as a second argument in `Book.find()`, it will return a promise \(and hence you can use `.then()` or async await\).

```javascript
router.get("/", function(req, res, next) {
  // 1. using a "old-style" callback function:
  Book.find({}, function(err, books) {
    if (err) next(err);
    res.json({ message: "respond with all books", books: books });
  });
});


router.get("/", function(req, res, next) {
  // 2. using .then() 
  Book.find({})
    .then(function(books) {
      res.json({ message: "respond with all books", books: books });
    })
    .catch(function(err) {
      next(err)
    });
});

// 3. using async await
router.get("/", async function(req, res, next) {
  try {
    const books = await Book.find({});
    res.json({ message: "respond with all books", books: books });
  } catch (err) {
    next(err)
  }
});
```

## Recommended Reading

- [The Evolution of Async JavaScript: From Callbacks, to Promises, to Async/Await](https://tylermcginnis.com/async-javascript-from-callbacks-to-promises-to-async-await/)
- [Async JavaScript, a Pocket Reference](https://medium.com/@ajmeyghani/async-javascript-a-pocket-reference-2bb16ac40d21)
