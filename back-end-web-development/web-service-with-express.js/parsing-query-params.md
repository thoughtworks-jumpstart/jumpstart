# Parsing query params

In HTTP, a query string is the part of a uniform resource locator (URL) which assigns values to specified optional parameters. 

## Filtering in Express when there are multiple query parameters


To see this in action, take a look at `query_parameter_example.js`

```text
node query_parameter_example.js
```

You can use Insomnia to send requests with different query parameters to the example and check out how it can be used to filter and return a subset of the fruit and vegetable data. 

### Filter by the type (eg: FRUIT or VEGETABLE)

```
http://localhost:3000/food?type=VEGETABLE
```

### Filter by the color

```
http://localhost:3000/food?color=red
```

### Filter by both type and color

```
http://localhost:3000/food?type=VEGETABLE&color=red
```

```javascript
const express = require("express");
const app = express();

const data = [
  {
    id: 1,
    type: "FRUIT",
    name: "Banana",
    color: "yellow"
  },
  {
    id: 2,
    type: "FRUIT",
    name: "Tomato",
    color: "red"
  },
  {
    id: 3,
    type: "VEGETABLE",
    name: "Broccoli",
    color: "green"
  },
  {
    id: 4,
    type: "VEGETABLE",
    name: "Red pepper",
    color: "red"
  }
];

app.get("/food", (req, res) => {
  console.log(req.query);

  const results = data
    // Using if statements
    .filter(item => {
      if (req.query.type) {
        return item.type === req.query.type;
      }

      return true;
    })
    // Using the ternary operator
    .filter(item => (req.query.name ? item.name === req.query.name : true))
    .filter(item => (req.query.color ? item.color === req.query.color : true));

  res.json(results);
});

const server = app.listen(3000, function() {
    console.log("Application started....");
});
```

