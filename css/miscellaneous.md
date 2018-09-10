# Miscellaneous

## Scaling images

How to crop a rectangular image without distortion: use `object-fit: cover` css property

Example:

```markup
<img id="profile-pic"src="http://www.catster.com/wp-content/uploads/2017/08/A-fluffy-cat-looking-funny-surprised-or-concerned.jpg" alt="">
```

```css
#profile-pic {
  width: 200px;
  height: 200px;
  object-fit: cover;
  /* border-radius: 50%; */
}
```

## Using css to load images

You can use the `background-image: url("https://some.website.com/some_picture.jpg")` css proeprty. Try it out [here](https://codepen.io/davified/pen/YvqejJ)!

## pseudo-selectors

## Vendor prefixes

## Web Fonts

## Feature query

Use `@supports` to check if the current browser supports certain feature or not (and fallback gracefully if some feature is not supported)
