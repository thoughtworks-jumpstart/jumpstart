# Responsive CSS

## Learning checklist

Ingredients of responsive design

* fluid display
  * using relative units \(e.g. %, fr\) rather than static units \(e.g. px\)
* media queries \(`@media`\)
  * media types
    * `screen`
    * `all`
    * `print`
    * `speech`
  * media features \(a.k.a. breakpoints\)
    * `@media (max-width: 12450px) { ... }`
    * `@media (min-width: 300px) and (max-width: 12450px) and (orientation: landscape) { ... }`
* thinking in containers \(don't micromanage every single html element!\)
* mobile-first approach

## Example

Let's look at an example where the media query helps to change the layout of a website when browser window size changes.

To start with, here is [the template](https://codepen.io/gordonsong/pen/EebMwZ)

Now let's apply the media query and re-size the browser window:

```css
@media all and (max-width: 400px) {
  .sidebar-left, .sidebar-right, .article {
    grid-column: 1 / 4;
    background: gold
  }
}
```

What did you observe when the windows's width is less than 400 pixels?

## Resources

### Recommended reading

* [MDN docs on media queries](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries)
* [Media Queries for Standard Devices](https://css-tricks.com/snippets/css/media-queries-for-standard-devices/)
* [W3Schools Media Queries](https://www.w3schools.com/css/css_rwd_mediaqueries.asp)

## Assignment

### Assignment 1

[https://github.com/thoughtworks-jumpstart/intro-to-responsive-css](https://github.com/thoughtworks-jumpstart/intro-to-responsive-css)

### Assignment 2 \(optional\)

Make your previous CSS Grid assignment mobile-responsive for the following:

* iPad \(portrait, landscape\)
  * min-device-width: 768px
  * max-device-width: 1024px
* mobile \(portrait, landscape\)
  * device-width: 320px
  * device-height: 640px
* You can play around with [different mobile device size specifications](https://css-tricks.com/snippets/css/media-queries-for-standard-devices/)

