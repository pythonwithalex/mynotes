## HTML & CSS GUIDE

#### List of How To Do Things

+ relative image size w/ just css
```css
img {
  height: auto;
  max-width: 25%;
}
```

+ pseudo submit button (to force height equivalency for form input and button )

```html
<form>
  <input id="inputField"><div id="search-box"></div>
</form>
```
```css

form
{
    height: 30px;
    margin: 5px 20px 10px 0px;
    z-index:4000;
}

#search-box, #search-button
{
    display: inline-block;
    border: 1px rgb(40,40,40) solid;
    height: 100%;
    padding: 0;
    margin:0;
}

#search-box
{
    width: 125px;
    background: lemonChiffon;
}

#search-button
{
    margin-left: -1px;
    background: white;
    vertical-align:top;
    text-align: center;
    line-height:30px;
    width: 25px;
    height: 100%;
}


```
