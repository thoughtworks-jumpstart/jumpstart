# Specificity Rules

All css selectors are assigned a weight, and the heaviest selector takes precedence when conflicting CSS rules exist. It's natural when architecting a website that you have general styles that get overridden with more specific styles in different circumstances. In the global area at the top of the style sheet, a very broad style has been set for all paragraph elements:

Inline styles are worth 1,000 points; IDs are worth 100 points; classes are worth 10 points; and elements are worth 1 point each. For example:

```css
p { /* 1 point */

}

p.chicken { /* 11 points */

}

p#fish { /* 101 points */

}
```

The selector with the highest points will win and its styles will override those of other selectors

![](../../.gitbook/assets/specificity_score.png)

## Overriding specificity scores

People sometimes use `!important` to override the point system. This is an **anti-pattern** and you shouldn't do it. We only include it here because you might encounter it in your career.

```css
p#fish {
  background: black
}

p {
  background: tomato !important /* this style will be applied even though p#fish has a higher specificity score */
}
```

## Resources

* Specificity score calculator: [https://specificity.keegan.st/](https://specificity.keegan.st/)

