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
