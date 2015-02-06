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

#### for each
