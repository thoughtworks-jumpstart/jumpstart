# Centering elements

Centering elements horizontally or vertically in CSS is notoriously unstraightforward. Here's a non-exhaustive list of recipes for centering HTML elements

Assuming you have a block HTML element which you want to center:
```html
<div>hello world</div>
```

```css
/* HORIZONTAL CENTERING */
/* centering text*/
div {
	text-align: center
}

/* centering block elements horizontally */
div {
	max-width: 600px; /* some arbitrary width */
	margin: 0 auto;
	background: red; /* let's give it an obvious colour so we can observe the effects of our css styling*/
}

/* VERTICAL CENTERING */

div {
	/* for vertical centering */
	vertical-align: middle;	
  line-height: 500px;  		/* the same as the parent div's height */

	/* for horizontal centering */
  text-align: center;  		
}

/* for more recipes on vertical centering, refer to : http://vanseodesign.com/css/vertical-centering/ */
```
