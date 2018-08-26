# CSS Basics

## How to link an external style sheet to a HTML file

Add the following link tag to your HTML file

```markup
<head>
    ...
    <link rel="stylesheet" href="somepath/to/style.css">
</head>
```

**Inline** and **embedded** styles are also supported, but not recommended

```markup
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

## Basic css pattern: selector, property, and value

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

## CSS selectors

There are three types of CSS selectors: html tag, class \(`.`\), id \(`#`\). As demonstrated in the following examples, you can also use any combination of these 3 selectors.

```css
/* select all h1 elements */
h1 { 
    color: grey;
    font-family: Helvetica Neue;
} 

/* select all HTML elements with class='fish' */
.fish {
    background: green;
}

/* select all HTML elements with id='night' */
#night {
    background: black;
}

/* select all <p> elements with class='fish' */
p.fish {
    background: blue;
}

/* select all <p> elements with class='fish' and id='salmon'*/
p.fish#salmon {
    background: pink;
}

/* applying css to multiple HTML elements at once */
h1, h2, p.fish {
    text-align: center;
    color: red;
}

/* select all <p> elements that are nested within a div with class='fish' */
div.fish p {
    text-align: center;
    color: red;
}

/* select all <p> elements that are immediate child of a div with class='fish' */
div.fish > p {
    text-align: center;
    color: red;
}
```

## CSS Properties

Here are some of the CSS properties that you can use.

* `background` \(color and images\)
* `color` \(rgb and hex codes\)
* `width`
* `height`
* `border`
* `font-family`
* `font-size`

There are many many many other CSS properties. Don't try to memorize them all. A good rule of thumb is to think about what you want to achieve and then look up how to achieve it. Here is a handy reference:

* MDN CSS Reference: [https://developer.mozilla.org/en-US/docs/Web/CSS/Reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference) \(**Bookmark this!**\)


## How to use Chrome Devtools to edit CSS

You can experiment with CSS rules easily with Chrome Devtools. More materials on Chrome Devtools can be found under the [developer tools section](../developer-tools/chrome-devtools.md)