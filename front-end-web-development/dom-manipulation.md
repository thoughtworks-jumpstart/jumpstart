# DOM manipulation

Code along template: [https://github.com/thoughtworks-jumpstart/dom-manipulation](https://github.com/thoughtworks-jumpstart/dom-manipulation)

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

## What is the DOM

Imagine an HTML page with the following structure:

```html
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

The browser exposes a JavaScript interface to query and manipulate this HTML
using a global variable called `document`. Using plain JS objects and arrays,
the DOM can be thought to resemble a structure similar to the following:

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

Note that this is a model of the DOM, but not how the DOM is actually
implemented in the browser.

The Document Object Model \(DOM\) is a programming interface for HTML \(and
XML\) documents. It represents the web page as a javascript object
\(`document`\) so that javascript programs can **change the document structure,
style, and content**.

This may sound boring now, but basically all interactive webpages that you've
visited \(e.g. facebook, spotify,
[pac-man](https://www.google.com.sg/search?q=pacman+online&oq=pacman+online&aqs=chrome.0.0l6.2669j0j7&sourceid=chrome&ie=UTF-8)\)
are possible because the DOM interface lets us manipulate the contents of a
webpage without refreshing a page!

## How to select elements from the DOM using selectors

[Docs](https://developer.mozilla.org/en-US/docs/Web/API/Document)

```markup
<div id="greeting">Hello World!</div>
```

```javascript
var greeting_div = document.getElementById("greeting");
console.log(greeting)
```

Other element selectors:

```javascript
// by css query selector syntax
document.querySelector('li.my-specific-class')
document.querySelector('li#my-specific-id')

// by class name 
// (Note: methods which say getElements... (instead of getElement...) return an array)
document.getElementsByClassName('some-class')

// by HTML tag name (this returns an array)
document.getElementsByTagName('h1')

// selecting more than 1 element (this returns an array of all html elements meeting the criteria)
document.querySelectorAll('li')
document.querySelectorAll('li.my-specific-class')
```

### DOM manipulation

You can change the content of the HTML element

```javascript
greeting_div.textContent = 'Howdy world!'
```

You can change the style too!

```javascript
greeting_div.style.backgroundColor = "gold";
greeting_div.style.fontFamily = "Helvetica Neue";
greeting_div.style.fontSize = "3em";
greeting_div.style.color = "white";
```

\(Warning: `.style` is not supported in every browser. This example is for the purpose of illustrating what you can do. A better way to change the style would be via the `.classList` attribute\)

### How to add CSS attributes

We can access/update a html element's css class via the `.classList` attribute

\(See [MDN docs](https://developer.mozilla.org/en-US/docs/Web/API/Element/classList) for a list of available methods\)

```javascript
//list classes
greeting_div.classList

//add a class
greeting_div.classList.add('my-new-class');

//remove a class
greeting_div.classList.remove('my-new-class');

//check if greeting_div has a class (returns true or false)
greeting_div.classList.contains('my-new-class');
```

```css
.my-new-class {
  text-align: center
}
```

### How to add event listeners

We can hook up custom javascript code \(e.g. the lines of code that we've just written above to beautify a 'hello world' div\), to DOM events \(e.g. click, mouseover, mouseout, keydown, keyup, change\).

We do this by adding an event listener to a DOM element \(by calling `.addEventListener('the-event-we-want', callbackFunction)`\) and specifying what we want to happen in a callback function

```javascript
var greeting_div = document.querySelector('div')
greeting_div.addEventListener('click', function() {
  greeting_div.textContent = 'bye bye'

  greeting_div.style.backgroundColor = "gold";
  greeting_div.style.fontFamily = "Helvetica Neue";
  greeting_div.style.fontSize = "3em";
  greeting_div.style.color = "white";
})
```

### Using the `event` object in our callback function

When we add an event listener, the callback function that comes after can take in an `event` objet as its first parameter. In the previous example we've left it out and essentially thrown it away because we didn't use it. In some cases, we do want to access the `event` object's methods or attributes. Here are some example use cases:

#### `event` attributes

The event object contains several attributes which can be useful. For example:

* `event.screenX` and `event.screenY` tells us the coordinates of the mouse when the event happened.
* `event.charCode` - when listening for `keypress` event, we have an `event.charCode` attribute which tells us which key was pressed \(e.g. Enter, Space, 'a', 's', 'd', up, down, left, right, etc\). 
* `event.target` - is an object which represents the HTML element on which the event was triggered.

The following example demonstrates how to \(i\) listen for keypress, \(ii\) execute conditional logic using specific keypress event.charCode value, and \(iii\) get value from input:

```markup
<!-- in your html file -->
<body>
...
  <input type="text" id='some-input'>
```

```javascript
// in your javascript file
var inputDiv = document.getElementById("some-input");

inputDiv.addEventListener("keypress", function(event) {
  if (event.charCode === 13) {
    event.preventDefault();
    console.log("Enter key pressed");
    console.log(event.target.value); // this is the value of the input box
  } else {
    console.log("other key pressed");
  }
});
```

#### `event` methods

`event.preventDefault()` is a useful method to prevent the default action of the event. For example, when you click on a link, the default action opens a new page. When you submit a form, the default action refreshes the page. That can be irritating, and `event.preventDefault()` allows you to stop that so that you can define how you want to handle the event.

Example:

```markup
<a href="www.google.com">google</a>
```

```javascript
var linkElement = document.querySelector('a')
linkElement.addEventListener('click', function(event) {
  event.preventDefault() // this prevents the default behaviour of clicking a link (i.e. go to link URL)
  console.log(event)     // let's see what exactly is an event object
})
```

A list of commonly used events:

* `click`
* `dblclick`
* `mouseover`
* `mouseout`
* `focus` and `blur` \(try this on a input box or a button\)
* `keypress`

MDN has a nice list of [all DOM events](https://developer.mozilla.org/en-US/docs/Web/Events) that we can listen for

Example of using `event`'s properties \(e.g. `screenX` and `screenY`\) \(Note that `event` has been shortened to `e`\)

```javascript
var body = document.querySelector('body')
body.addEventListener('mouseover', function(e) {
  rgbColor1 = Math.ceil(e.screenY / 2000 * 256)
  rgbColor2 = Math.ceil(e.screenX / 2000 * 256)
  body.style.backgroundColor = 'rgb(' + [rgbColor1,100,rgbColor2].join(',') + ')';
  console.log(rgbColor1,rgbColor2)
})

// try hovering around your screen!
```

### `DOMContentLoaded`

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

### How to add/remove html elements

The recipe for add a new element to the DOM is as follows: 1. create a new element and save it to a variable 2. modify any properties of the element 3. attach the element to an existing element on the page

Example:

```javascript
// step 1
var img = document.createElement("img")   

// step 2
img.src = "https://media.giphy.com/media/9gISqB3tncMmY/giphy.gif"
img.width = "400"

// step 3
document.body.appendChild(img)
```

## Resources

### References

* [Introduction to the DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model/Introduction)
* [DOM manipulation tutorial](https://www.digitalocean.com/community/tutorials/how-to-make-changes-to-the-dom)
* [You might not need jQuery](http://youmightnotneedjquery.com/)

## Assignment

[https://github.com/thoughtworks-jumpstart/dom-todo-list](https://github.com/thoughtworks-jumpstart/dom-todo-list)

