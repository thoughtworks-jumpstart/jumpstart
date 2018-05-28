# Template strings

- Syntax
    - use backticks (\`\`) instead of '' or ""
    - variable interpolation with `${someVariable}`
    - Example:

```javascript
// with template strings
const myName = "alice"
const friendName = "bob"
const greeting = `hello i am ${myName} and this is my friend ${friendName}`
console.log(greeting)

// the old (and suboptimal) way
const greeting = "hello i am " + myName + "and this is my friend" + friendName
console.log(greeting)
```

- Why it's awesome
    - no more awkward `"this is number " + var1 + "and number " + va2 + "oh did i forget" + var1 + " space here?"`
    - you can write multiline strings

```javascript
const htmlFragment = `
    <h1> Hello World </h1>
    <div> Template strings are awesome!</div>
`
```
- you can use javascript logic in template strings

```javascript
const people = ['tom', 'bob', 'joe']
const htmlFragment = `
    ${people.map( person => `
        <li>this is ${person}</li>
    `)}
`
```