# CSS Basics

#### How to link an external style sheet to a HTML file

Add the following link tag to your HTML file
```html
<head>
	...
	<link rel="stylesheet" href="somepath/to/style.css">
</head>
```
**Inline** and **embedded** styles are also supported, but not recommended

```html
<!-- Inline styles -->
<div style="background: red">hello world</div>


<!-- Embedded styles -->
<head>
	...
	<style>
		/* do css here */
	</style>
</head>
```

#### Basic css pattern: selector, property, and value
```css
selector { 
	property: value;  /* semi-colons are required */
	property: value;
	property: value;
} 

/* example */
h1 { 
	color: grey;
	font-family: Helvetica Neue;
} 
```

#### CSS selectors

There are three types of CSS selectors: html tag, class (`.`), id (`#`). As demonstrated in the following examples, you can also use any combination of these 3 selectors. 

```css
/* select all h1 elements */
h1 { 
	color: grey;
	font-family: Helvetica Neue;
} 

/* select all HTML elements with class='chicken' */
.chicken {
	background: red;
}

/* select all HTML elements with id='fish' */
#fish {
	background: black;
}

/* select all <p> elements with class='chicken' */
p.chicken {
	background: blue;
}

/* select all <p> elements with class='chicken' and id='fish'*/
p.chicken#fish {
	background: blue;
}

/* applying css to multiple HTML elements at once */
h1, h2, p.chicken {
	text-align: center;
	color: red;
}

/* select all <p> elements that are nested within div.chicken */
div.chicken p {
	text-align: center;
	color: red;
}
```

#### CSS Properties

Here are some of the CSS properties that you can use. 
- `background` (color and images)
- `color` (rgb and hex codes)
- `width`
- `height`
- `border`
- `font-family`
- `font-size`

There are many many many other CSS properties. Don't try to memorize them all. A good rule of thumb is to think about what you want to achieve and then look up how to achieve it. Here are some handy cheatsheets:
- basic cheatsheet: http://www.lesliefranke.com/files/reference/csscheatsheet.html
- advanced cheatsheet: https://css3clickchart.com
- comprehensive cheatsheet: https://www.smashingmagazine.com/wp-content/uploads/images/css3-cheat-sheet/css3-cheat-sheet.pdf

#### How to use chrome devtools to edit CSS


#### block vs inline elements

All HTML elements can have a css property of `display: block | inline | inline-block`:
- `block` : the HTML element will take up the entire width of the page
- `inline`: the HTML element will take up as much as its content
- `inline-block`: it's like `inline`, except that it allows us the specify a `width` and `height` property

All HTML elements also have a default value for the `display` css property
- elements with `display: block` as default:
	- Paragraphs (`p`)
	- Headers (`h1` through `h6`)
	- Divisions (`div`)
	- Lists and list items (`ol`, `ul`, and `li`)
	- Forms (`form`)
- elements with `display: inline` as default:
	- Spans (`span`)
	- Images (`img`)
	- Anchors (`a`)

You can override their default value with the `display: inline | block` css property if necessary

Try it out!
```css
/* index.html */
<div>hello</div>

/* style.css */

div {
  background: tomato;

	/* uncomment the following lines one by one */
  /* display: inline; */
  /* width: 100px; */
  /* height: 100px */

	/* now, set display to be `inline-block` */
}
```
