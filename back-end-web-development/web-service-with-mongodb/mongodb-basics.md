# MongoDB Basics

## Starting mongo server

```bash
  mongod --dbpath /data/db
```

if you installed with homebrew

```bash
   brew services start mongodb
```

## opening the mongo shell

```bash
  mongo
```

## MongoDB terminlogy

1. Database: a structured set of data within a persisted sotrage.
2. Collections: Similar to table id Relational Database, contains a set of documents.
3. Documents: a json like object containing related fields.
4. Fields: Key value pair within a document.

Example:
In a Stores Database, you can have a collection that contains the information of stores.
The infomation of a store can be contained within a document. The document will contain key, value pairs with related details of the store.

```
Stores: [
  {
    “Name”: “AB Chicken Rice”,
    “Dishes”: [
      { name: “steamed chicken rice”, price: 3.5}
      { name: “roasted chicken rice”, price: 3}
    ]
  }
  ...
]
```

## Basic mongo shell commands

```bash
mongod      // start mongo server
mongo       // start shell
db.stats()  // db information
show dbs    // show databases
use stores    // use db
show collections
```

### creating a database

The first the when you run `use stores`, the database not been created. Try running `show dbs` again and you will realise the `stores` database has not been created. The store will automatically be created once the first document is inserted into a collection within the database.

### inserting the first document

Lets insert our first document.
Run `show collections`. A newly created db will have no collections.
Next, run `db.stores.insertOne({name: "Salad Stop", dishes: [{name: "salad", price: 8.0}]})`.
Rerun `show collections`, now the collection is created. This is called a implicite creation whereby the collection is created automatically when the store data is inserted.

## CRUD

Create Read Update and Delete are the 4 basic functions of persisting data into the database.

## Create

In mongodb. Create is usually done with the command insert.

```
insert: (document, { writeConcern, ordered })
insertOne: (document, { writeConcern })
insertMany: (document, { writeConcern, ordered })
```

The insert command can take in both an array and a object giving good flexibility in usage. However, it does not return you the document \_id since it doesn't validate that a insertion is successful.

```
> db.stores.insert({name: "NTUC"})
WriteResult({ "nInserted" : 1 })
```

Is advisable to use `insertOne` or `insertMany` as they return you the objectId.

```
> db.stores.insertOne({name: "Salad Stop", dishes: [{name: "salad", price: 8.0}]})
{
	"acknowledged" : true,
	"insertedId" : ObjectId("5d15c4a1e057ea4160d542ff")
}
```

### MongoDB supports schema validation.

If you want data validation on a collection, you can do so using the `createCollection` to explicitly create one.

```
db.createCollection("students", {
   validator: {
      $jsonSchema: {
         bsonType: "object", required: [ "name", "year"], properties: {
            name: { bsonType: "string", description: "must be a string and is required" },
            year: {  bsonType: "int", minimum: 2017, maximum: 3017, exclusiveMaximum: false, description: "must be an integer in [ 2017, 3017 ] and is required" },



});

For more information, refer to the mongodb docs
https://docs.mongodb.com/manual/core/schema-validation/

In real life project, you often will create validation rules, but you can do so using a Object Document Mapper(ODM). This makes it a lot easier to create a document with validations.
```

## Use mongoimport command to import data

```
mongoimport --db <db> --collection <collection> --type json --file ./<jsonFile> --jsonArray --drop
```

- the mongoimport command imports the data specific collections
- --drop flag drops exisiting data in the collection and import them with new ones.

### lab1

`git clone https://github.com/thoughtworks-jumpstart/mongo-basics.git`

Open 'lab1.md' and follow the instructions.

## Read

```
find:  (query, projection)
findOne: (query, projection)
```

### Basics queries

- Use `count` method to get the total number of records.
- Use `find` method to search the content in collections

```
db.pokemon.count()
db.pokemon.find()
db.pokemon.find().pretty()
db.pokemon.find({id: 25}).pretty()
db.pokemon.find({"name.english": "Pikachu"}).pretty()
```

### Conditional queries

conditional quries allow us to find a subset of the quries base on certain conditions. You can find all the conditional quries here.
https://docs.mongodb.com/v3.2/reference/operator/query/

```
Comparisons: $gt, $lt, $in
Logical: $and, $nor, $or and $not
Element: $exist
Array: $all, $elematch
```

#### Comparison query:

- `{field: {comparison operator: value}}`

```
db.pokemon.find({"base.Attack": {$gt: 150}}).count()
db.pokemon.find({ "base.Attack": {$gt: 150}}).pretty()
db.pokemon.find({type: {$in: ["Steel", "Electric"]}})

```

#### Logical quries:

- `{logicalQuries}: [{field1: value1}, {field2: value2}]`
- `{logicalQuries}: {field: value}`

```
db.pokemon.find({$and:[{type: "Psychic"}, {type: "Electric"}] }).pretty()
db.pokemon.find({$or:[{type: "Psychic"}, {"base.Attack": {$gt: 120}}] }).pretty()
db.pokemon.find({"base.Attack": {$not: {$lte: 150}}}).count()
```

#### Element quries:

```
db.pokemon.find({"type": {$exists: true}})
```

#### Array quries:

```
db.pokemon.find({type: {$all: ["Dragon", "Water"]}})
db.pokemon.find({type: {$in: ["Dragon", "Water"]}})
```

#### Matching containing string

```
db.pokemon.find({"name.english": {$regex: ".*Mew.*"}}).pretty()
```

### Projections

- fetching only the fields you want
- Benefit: Save data over bandwidth, taking only what you want make things less confusing for yourself.

Inserting the test data

```
db.food.insertOne({name: "chicken rice", price: 3.5, calories: 700});
```

Showing specific fields:

```
db.food.find({}, {name: 1})
```

Note that the above scenario, ``we ask for only name to be projected by \_id was return to us too. To hide \_id we need to specify it.

```
db.food.find({}, {_id: 0, name: 1})
```

To show all fields except name

```
db.food.find({}, {name: 0}) // show all except name
```
