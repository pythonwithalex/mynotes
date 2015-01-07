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

#### Clearing Floats

set the container width and give it an overflow: auto property
