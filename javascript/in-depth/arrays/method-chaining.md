# method chaining

Because `.map()` and `filter()` returns arrays, we can chain on other Array methods \(e.g. `.map()`, `.filter()`, `.reduce()`, `.every()`, `.some()`\) to create elegant one-line solutions!

```javascript
// Task:
// 1. filter groceries to get an array containing only items on discount
// 2. map over filtered array to get an array of prices including GST
// 3. reduce array of prices with GST to get total price 
const groceries = [{
  itemName: 'eggs',
  isOnDiscount: true,
  price: 2
},
{
  itemName: 'milk',
  isOnDiscount: false,
  price: 5
},
{
  itemName: 'chicken',
  isOnDiscount: true,
  price: 10
},
{
  itemName: 'biscuits',
  isOnDiscount: false,
  price: 3
}]

// one line solution
groceries
  .filter(element => element['isOnDiscount'])   // get items on discount
  .map(element => element.price * 1.09)         // map price to price*GST
  .reduce((accumulator, element) => accumulator + element) // reduce array of prices to get total price

// let's break it down

const discountedItems = groceries.filter(element => element['isOnDiscount'])
const pricesWithGST = discountedItems.map(element => element.price * 1.09)
const totalPrice = pricesWithGST.reduce((accumulator, element) => accumulator + element)
```

