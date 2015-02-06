Functions are like objects in that they can have properties.

#### Call Method - Determining Context

```javascript
function introduce()
{
  console.log('hi my name is', this.name);
}

var me = {name: 'alex'};
introduce.call(me); // specify the context with .call method


```

arg here is the environment in which the function will be called.
