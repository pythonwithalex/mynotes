Backbone Notes
====

#### Backbone.Model.extend
When you use 

```javascript
var Photo = Backbone.Model.extend({instanceProperties},{classProperties, attached to constructor});
var newPhoto = new Photo();
```

you are extending Backbone's Model prototype and getting a constructor returned to you that you can use to create objects.

The first object is a set of instanceProperties that you give to your object by calling the constructor function, new Photo();
The second is a set of classProperties that are attached to the constructor itself, and thus are available to all objects created with the constructor.

#### Built-In Properties

**defaults**: for when your user doesn't provide complete information

**initialize**: a good place to bind changes in your model to custom functions

**validate**: return a value only in case of validation error. otherwise, no return.

#### Setting Values on a Model
```javascript
var photo = new Photo();
photo.set({title:'town_hall',author: 'Michael Michaels'}); // the proper way to do it
```

#### Backbone Views

main properties:
**el**: each view must contain a reference to a DOM element.
Backbone.View.extend
views don't hold markup
Each view must contain a reference to a Dom element
You can bind a view's render method can be attached to a model's change event, and this eleminates need for a page refresh.
