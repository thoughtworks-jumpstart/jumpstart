# Parsing request body

Let's take a look at one useful middleware: [express.json](https://expressjs.com/en/api.html#express.json).

When you send HTTP PUT or POST requests, there are usually some data attached in the request body. If the request is a result of clicking "submit" button from a web form, the data is usually encoded in [x-www-form-urlencoded](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST) format. Otherwise, if the request is initiated by the JavaScript codes from your frontend application, then the data is usually in JSON format.

Since it's a common requirements to parse the data in request body, express comes with this reusable JSON middleware. Basically, what this library does is to parse the data according to the format mentioned in HTTP request header, then save the parsed data in `req.body` field.

Now let's take a look at the example in `body_parser_example.js`.

In order to register this middleware to parse JSON data in request body, we just need to add one line:

```text
app.use(express.json());
```

To run this example:

```text
node body_parser_example.js
```

Once you start the service, create a POST request to the URL [http://localhost:3000/users](http://localhost:3000/users) with the following JSON payload:

```javascript
{
    "name": "Gordon",
    "gender": "M"
}
```

You can send the request using tools like [postman](https://www.getpostman.com/) or [insomnia](https://insomnia.rest/).

You should also see response from the server side claiming the user is created successfully.

