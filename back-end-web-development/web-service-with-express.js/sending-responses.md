# Sending responses

The route handler usually needs to call a method on the response object to send back some responses.

Here are a few common ways to send back responses:

| Method                               | Description                                                     |
| :----------------------------------- | :-------------------------------------------------------------- |
| res.status\(yourResponseStatusCode\) | Send HTTP status response code \(e.g. 200, 404, etc\)           |
| res.json\(yourResponse\)             | Send a JSON response.                                           |
| res.send\(yourResponse\)             | Send a response of various formats (e.g. plain text, html, etc) |

## Example: Setting status code in response

```javascript
res.status(200).send("OK");
```

That is the same as

```javascript
res.sendStatus(200);
```

## Example: Send back a JSON in response body

```javascript
res.set("Content-Type", "application/json").send({ name: "Jon", age: 30 });
```

The same thing can we written as

```javascript
res.json({ name: "Jon", age: 30 });
```

## Example: Send back a JSON in response when error happens

```javascript
res.status(500).json({ error: "some unexpected error" });
```

## Reference

Here are some other ways to send back responses. Find out their details on [Express Framework documentation](https://expressjs.com/en/4x/api.html#res)

| Method           | Description                                                                                      |
| :--------------- | :----------------------------------------------------------------------------------------------- |
| res.write\(\)    | Write some data to the response buffer, but don't send it until you call res.end\(\)             |
| res.end\(\)      | End the response process.                                                                        |
| res.redirect\(\) | Redirect a request.                                                                              |
| res.download\(\) | Prompt a file to be downloaded.                                                                  |
| res.jsonp\(\)    | Send a JSON response with [JSONP support](https://cameronspear.com/blog/exactly-what-is-jsonp/). |
| res.render\(\)   | Render a [view template](https://expressjs.com/en/guide/using-template-engines.html).            |
| res.sendFile\(\) | Send a file as attachment in response.                                                           |

### What's the difference between `res.send()` and `res.write()` API?

The major difference is the `send()` API automatically set `Content-Type` in response header. That's handy sometimes, but if you call `send()` API multiple times, you will get error like "Can't set headers after they are sent."

To avoid that issue, you can set `Content-Type` response header by yourself, call `res.write()` multiple times, and call `res.end()` at last.

A more detailed comparison can be found [here](https://www.gitbook.com/book/kevinchisholm/sending-multiple-http-responses-with-express-js/details) and [here](https://stackoverflow.com/questions/44692048/what-is-the-difference-between-res-send-and-res-write-in-express)
