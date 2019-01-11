# Web Service with MongoDB

In this section, we are going to learn how to work with MongoDB.

## What is MongoDB

MongoDB is one of the **NoSQL** databases, more specifically, it's a **document** database, because it stores documents in BSON\(a binary form of JSON\) format like the one below:

```javascript
{
  firstName: "Gordon",
  lastName: "Song"
}
```

A document then is placed within a **collection**. As an example, the JSON document above defines a `user` object. This user object then would typically be part of a collection called `users`. For those who are familiar with relational databases, a collection in MongoDB is similar to a table in relational database, and a document in MongoDB is similar to a row in relational databases.

Here are some of the key concepts:

* Database
* [Collection ~ Table](https://docs.mongodb.com/manual/core/databases-and-collections/)
* [Document ~ Row \(without Schema\)](https://docs.mongodb.com/manual/core/document/)
* Each document has a "\_id" field which is a GUID \(Globally Unique Identifier\)
* [Index](https://docs.mongodb.com/manual/indexes/)
* [Query](https://docs.mongodb.com/manual/crud/)
* [Reference](https://docs.mongodb.com/manual/reference/database-references/index.html)

Here are some of the features it offers:

* MongoDB stores data in flexible, JSON-like documents, meaning fields can vary from document to document and data structure can be changed over time
* The document model maps to the objects in your application code, making data easy to work with
* MongoDB is a distributed database at its core, so [high availability](https://en.wikipedia.org/wiki/High_availability), [horizontal scaling](https://stackoverflow.com/questions/11707879/difference-between-scaling-horizontally-and-vertically-for-databases), and [geographic distribution](https://en.wikipedia.org/wiki/Distributed_database) are built in and easy to use
* [Join of documents across collections](https://docs.mongodb.com/manual/reference/operator/aggregation/lookup/)
* \(Starting from 4.0 release\), [ACID transaction across multiple documents is also supported](https://www.mongodb.com/transactions)
* MongoDB creates databases and collections on demand if they do not already exist.

More information can be found on their [documentation website](https://docs.mongodb.com/manual/introduction/)

And here is [a good comparison between MongoDB and relational DB \(e.g. PostgresSQL\)](https://www.mongodb.com/compare/mongodb-postgresql)

## Resources

* [Introduction to MongoDB](https://github.com/azat-co/fullstack-javascript/blob/master/chapter7/chapter7.md)