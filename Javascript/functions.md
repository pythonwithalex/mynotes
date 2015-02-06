Functions are like objects in that they can have properties.


#### A note on lexical scope using an example

In the function below, because foo is declared with 'a' visible in the global namespace, the 'a' inside of foo will refer to that 'a'.  You can change the context in which foo() is called in such a way that you create an a that is visible to it, but if you don't pass it into the function, which redefines a, as I demonstrate with bar(), then the original function refers to the context in which it is defined, not in which it was called.

This is also called static scoping, because the referents inside of the function don't change depending on the calling context.


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
