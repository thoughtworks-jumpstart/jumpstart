# Parsing query parameters

## Filtering in Express when there are multiple query parameters

```javascript
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
```
