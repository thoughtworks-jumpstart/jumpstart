# float

## The original purpose of floats

The CSS `float` property was originally introduced to float an image inside a column of text on the left or right \(something you often see in newspapers\).

Web developers in the early 2000s took advantage of the fact that you could float not just images, but any element, meaning you could create the illusion of rows and columns by floating entire divs of content. But again, floats weren’t designed for this purpose, so we should not try to create layouts using floats \(that's what CSS grids are for\).

If you ever find yourself creating layouts with `float` and having the use hacks like `clear: left`, `clear: right`, `clear: both`, etc, stop yourself and think about using grids.

## How to use float correctly

```css
.some-selector {
  float: left | right; /* default value is none */
}
```

See demo: [https://codepen.io/davified/pen/zRjoxj](https://codepen.io/davified/pen/zRjoxj)

## Further reading

[https://www.w3schools.com/css/css\_float.asp](https://www.w3schools.com/css/css_float.asp)

