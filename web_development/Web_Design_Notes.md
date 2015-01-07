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

Floats let text and other elements flow around block elements instead of coming after them.  To clear the floated elements completely, use 'clear: both'.

To give a container that has floated elements in it a border, set the container width and give it overflow: auto. property
