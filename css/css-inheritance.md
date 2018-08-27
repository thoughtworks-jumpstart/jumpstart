# CSS Property Inheritance

We know that HTML elements forms a tree structure: one HTML element can have other HTML elements has children.

On some HTML element, if we don't define some CSS property \(e.g. color\), and the same property has been defined in its parent. Would the element inherit the property from its parent?

The answer is not very straightforward.

## The inheritance rules only apply when there is no explicit value set for the property

If you already set a property for an HTML element explicitly, then the element does not need to inherit the property from its parent.

## Some CSS properties are not inherited by default

Some \(not all!!!\) CSS can be inherited by its children by default.

The commonly used rules which apply inheritance are:

* border-spacing
* color
* cursor
* font-family
* font-size
* font-style
* font-variant
* font-weight
* font
* letter-spacing
* line-height
* list-style-image
* list-style-position
* list-style-type
* list-style
* text-align
* text-indent
* text-transform
* visibility
* white-space
* word-spacing

Here are some CSS properties that are not inherited by default:

* border
* border-block-start

If you check the documentation of any CSS property in the [reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference), you can find out if that property can be inherited by default.

## What happens when some property is inherited

When no value for an inherited property has been specified on an element, the element gets the computed value of that property on its parent element.

A typical example of an inherited property is the color property. Given the style rules:

```css
p {
  color: green;
}
```

... and the markup:

```markup
<p>This paragraph has <em>emphasized text</em> in it.</p>
```

... the words "emphasized text" will appear green, since the em element has inherited the value of the color property from the p element.

## What happens when some property is not inherited

When no value for a non-inherited property has been specified on an element, the element gets the `initial value` \(or default value\) of that property. You can find default value of each property in their reference documentation.

A typical example of a non-inherited property is the `border` property.

Given the style rules:

```css
p {
  border: medium solid;
}
```

... and the markup:

```markup
<p>This paragraph has <em>emphasized text</em> in it.</p>
```

... the words "emphasized text" will not have a border \(since the initial value of border-style is none\).

## You can overwrite the default inheritance rules explicitly

If the default inheritance rule does not work for you in a specific situation, you can explicitly specify that an element needs \(or doesn't need\) to inherit a property from its ancestor.

For example, in the example given above, you can add a CSS rule on `em` to force it inherits the `border` property from its parent.

```css
em {
  border: inherit;
}
```

You can find out more documentation on how to specify this inheritance behavior explicitly:

* [inherit](https://developer.mozilla.org/en-US/docs/Web/CSS/inherit)
* [initial](https://developer.mozilla.org/en-US/docs/Web/CSS/initial)
* [unset](https://developer.mozilla.org/en-US/docs/Web/CSS/unset)
* [revert](https://developer.mozilla.org/en-US/docs/Web/CSS/revert)

## Try it out!

You can also test this out using the `property-inheritance.html` in the [intro-to-css project](https://github.com/thoughtworks-jumpstart/intro-to-css)

