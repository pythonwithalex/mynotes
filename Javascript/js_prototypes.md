## JS prototypal Inheritance

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
