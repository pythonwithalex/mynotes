Functions can have properties.

A Function definition defines a lexical scope.

Identical functions are unique.


#### Execution contexts
The context of a function is the child of the context in which it was defined.
In-memory scope structures that hold variable names and their values.
One lexical scope can mean many in-memory execution contexts

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

**this will never be**:
+ the function in which it is called.
+ not an in-memory object that has that function as a property
+ not an execution context or a scope.  you have no access to the scope.

**It will refer to**:
+ the current execution environment of its parent ???? e.g. obj.fn(3,4) or obj['fn'];

+ it behaves like a parameter, useful to think of it that way

**this** is entirely determined by the location of the function call it's inside of.
It's one part of a function's runtime invocation/call context.
It's roughly the parameter that is the left of the dot in a method call, e.g. with r.method(g,b), it would be r

**Four/Five Rules**:
+ default context: function using this is out in the open, this refers to global var
+ implicit binding: a reference to a function from within an object literal initializer.
+ expliclit binding: using .call() and .apply(), you can explicitly set the object to use for this
+ hard binding: point is to prevent loss of the proper this binding.

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

