## Interestings with Python

## add a property to a function

```python
def hi(debug=False):
  print hi.normal
  hi.count += 1
  if debug:
    print 'call-count:', hi.count



hi.func_dict.update({
      'alt':'hello',
      'normal':'hey',
      'count':0, 
    })

hi()
hi(debug=True)
````
