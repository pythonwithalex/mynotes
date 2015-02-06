Functions are like objects in that they can have properties.


#### A note on lexical scope using an example

In the function below, because foo is declared with 'a' visible in the global namespace, the 'a' returned by foo will refer to the global 'a'.  The variables in the parent scope of a given function are available to that function.  The context in which foo is called does not affect its scope, hence the term 'static' scoping.


```javascript

var a = 5;
function foo()
{
  return a;
}

function bar()
{
  var a = 1;
  return foo();
}

console.log(foo());
console.log(bar());

```

#### 'this' 
**this** is entirely determined by the location of the function call it's inside of.
It's one part of a function's runtime invocation/call context.

#### Call Method - Determining Context

```javascript
function introduce()
{
  console.log('hi my name is', this.name);
}

var me = {name: 'alex'};
introduce.call(me); // specify the context with .call method
// Kyle Simpson advocates this method over the following method, which can apparently get messy because you are passing in a context variable explicitly

function introduce(context)
{
  console.log('hi my name is ', context.name);
}

introduce(me);
// hi my name is alex
```

