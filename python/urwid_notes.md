## Urwid Notes

## List Box

+ This needs to wrap a SimpleListWalker.

## Text Widgets

+ text widgets are flow widgets, which don't have a specified height / width.

+ box widgets have a specified height/width.

+ The top most widget must be a box widget.  

Mainloop has an optional keyword argument (unhandled input) that lets you specify a key handler function to run on all keys not handled by Urwid widgets. 

+ palette hints:

+ a pallete takes these important things:

+ valid foreground/background name (str)
+ foreground color for 16 bit normal mode
+ background color for normal mode

#### Text Markup: Learn It
http://urwid.org/manual/displayattributes.html#text-markup


the first 3 words have a the default text attribute
the last three has a default text attribute 'attr1', which is what huh?
Text([u"a simple string ", ('attr1', u"ending with attr1")])
Text([('attr1', u"start in attr1 "),('attr2', u"end in attr2")])
You can 
