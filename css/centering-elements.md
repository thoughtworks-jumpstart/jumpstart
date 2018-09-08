# Centering elements

Centering elements horizontally or vertically in CSS is notoriously unstraightforward. Here is a simple example on how to center text horizontally and vertically in a box.

HTML:

```markup
<div class="parent">
  <div class="child">hello world</div>
</div>
```

CSS:

```css
.parent {
  width: 600px;
  height: 100px;
  margin: 0 auto;
  background-color: red;
}

.child {
  text-align: center;
  line-height: 100px; /* Note this needs to be set same as the height of parent */
}
```

For more recipes on vertical centering, refer to [this tutorial](http://vanseodesign.com/css/vertical-centering/)
