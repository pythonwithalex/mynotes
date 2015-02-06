Functions are like objects in that they can have properties.

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

