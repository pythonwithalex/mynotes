#### iterate through the enumerable attributes of an object

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
#### What does 'enumerable' mean?
If a property of an object is enumerable, this means you can access it iteratively using Object.keys(o) or for (var i in o) syntax.  You can explicitly set an object not to be enumerable:

```javascript
var list = [1,2,3,4];
Object.defineProperty(list,4, { value: 5, enumerable: false });
for (var i in list)
{
  console.log(i);
}

```

#### Object.keys(o)


#### Non-enumerable Properties
```javascript

var stuff = {'book':'Crime and Punishment','tool':'hammer'};
Object.defineProperty(stuff,'music_equipment',{value: 'keyboard',enumerable:false});
Object.keys(stuff);
// [ 'book', 'tool' ]
for (var i in stuff)
{
  console.log(stuff[i]);
}
// Crime and Punishment
// hammer

console.log(stuff['music_equipment']);
// keyboard

JSON.stringify(stuff);
// '{"book":"Crime and Punishment","tool":"hammer"}'

Object.getOwnPropertyNames(stuff)
// [ 'book', 'tool', 'music_equipment' ]
```

#### For each

Don't bother using for each, it's not supported in major browsers, nor is it supported in node.js.
