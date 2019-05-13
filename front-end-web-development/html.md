# HTML

## Getting started for code along

```bash
# 1. create project directory
mkdir html-css-sandbox

# 2. cd into project directory
cd html-css-sandbox

# 3. create a html file
touch index.html

# 4. open file in vs code
code .
```

## Learning objectives:

* Example of a html file and how it's read
* Some useful Emmet shortcuts \(`➜` === tab or enter\)
  * `! ➜`
  * `.blah ➜`
  * `#blah ➜`
  * `.blah*10 ➜`
  * `.blah.foo#bar ➜`
  * two ways to discover more shortcuts:
    * just start typing and see VS Code autocomplete suggestions
    * see full Emmet cheat sheet here: [https://docs.emmet.io/cheat-sheet/](https://docs.emmet.io/cheat-sheet/)
  * don't get too good at it! We won't be writing much HTML
* HTML tags
  * meta tags
    * `<html></html>`
    * `<head></head>`
      * `<link>` tag for css style sheets
      * `<script>` tag for javascript
    * `<body></body>`
  * headers
    * `<h1></h1>`, `<h2></h2>`, ..., `<h6></h6>`
  * frequently used HTML tags
    * `<div></div>`
    * `<span></span>`
    * `<br>` & `<hr>`
    * `<a href="www.myawesomelink.com">this will show up as a link</a>`
  * `class` and `id`
    * `<div class='chicken'></div>`
    * `<div id='fish'></div>`
  * unordered lists

    ```markup
      <ul>
          <li> item 1 </li>
          <li> item 2 </li>
          ...
          <li> item n </li>
      </ul>
    ```

    * Such indentation \(of any HTML tags\) is called **nesting**

  * ordered lists

    ```markup
      <ol>
          <li> item 1 </li>
          <li> item 2 </li>
          ...
          <li> item n </li>
      </ol>
    ```

  * tables

    * `<table>` -&gt; `<tr>` \(table row\) -&gt; `<th>` \(table header\) /`<td>` \(table data\)

    ```markup
    <table> <!-- you can use <table border='1'> for visible borders-->
      <tr>
          <th>Name</th>
          <th>Species</th>
          <th>Special Power</th>
      </tr>
      <tr>
          <td>Fluffy</td>
          <td>Cat</td>
          <td>Scratch things</td>
      </tr>
      <tr>
          <td>Drogon</td>
          <td>Dragon</td>
          <td>Burn things</td>
      </tr>
      <tr>
          <td>Barney</td>
          <td>Dinosaur</td>
          <td>Sing songs</td>
      </tr>
    </table>
    ```

  * forms and input

    ```markup
      <form>
          First name:
          <input type="text" name="firstname" value="Mickey">
          Last name:
          <input type="text" name="lastname" value="Mouse">
          <input type="submit" value="Submit">
      </form>
    ```
  * labels
    * Add captions to our forms
    * Labels are important for making our site accessible
      * Someone that is visually impaired or blind and they are accessing our form trying to sign up, their screen reading software are going to look for label tags and it's going to use the labels to know what each part of the form corresponds to

    ```markup
      <form action="/sign-in-url" method="post">
        <label>Username: <input type="text"></label>
        <label>Password: <input type="password"></label>
        <button>Login</button>
      </form>
    ```

    ```markup
      <form action="/sign-in-url" method="post">
        <label for="username">Username: </label>
        <input id="username" type="text">
        <label for="password">Password: </label>
        <input id="password" type="password">
        <button>Login</button>
      </form>
    ```
  * radio button & checkbox
    * Radio button is usually used when there is only one choice (example: male or female)
    * Checkbox allows users to check more than one option (example: selecting skills in a job profile page)

    ```markup
      <form>
        <p>Choose gender: </p>
        <label for="male">Male: </label>
        <input name="genderChoice" id="male" type="radio" value="male">

        <label for="female">Female: </label>
        <input name="genderChoice" id="female" type="radio" value="female">

        <p> Choose skills: </p>
        <input type="checkbox" id="js" name="skills" value="javascript">
        <label for="js">JavaScript </label>

        <input type="checkbox" id="css" name="skills" value="css">
        <label for="css">CSS </label>

        <input type="checkbox" id="html" name="skills" value="html">
        <label for="html">HTML </label>

        <button>Submit</button>
      </form>
    ```

  * select tag
    * Creates nice dropdown menu

    ```markup
      <form>
        <p>Select birthday month: </p>
        <select name="month">
          <option>Jan</option>
          <option>Feb</option>
          <option>Mar</option>
          <option>Apr</option>
          <option>May</option>
          <option>Jun</option>
          <option>Aug</option>
          <option>Sep</option>
          <option>Oct</option>
          <option>Nov</option>
          <option>Dec</option>
        </select>

        <button>Submit</button>
      </form>
    ```

  * textarea tag
    * Create inputs that are more than one line (example: input a profile bio)
    * We can specify how big the textarea should be by using the `rows` and `cols` attributes

    ```markup
      <form>
        <textarea name="paragraph" rows="10" cols="10"></textarea>
        <button>Submit</button>
      </form>
    ```

* Accessibility \(a11y\)
  * To enhance the accessibility of our HTML page, we should use the correct HTML elements for their correct purpose as much as possible.
  * HTML5 gives us **semantic tags** that have built-in keyboard accessibility — they can be tabbed between, and activated using Return/Enter.
    * `article`
    * `section`
    * `nav`
    * `aside`
    * `header`
    * `footer`
    * `figure`
    * `figcaption`
    * `main`
  * Using these various HTML elements to reinforce the meaning of information in our websites will often give us accessibility for free.
  * you can read more about it here:
    * [https://developer.mozilla.org/en-US/docs/Learn/Accessibility/HTML](https://developer.mozilla.org/en-US/docs/Learn/Accessibility/HTML)
    * [http://www.html5accessibility.com/](http://www.html5accessibility.com/)

## Resources

### HTML Tag Reference

* [MDN Docs on HTML tags](https://developer.mozilla.org/en-US/docs/Web/HTML/Element)
* [A Visual Guide to HTML tags](https://htmlreference.io/)

## Class Labs
* [HTML Lab](https://github.com/thoughtworks-jumpstart/learn-html)

## Assignment

* Create a github page with HTML and CSS

