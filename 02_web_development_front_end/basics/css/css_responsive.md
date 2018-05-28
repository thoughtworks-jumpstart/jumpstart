# Responsive Design with @media queries

### Learning checklist
- mobile-first approach
- [Example media query](https://codepen.io/davified/pen/PEMwOz)
- media queries
  - `@media`
- media types
  - `screen`
  - `all`
  - `print`
  - `speech`
- media features
  - `@media (max-width: 12450px) { ... }`
  - `@media (min-width: 300px) and (orientation: landscape) { ... }`




Example of a media query:
```css
/* no media query */
body {
  background-color: lightblue;
}

/* media query */
@media only screen and (orientation: landscape) {
  body {
    background-color: lightblue;
  }
}
```
### Resources

#### Recommended reading
- [MDN docs on media queries](https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries)
- [Media Queries for Standard Devices](https://css-tricks.com/snippets/css/media-queries-for-standard-devices/)
- [W3Schools Media Queries](https://www.w3schools.com/css/css_rwd_mediaqueries.asp)

### Assignment

Make your previous CSS Grid assignment mobile-responsive for the following:
- iPad (portrait, landscape)
  - min-device-width: 768px
  - max-device-width: 1024px
- mobile (portrait, landscape)
  - device-width: 320px
  - device-height: 640px
- You can play around with [different mobile device size specifications](https://css-tricks.com/snippets/css/media-queries-for-standard-devices/)
