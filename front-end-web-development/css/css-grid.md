# CSS Grid

CSS grid landed in most major browsers in 2017 \(see it for yourself on [https://caniuse.com/](https://caniuse.com/)\), and revolutionized the way CSS handles horizontal and vertical positioning!

A grid is an intersecting set of horizontal and vertical lines – one set defining columns and the other rows. Elements can be placed onto the grid, respecting these column and row lines. CSS grid layout has the following features:

## Steps for using grids

**1. Grid container**

Create a grid container by applying `display: grid` css style on an element. All the direct children are now grid items.

```markup
<div class="wrapper">
  <div>One</div>
  <div>Two</div>
  <div>Three</div>
  <div>Four</div>
  <div>Five</div>
</div>
```

```css
.wrapper {
  display: grid;
}

.wrapper > div { /* give children divs some color to make our changes visible */
  background: lightblue;
  margin: 1px
}
```

The changes are not visible at the moment, but behind the scenes, CSS has created a **single-column grid** to contain the grid items. Let's now try to add more columns in our grid

**2. Define columns and/or rows \(aka grid tracks\)**

We can define rows and columns on our grid by adding `grid-template-columns` and `grid-template-rows` properties on the grid container

```css
.wrapper {
  display: grid;
  grid-template-columns: 200px 400px 200px;
}
```

Other possible values for `grid-template-columns` and `grid-template-rows` include:

* pixels: `grid-template-columns: 200px 200px 200px 200px`
* fractions: `grid-template-columns: 1fr 1fr 1fr` \(this is automatically responsive\)
* `repeat()`: `grid-template-columns: repeat(5, 1fr)`
* any combination of the above: `grid-template-columns: 200px 3fr repeat(3, 1fr)`

In the above example, we only defined the columns, and not the rows. CSS automatically creates new rows for us. These 'row' tracks will be auto-sized by default, resulting in their size being based on the content that is inside them. To specify the height of the rows, we can add `grid-auto-rows`

```css
.wrapper {
  display: grid;
  grid-template-columns: 200px 400px 200px;
  grid-auto-rows: 200px;

  /* you can also specify a min-max range for your row height. */
  /* grid-auto-rows: minmax(100px, auto); */ 
  /* auto => as much height is required by the content */
}
```

**3. Specify gap between columns and/or rows**

We can specify some space between grid cells using the `grid-column-gap` and `grid-row-gap` properties, or the shorthand `grid-gap`. In the below example, I am creating a 10-pixel gap between columns and a 1em gap between rows.

```css
.wrapper {
  display: grid;
  grid-template-columns: 200px 400px 200px;
  grid-auto-rows: 200px;

  grid-column-gap: 20px;
  grid-row-gap: 5px

  /* you can also use the grid-gap shorthand */
  /* grid-gap: 20px; */
}
```

## Repeat!

Know that a grid item can become a grid container \(and all the rules that we just learned would apply the same way for nested grids\)

## Next steps

There's a lot more to CSS Grid. We have only covered the bare essentials to get us started with creating CSS layouts. Go through [MDN docs](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Basic_Concepts_of_Grid_Layout) on CSS grid to understand what else you can do with CSS.

## Resources

### Recommended reading

* [MDN docs on grid](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout/Basic_Concepts_of_Grid_Layout)
* [Great explanation on CSS Grid](http://varun.ca/css-grid/)
* [Complete guide to CSS Grid](https://cssgrid.cc/)
* [CSS Grid starter layouts](https://css-tricks.com/snippets/css/css-grid-starter-layouts/)
* [Mozilla CSS Grid Tutorial](https://mozilladevelopers.github.io/playground/css-grid)
* [MDN CSS Grid Layout](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Grid_Layout)
* [A complete guide to Grid layout](https://css-tricks.com/snippets/css/complete-guide-grid/)

### About Flexbox

* [A complete guide to flexbox](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
* [CSS grids does not replace flexbox](https://css-tricks.com/css-grid-replace-flexbox/)

### References

* [Recreating YouTube Layout with CSS grid and flexbox](https://codepen.io/GeorgePark/pen/oEwYYy)
* [CSS Grid by Example](https://gridbyexample.com/examples/)
* [CSS Grid Cheat Sheet](http://grid.malven.co/)
* [13 CSS UI Grid Systems and Libraries for 2018](https://blog.bitsrc.io/13-css-ui-grid-systems-and-libraries-for-2018-5918104cb591)

## Assignment

1. In class activity: [CSS Grid Garden](http://cssgridgarden.com/)
2. Create a static `index.html` page with the following components \(as displayed in the screenshot below\):
   * title header
   * navbar
   * right sidebar
   * main content panel
   * footer
3. Focus on the layout. The key purpose of this exercise is for you to practice **css grid**. So don't be too caught up with the exact content specific styling \(e.g. font, font-size, color hex code, margin widths\). 
4. Push code to repo and create github pages

![screenshot](../.gitbook/assets/css_grid_lab.png)

