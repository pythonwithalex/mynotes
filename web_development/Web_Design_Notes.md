#### Basic HTML5 Skeleton

```html
<!doctype html>
<html lang="en">
  <head>
    <title>HTML5 Web Page Skeleton</title>
    <meta charset="UTF-8" />
    <!-- Note, no "type" here-- not necessary with HTML5-->
    <link rel="stylesheet" href="styles.css" /> 
    <script src="scripts.js"></script>
  </head>
  <body>
  
    <header>
      <h1>Demo Header</h1>
    </header>
    
    <nav>
      <ul>
        <li>work</li>
        <li>clients</li>
        <li>contact</li>
      </ul>
    </nav>
    
    <section> 
    <!-- this is for grouping thematically related content.  the article is a special subset of it -->
    <!-- use if you have an article header. don't use for styling purposes. -->
      <h1>Article Title</h1>
      <article>
        <p>Articles are intended to be syndicatable content.  If the name of the article or blogpost 
        is in the URI, it's best to give it an article tag </p>
      </article>
    </section>
    
    <aside>
      <p>An aside</p>
    </aside>

    <footer>
      <h3>Demo Footer</h3>
    </footer>
  </body>
</html>
```


#### Vendor Prefixes

```css





```

```

#### Center a div vertically and horizontally in page

```css
div
{
  margin: auto;
  position: absolute;
  background: red;
  bottom: 0;
  left: 0;
  top: 0;
  right: 0;
  height: 100px;
  width: 100px;
}
```
#### Use Box-Sizing so that padding is included in the element's id

```css
html {box-sizing: border-box; }
*,*:before, *:after { box-sizing: inherit; }
```

#### Floats

Floats let elements flow to the side of block elements instead of following after them.  To clear the floated elements completely, or to make sure a container wraps around its contained floated elements, use the **clearfix** technique below. The reason they aren't automatically cleared is that a float takes the element out of the document flow.



To give a container that has floated elements in it a border, set the container width and give it overflow: auto. property
