## JS prototypal Inheritance

#### gotchas

Setting the object.prototype to an object literal will overwrite the previous prototype chain, so you need to explicitly set it like so:

```javascript

Person.prototype = 
{
  constructor:Person, // put this first int he object literal definition of the prototype
  name: 'Unknown'
  
}


```

#### create an object via constructor function

```javascript

function Person(name,age)
{
  this.name = name;
  this.age = age;
}

var bob = new Person('bob',39);
bob.name // 'bob'
bob.age // 39

// here bob's constructor function, Person, has a prototype of '{}', or Object
```

#### create an object via object initializer

```javascript
var bob = {
  name: 'bob',
  age: 39
}
bob.name // 'bob'
bob.age // 39

```
