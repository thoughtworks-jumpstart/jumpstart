# `block` vs `inline` elements

All HTML elements can have a css property of `display: block | inline | inline-block`:

* `block` : the HTML element will take up the entire width of the page
* `inline`: the HTML element will take up as much as its content
* `inline-block`: it's like `inline`, except that it allows us the specify a `width` and `height` property

All HTML elements also have a default value for the `display` css property

* elements with `display: block` as default:
  * Paragraphs \(`p`\)
  * Headers \(`h1` through `h6`\)
  * Divisions \(`div`\)
  * Lists and list items \(`ol`, `ul`, and `li`\)
  * Forms \(`form`\)
* elements with `display: inline` as default:
  * Spans \(`span`\)
  * Images \(`img`\)
  * Anchors \(`a`\)

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

You can also test this out using the `inline-block-elements.html` in the [intro-to-css project](https://github.com/thoughtworks-jumpstart/intro-to-css)