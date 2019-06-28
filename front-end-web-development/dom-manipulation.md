# DOM manipulation

## Learning objectives

* What is the DOM?
* Why do we need it?
* How do we use it?
  * How to select elements from the DOM using selectors
  * How to manipulate elements using `.textContent` and `.classList`
  * How to add event listeners
  * how to trigger and respond to events
    * `event.preventDefault()`
  * Recipes for creating/adding/removing HTML elements using javascript

## Code along template

[https://github.com/thoughtworks-jumpstart/dom-manipulation](https://github.com/thoughtworks-jumpstart/dom-manipulation)

## What is the DOM

![Example DOM Tree](../.gitbook/assets/dom-tree.png)

The Document Object Model \(DOM\) is an in-memory representation of HTML documents. It represents the web page as a javascript object \(`document`\) so that javascript programs can traverse and modify the document structure, style, and content.

Imagine an HTML page with the following structure:

```markup
<html>
<head>
    <title>Some title</title>
</head>
<body>
    <p>First paragraph</p>
    <p>Second paragraph</p>
</body>
</html>
```

The browser exposes a JavaScript interface to query and manipulate this HTML using a global variable called `document`. Using plain JS objects and arrays, the DOM can be thought to resemble a structure similar to the following:

```javascript
document = {
    querySelector() { ... },
    querySelectorAll() { ... },
    createElement() { ... },
    children: [
        {
            tagName: 'HTML',
            textContent: '...',
            children: [
                {
                    tagName: 'head',
                    children: [ ... ],
                },
                {
                    tagName: 'body',
                    children: [
                        {
                            tagName: 'p',
                            textContent: 'First paragraph',
                        },
                        {
                            tagName: 'p',
                            textContent: 'Second paragraph',
                        },
                    ]
                }
            ]
        }
    ]
};
```

Note that this is a model of the DOM, but not how the DOM is actually implemented in the browser.

We can also try to visualize the DOM tree of a given HTML document using [this tool](http://bioub.github.io/d3.DOMVisualizer/).

As you can see, there are different types of nodes in a DOM tree:

* Element Nodes
* Text Nodes

## DOM manipulation with JavaScript

In this session, we are going to learn how to manipulate a DOM object using the API it offers.

To start with, let's have a glance with the APIs we need to be familiar with:

* [Document](https://developer.mozilla.org/en-US/docs/Web/API/Document)
  * [querySelector](https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelector)
  * [querySelectorForAll](https://developer.mozilla.org/en-US/docs/Web/API/Document/querySelectorAll)
* [Node](https://developer.mozilla.org/en-US/docs/Web/API/Node)
  * [parentNode](https://developer.mozilla.org/en-US/docs/Web/API/Node/parentNode)
  * [childNodes](https://developer.mozilla.org/en-US/docs/Web/API/Node/childNodes)
* [Element](https://developer.mozilla.org/en-US/docs/Web/API/Element)
  * [className](https://developer.mozilla.org/en-US/docs/Web/API/Element/className)
  * [classList](https://developer.mozilla.org/en-US/docs/Web/API/Element/classList)
  * [innerHTML](https://developer.mozilla.org/en-US/docs/Web/API/Element/innerHTML)
  * [setAttribute](https://developer.mozilla.org/en-US/docs/Web/API/Element/setAttribute)

Some of the APIs may return multiple nodes as [NodeList](https://developer.mozilla.org/en-US/docs/Web/API/NodeList). It's an [array-like object](http://2ality.com/2013/05/quirk-array-like-objects.html) that you can iterate through and get the nodes one-by-one.

This may sound boring now, but basically all interactive webpages that you've visited \(e.g. [Stripe Connect](https://stripe.com/blog/connect-front-end-experience), [pac-man](https://codepen.io/hellokatili/pen/xwKRmo), [Fancy Checkout](https://github.com/gabriellamas/Fancy-Checkout) \) are possible because the DOM interface lets us manipulate the contents of a webpage without refreshing a page!

### How to select elements from the DOM using selectors

```markup
<div id="greeting">Hello World!</div>
```

```javascript
let greetingDiv = document.getElementById("greeting");
console.log(greetingDiv);
```

Note: to refer to the current document object, you can use the global variable `document`.

Other element selectors:

```javascript
// by class name
// (Note: methods which say getElements... (instead of getElement...) return an array)
document.getElementsByClassName("some-class");

// by HTML tag name (this returns an array)
document.getElementsByTagName("h1");

// by css query selector syntax
document.querySelector("li.my-specific-class");
document.querySelector("li#my-specific-id");

// selecting more than 1 element (this returns an array of all html elements meeting the criteria)
document.querySelectorAll("li");
document.querySelectorAll("li.my-specific-class");
```

### How to change the content of one HTML element

You can change the content of the HTML element

```javascript
greetingDiv.textContent = "Howdy world!";
```

### How to change the style of one HTML element

You can change the style too!

```javascript
greetingDiv.style.backgroundColor = "gold";
greetingDiv.style.fontFamily = "Helvetica Neue";
greetingDiv.style.fontSize = "30px";
greetingDiv.style.color = "white";
```

\(Warning: `.style` is not supported in every browser. This example is for the purpose of illustrating what you can do. A better way to change the style would be via the `.classList` attribute\)

### How to update CSS attributes of one HTML element

We can access/update a html element's css class via the `.classList` attribute

\(See [MDN docs](https://developer.mozilla.org/en-US/docs/Web/API/Element/classList) for a list of available methods\)

```css
.my-new-class {
  background-color: gold;
  font-family: "Helvetica Neue";
  font-size: 30px;
  color: white;
}
```

```javascript
//list classes
greetingDiv.classList;

//add a class
greetingDiv.classList.add("my-new-class");

//remove a class
greetingDiv.classList.remove("my-new-class");

//check if greetingDiv has a class (returns true or false)
greetingDiv.classList.contains("my-new-class");
```

### How to add html elements

The recipe for add a new element to the DOM is as follows:

1. create a new element and save it to a variable
2. modify any properties of the element
3. attach the element to an existing element on the page

Example:

```javascript
// step 1
let img = document.createElement("img");

// step 2
img.src = "https://media.giphy.com/media/9gISqB3tncMmY/giphy.gif";
img.width = "400";

// step 3
document.body.appendChild(img);
```

### How to remove html elements

To remove an element from the DOM tree, you can call one of the two APIs:

* [remove](https://developer.mozilla.org/en-US/docs/Web/API/ChildNode/remove)
* [removeChild](https://developer.mozilla.org/en-US/docs/Web/API/Node/removeChild)

## Handle Events

When users interact with a website \(such as moving the mouse around, clicking on a link, etc\), some events are generated and can be handled with JavaScripts.

Here is a list of commonly used events:

* `click`
* `dblclick`
* `mouseover`
* `mouseout`
* `focus` and `blur` \(try this on a input box or a button\)
* `keypress`

MDN has a nice list of [all DOM events](https://developer.mozilla.org/en-US/docs/Web/Events) that we can listen for.

Let's look at some examples on handling those events.

### How to add event listeners

We can hook up custom javascript code \(e.g. the lines of code that we've just written above to beautify a 'hello world' div\), to DOM events \(e.g. click, mouseover, mouseout, keydown, keyup, change\).

We do this by adding an event listener to a DOM element \(by calling `.addEventListener('the-event-we-want', callbackFunction)`\) and specifying what we want to happen in a callback function

```javascript
let greetingDiv = document.querySelector("div");
greetingDiv.addEventListener("click", function() {
  greetingDiv.textContent = "bye bye";

  greetingDiv.style.backgroundColor = "gold";
  greetingDiv.style.fontFamily = "Helvetica Neue";
  greetingDiv.style.fontSize = "3em";
  greetingDiv.style.color = "white";
});
```

### Using the `event` object in our callback function

When we add an event listener, the callback function that comes after can take in an `event` objet as its first parameter. In the previous example we've left it out and essentially thrown it away because we didn't use it. In some cases, we do want to access the `event` object's methods or attributes. Here are some example use cases:

Now we can do the [page-styler​ exercise](https://github.com/thoughtworks-jumpstart/page-styler).

#### `event` attributes

The event object contains several attributes which can be useful. For example:

* `event.screenX` and `event.screenY` tells us the coordinates of the mouse when the event happened.
* `event.key` - when listening for `keyup` or `keydown` event, we have an `event.key` attribute which tells us which key was pressed \(e.g. Enter, Space, 'a', 's', 'd', up, down, left, right, etc\).
* `event.target` - is an object which represents the HTML element on which the event was triggered.

Example 1: using `event`'s properties \(e.g. `screenX` and `screenY`\) \(Note that `event` has been shortened to `e`\)

```javascript
let body = document.querySelector("body");
body.addEventListener("mouseover", function(event) {
  let rgbColor1 = Math.ceil((event.screenY / 200) * 256);
  let rgbColor2 = Math.ceil((event.screenX / 200) * 256);
  body.style.backgroundColor =
    "rgb(" + [rgbColor1, 100, rgbColor2].join(",") + ")";
  console.log(rgbColor1, rgbColor2);
});

// try hovering around your screen!
```

Example 2: how to \(i\) listen for keypress, \(ii\) execute conditional logic using specific keypress event.charCode value, and \(iii\) get value from input:

```markup
<!-- in your html file -->
<body>
...
  <input type="text" id='some-input'>
```

```javascript
// in your javascript file
let inputDiv = document.getElementById("some-input");

inputDiv.addEventListener("keydown", event => {
  console.log(`Key "${event.key}" pressed  [event: keydown]`);
  console.log(event.target.value);
});

inputDiv.addEventListener("keyup", event => {
  console.log(`Key "${event.key}" released  [event: keyup]`);
  console.log(event.target.value);
});
```

#### `event` methods

On the `event` object, there are some useful methods as well. You will encounter the following two sometimes.

* [event.preventDefault](https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault)
* [event.stopPropagation](https://developer.mozilla.org/en-US/docs/Web/API/Event/stopPropagation)

`event.preventDefault()` is a useful method to prevent the default action of the event. For example, when you click on a link, the default action opens a new page. When you submit a form, the default action refreshes the page. That can be irritating, and `event.preventDefault()` allows you to stop that so that you can define how you want to handle the event.

Example:

```markup
<!-- in your html file -->

<a href="http://www.google.com">google</a>
```

```javascript
// in your javascript file
let linkElement = document.querySelector("a");
linkElement.addEventListener("click", function(event) {
  event.preventDefault(); // this prevents the default behaviour of clicking a link (i.e. go to link URL)
  console.log(event); // let's see what exactly is an event object
});
```

The usage of `event.stopPropagation` is related to a concept called [Event Bubbling and Capture](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Events#Event_bubbling_and_capture). You can also find some discussion on the concept [here](http://javascript.info/bubbling-and-capturing)

## How to make sure some JavaScript codes are only executed after the HTML document is fully loaded

HTML and javascript are both loaded sequentially. If your javascript runs to completion before the HTML elements are fully loaded, all of your event listeners and event handlers will not be hooked up. There are 2 ways to make sure this doesn't happen:

1. Wrap all of your javascript code as a callback for a `DOMContentLoaded` event

```javascript
document.addEventListener('DOMContentLoaded', function() {
  // place your DOM manipulation code here
}
```

1. Place your javascript code at the bottom of your html body

```markup
<html>
<head>
<!-- ... -->
</head>
<body>
<!-- all your html code -->
<script src="./my-javascript-code.js"></script>  // place your DOM manipulation javascript code here
</body>
</html>
```

## Labs

* [https://github.com/thoughtworks-jumpstart/page-styler](https://github.com/thoughtworks-jumpstart/page-styler)
* [https://github.com/thoughtworks-jumpstart/displayer](https://github.com/thoughtworks-jumpstart/displayer)
* [https://github.com/thoughtworks-jumpstart/dice](https://github.com/thoughtworks-jumpstart/dice)

## Assignment

[https://github.com/thoughtworks-jumpstart/dom-todo-list](https://github.com/thoughtworks-jumpstart/dom-todo-list)

## Resources

### Tutorials on DOM

* [JavaScript Info: DOM](http://javascript.info/document)
* [MDN: Introduction to the DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction)
* [MDN: Manipulating DOM](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Client-side_web_APIs/Manipulating_documents)
* [Document Object Model](https://flaviocopes.com/dom/)
* [DOM manipulation tutorial](https://www.digitalocean.com/community/tutorials/how-to-make-changes-to-the-dom)
* [You might not need jQuery](http://youmightnotneedjquery.com/)

### Tutorials on Events

* [JavaScript Info: Events](http://javascript.info/events)
* [MDN: Introduction to Events](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Building_blocks/Events)
* [Eloquent JavaScript: Handling Events](https://eloquentjavascript.net/15_event.html)

### References

* [MDN docs on DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model)

