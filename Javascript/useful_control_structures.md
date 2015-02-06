#### label statements 

You can use a label inside of nested loops to break out of an outer loop

```javascript
student:

for (var i = 0; i< 10; i++)
{

  for (var j = 0; j < 5; j++)
  {
    if (j==4)
    {
      break student;
    }
  }
}
```

#### iterate through the attributes of an object

```javascript
var favorites = ['movies','tv','junk food','skiing'];
favorites['most'] = 'dogs';

for (var i in favorites)
{
  console.log(i,': ',favorites[i]);
}
/*
0 :  movies
1 :  tv
2 :  junk food
3 :  skiing
most :  dogs
*/
```

#### For each

Don't bother using for each, it's not supported in major browsers, nor is it supported in node.js.
