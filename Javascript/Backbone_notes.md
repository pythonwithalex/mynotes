Backbone Notes
====

#### Backbone.Model.extend
When you use 

```javascript
var Photo = Backbone.Model.extend();
var newPhoto = new Photo();
```

you are extending Backbone's Model prototype and getting a constructor returned to you that you can use to create objects.

If you used 

```javascript
var newPhoto = Backbone.Model();
```
then you'd be getting a single object back, not a constructor.

