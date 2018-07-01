# REST API & CRUD

In this section, we are going to talk about one of the popular conventions in building web-service APIs. It's called REST API.

## Learning checklist

* What is REST API?
  * What are the resources?
  * How does the HTTP methods \(get/post/put/delete\) relate to the CRUD operations on the resource?
* Best Practices for REST API design
  * Return proper HTTP status codes
  * Follow some naming convention on resources: plural or singular?
  * Evolving API over time
    * Versioning and backward compatibility
  * Document your API
* Anti-patterns of Restful API design
* REST API in the real world
  * What if PUT/DELETE is not supported?
  * Limitations of GET API
  * What about actions that don't fit into the world of CRUD operations?
  * Be aware of caching 
* Security and REST API
  * Cross Origin Resource Sharing \(CORS\)
  * Hide exception details in production
* What are the other API styles?
  * GraphQL
  * RPC\(e.g.SOAP\)

### What is REST API?

It's an architectural style for building web service APIs.

REST stands for "Representational State Transfer". This term is very abstract. Don't mind about it, just remember REST.

Its core principle is to define named **resources** that can be manipulated using a small number of **methods** \(such as Creation/Read/Update/Delete\). The resources and methods are known as nouns and verbs of APIs.

For example, in a blog platform, we may have the following resources:

* Users of the platform
* Articles publishes by authors
* Comments made by readers

With the HTTP protocol, the resource names naturally map to URLs, and methods to manipulate those resources naturally map to HTTP methods POST, GET, PUT, PATCH, and DELETE.

Check out this link to see more details on [HTTP Methods and CRUD Mapping](http://www.restapitutorial.com/lessons/httpmethods.html)

Now take a look at [one sample REST API for a blog platform](https://thinkster.io/tutorials/design-a-robust-json-api/crud-endpoints)

### REST API Best Practices

#### Return proper HTTP status codes

HTTP protocol defines a set of status codes that you can use in HTTP responses. Make sure you understand the meaning of commonly used HTTP status codes and use them appropriately in your APIs.

* 200 OK
* 201 Created
* 302 Found
* 400 Bad Request
* 401 Unauthorized
* 403 Forbidden
* 404 Not Found

Some documentation on status codes can be found [here](http://www.restapitutorial.com/httpstatuscodes.html)

#### Follow naming convention on resources

In deciding what resources are within your system, name them as nouns as opposed to verbs or actions. In other words, a REST URI should refer to a resource that is a thing instead of referring to an action.

Since those resources are nouns, you need to decide if you should use singular form or plural form. The question to answer here is: Should URI nodes in your hierarchy be named using singular or plural nouns? For example, should your URI for retrieving a representation of a customer resource look like this:

GET [http://www.example.com/\*\*customer\*\*/33245](http://www.example.com/**customer**/33245) or: GET [http://www.example.com/\*\*customers\*\*/33245](http://www.example.com/**customers**/33245)

There are good arguments on both sides, but the commonly-accepted practice is to **always use plurals in node names** to keep your API URIs consistent across all HTTP methods. The reasoning is based on the concept that customers are a collection within the service suite and the ID \(e.g. 33245\) refers to one of those customers in the collection.

But, like all the rules, there are exceptions. One situation is when there isn't a collection concept in play. In other words, it's acceptable to use a singularized resource name when there can only be one of the resource — it's a singleton resource. For example, if there was a single, overarching configuration resource, you might use a singularized noun to represent that:

```text
GET|PUT|DELETE http://www.example.com/configuration
```

To get more examples on how to name your resource, checkout this tutorial on [Resource Naming](http://www.restapitutorial.com/lessons/restfulresourcenaming.html)

#### Make APIs Idempotent

From a REST service standpoint, for an operation \(or service call\) to be idempotent, clients can make that same call repeatedly, and the status of the resource reach the same end state no matter how many calls are made. In other words, with an idempotent API, making multiple identical requests has the same effect as making a single request.

An API with this property makes the consumer's life much easier.

For example, assuming we have this API to delete a user

```text
DELETE /users/101
```

If the API returns error when the user with ID 101 does not exist, then an API consumer has to check the status of the user before calling this delete API.

On the other hand, if the effect of calling the API ensures the user is deleted, no matter how many times it's called, then the API consumer can call it safely without worrying about if the user has been deleted or not.

A bit longer explanation on this topic can be found [here](http://www.restapitutorial.com/lessons/idempotency.html)

#### Evolving APIs over time

Once an API is defined, you may need to update the implementation from time to time. And sometimes, the changes may not be backward compatible to the existing API consumers. What should you do in this case?

There are many choices under this situation. One popular choice is to add a version number in your API URL, then you can create a new version of your API when there are non-backward compatible changes.

For example:

```text
GET /v2/users/1/profile
```

More choices for this situation can be found [here](http://www.lexicalscope.com/blog/2012/03/12/how-are-rest-apis-versioned/)

### Documenting your API

Just as you need to write good documentations for your program, you should also provide good documentation on the web service APIs.

There are quite a few tools in the market now that can help you to document your APIs, two of them are listed here:

* [https://swagger.io/](https://swagger.io/)
* [https://raml.org/](https://raml.org/)
* [https://apiblueprint.org/](https://apiblueprint.org/)

### REST API Anti-Patterns

Let's look at some of the bad examples on designing APIs.\(There examples are shamelessly copied from [here](http://www.restapitutorial.com/lessons/restfulresourcenaming.html)\)

First up, often services use a single URI to specify the service interface, using query-string parameters to specify the requested operation and/or HTTP verb. For example to update customer with ID 12345, the request for a JSON body might be:

```text
// bad
GET http://api.example.com/services?op=update_customer&id=12345&format=json

// good
todo: add good example
```

By now, you're above doing this. Even though the 'services' URL node is a noun, this URL is not self- descriptive as the URI hierarchy is the same for all requests. Plus, it uses GET as the HTTP verb even though we're performing an update. This is counter-intuitive and is painful \(even dangerous\) to use as a client.

Here's another example following the same operation of updating a customer:

```text
// bad
GET http://api.example.com/update_customer/12345

// good
todo: add good example
```

And its evil twin:

```text
// bad
GET http://api.example.com/customers/12345/update

// good
todo: add good example
```

### REST API in the real world

#### What if PUT/DELETE is not supported?

The original REST API proposal mentions we can use all HTTP verbs including GET/POST/PUT/DELETE to specify the intended operation on a resource. However, in reality, sometimes you cannot use PUT/DELETE:

* Some of the API client \(e.g. browsers\) only support GET/POST 
* Some of the corporate firewalls block HTTP connection with PUT and DELETE methods

In those situations, you might be forced to only support GET/POST methods for your REST API. One of the solutions is to use a request header called `X-HTTP-Method-Override` to specify the real HTTP method associated with a request.

For example, a request may looks like

```text
POST /api/Person/4 HTTP/1.1
Host: localhost:10320
Content-Type: application/json
X-HTTP-Method-Override: PUT
```

The API implementer can check this header and figure out the exact intention.

#### Limitations of HTTP GET method

When using HTTP GET method, you typically need to send some query strings, for example

```text
GET /api/users?country=SG&age=M&hobby=football..
```

You need to be aware that there is a size limit on the total length of the URL, which is [somewhere between 2KB and 8KB](https://stackoverflow.com/questions/2659952/maximum-length-of-http-get-request).

#### Can I use request body with HTTP GET method?

Since there is a size limit on the URL length of GET method, can I put the data into the request body? Technically you can do that, but it's not a good idea. One of the reasons is the request body is not cached when browser \(or the server side\) caches a request.

More discussions can be found [here](https://stackoverflow.com/questions/978061/http-get-with-request-body)

#### What about the operations that can't be mapped to CRUD operations?

For example, if you want to build an API to search users, this "search" operation is not one of those standard CRUD operation, then which HTTP method should you use? how to design your resource URL?

You can find some discussions on Stack Overflow:

* [https://stackoverflow.com/questions/207477/restful-url-design-for-search](https://stackoverflow.com/questions/207477/restful-url-design-for-search)
* [https://stackoverflow.com/questions/5020704/how-to-design-restful-search-filtering](https://stackoverflow.com/questions/5020704/how-to-design-restful-search-filtering)

#### Be aware of caching

The result of HTTP GET methods might be cached by the browsers \(and the intermediate routers in the network\). As an API developer, you can control how those responses are cached using [Cache Control Headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Cache-Control)

### Security and REST API

#### Cross-Origin Resource Sharing \(CORS\)

By default, the Javascript running on a website can only make connections to the same server where the website was downloaded. This is called [Same Origin Policy](https://developer.mozilla.org/en-US/docs/Web/Security/Same-origin_policy)

This is a security feature to prevent malicious Javascript code to submit user data \(loaded from the website\) to another server controlled by hackers.

However, sometimes this policy is a bit too restrictive and we do have genuine reasons to consume an public API that is hosted on different servers.

CORS is designed to address these needs.

You can find more information [here](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) and [here](https://www.html5rocks.com/en/tutorials/cors/) and [here](https://medium.com/@baphemot/understanding-cors-18ad6b478e2b)

#### Hiding server side exceptions in production environment

When some request cannot be served due to some errors, it's a good practice to include some error information in the HTTP response body so that the API client can respond accordingly \(e.g. display some meaningful error messages to the users\).

While doing this, we need to be careful that we don't send internal server error details \(e.g. stack trace from unhandled server errors\) back to the API client, especially in production environment. Those internal server errors may reveal too much sensitive information that may help hackers to figure out how to exploit the loopholes in those servers/libraries.

### \(Optional\) Other API Styles

#### RPC

[RPC \(Remote Procedure Call\)](https://en.wikipedia.org/wiki/Remote_procedure_call) is when a computer program causes a procedure \(subroutine\) to execute in a different address space \(commonly on another computer on a shared network\), which is coded as if it were a normal \(local\) procedure call, without the programmer explicitly coding the details for the remote interaction.

Two examples are:

* SOAP
* XML-RPC
* [gRPC](https://grpc.io/)

#### GraphQL

[GraphQL](http://graphql.org/) is a query language for APIs and a runtime for fulfilling those queries with your existing data. GraphQL provides a complete and understandable description of the data in your API, gives clients the power to ask for exactly what they need and nothing more, makes it easier to evolve APIs over time, and enables powerful developer tools.

* [GraphQL at the REST-aurant](https://medium.com/javascript-scene/graphql-at-the-rest-aurant-f4091054e82a)
* [What is the GraphQL thing I keep hearing about?](https://medium.freecodecamp.org/so-whats-this-graphql-thing-i-keep-hearing-about-baf4d36c20cf)
* [GraphQL vs REST](https://dev-blog.apollodata.com/graphql-vs-rest-5d425123e34b)

You can [explore GitHub using their GraphQL API](https://developer.github.com/v4/explorer/)

### References

* [Introduction](http://www.restapitutorial.com/lessons/whatisrest.html)
* [REST API concepts and examples](https://www.youtube.com/watch?v=7YcW25PHnAA)
* [The original paper on REST API](https://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm)
* [API design cheat sheet](https://github.com/RestCheatSheet/api-cheat-sheet)
* [Microsoft REST API Guideline](https://github.com/Microsoft/api-guidelines/blob/master/Guidelines.md)
* [REST API Guidelines](http://zalando.github.io/restful-api-guidelines/)

### Resources

* [A few good books on RESTful API](http://whatpixel.com/best-rest-restful-api-books/)
* [More books on API design](https://techbeacon.com/guide-restful-api-design-35-must-reads)
* [Collection of API Design Guides](http://apistylebook.com/design/guidelines/)

#### Recommended reading

* [Best Practices for Designing a Pragmatic RESTful API](http://www.vinaysahni.com/best-practices-for-a-pragmatic-restful-api)
* [10 Best Practices for Writing Node.js REST APIs](https://medium.com/the-node-js-collection/10-best-practices-for-writing-node-js-rest-apis-7643a7765cd)
* [HTTP API Design Guide](https://geemus.gitbooks.io/http-api-design/content/en/)
* [The Little Mannual on API Design](http://www4.in.tum.de/~blanchet/api-design.pdf)

### Lab 1

Let's use a REST API client called [Insomnia](https://insomnia.rest/) to play with one sample REST API.

The sample REST API can be found at [https://jumpstart-blogging-api.herokuapp.com/](https://jumpstart-blogging-api.herokuapp.com/)

The API supports CRUD operations on two resources

* blogpost
* user

If you try to `GET https://jumpstart-blogging-api.herokuapp.com/`, you can find the supported CRUD operations.

```javascript
{
    "0": "GET    /",
    "1": "-----------------------",
    "2": "GET    /blogposts",
    "3": "GET    /blogposts/:id",
    "4": "POST   /blogposts",
    "5": "PUT    /blogposts/:id",
    "6": "DELETE    /blogposts/:id",
    "7": "-----------------------",
    "8": "GET    /users",
    "9": "GET    /users/:id",
    "10": "POST    /users",
    "11": "PUT    /users/:id",
    "12": "DELETE    /users/:id"
}
```

Try to create more users and blog posts by calling the API using Insomnia.

To create/update a user, you need to include a JSON string in the HTTP request body, like the one below

```javascript
{
    "username": "gordon",
    "age": 28
}
```

To create/update a blogpost, you need to include a JSON string in the HTTP request body, like the one below

```javascript
{
    "title": "This is my FIFTH blogpost",
    "body": "Put your content here...",
    "author": "gordon",
    "likes": 20,
    "image_url": "https://static.pexels.com/photos/62418/pexels-photo-62418.jpeg"
}
```

### Lab 2

Singapore Government builds one website \([data.gov.sg](https://data.gov.sg/developer)\) that publish a lot of useful data via API.

Play with the APIs and see if you can build some useful frontend applications that visualize those data.

