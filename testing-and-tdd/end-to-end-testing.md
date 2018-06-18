# End-to-end Testing

Also known as 'e2e tests', 'functional tests', '\(automated\) acceptance tests'.

libraries: [`cypress`](https://www.cypress.io/), `selenium`

## Learning checklist

* How to write an e2e test with cypress
* How to make sense of the console
* How to navigate undo/redo history on the sidebar
* Structuring e2e tests as user journeys

## In-class exercise:

Install and run cypress

* Create npm project: `mkdir learn-cypress & cd learn-cypress`
* Install cypress: `npm install cypress`
* Add the cypress open script to package json:

```javascript
"scripts": {
  "test:cypress": "cypress open",           // run in browser
  "test:cypress-headless": "cypress run",   // run headless - useful in CI
}
```

* Run cypress demo script: `npm run test:cypress`

Write our own cypress tests to test www.google.com!

* Create a `google_spec.js` file inside `cypress/integration/`
* Open `example_spec.js` in a split pane view in your editor, for your reference
* Write cypress tests to test google.com
  * you should take reference from `example_spec.js`
  * you should open up www.google.com in a separate page and inspect the DOM elements to find out the HTML tag/class/ids
  * feel free to test anything
  * make sure you try the following APIs
    * `cy`
      * `.visit()`
      * `.get()` \(try the different DOM query selectors - e.g. `button`, `.some-class`, `#some-id`, \`\`\)
      * `.find("input")`
    * assertions
      * `.should()`, `.should("contain", "Button")`, `.should("have.class", "some-awesome-class")`
      * `.should("contain", "something").and("contain", "something else")`
      * `.contains()`
    * interact
      * `.type('something')`,  `.type({enter})`, `.type({selectall})`
      * `.click()`
      * `.check()`
      * `.wait(500)`

## Resources

### References

* Cypress API docs
  * [`should`](https://docs.cypress.io/api/commands/should.html#Syntax)
  * [`contains`](https://docs.cypress.io/api/commands/contains.html)
  * [`get`](https://docs.cypress.io/api/commands/get.html)
  * [`type`](https://docs.cypress.io/api/commands/type.html)
  * and much more! when in doubt, refer to the API docs 

