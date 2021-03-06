Sed Notes
=========

**Sed** is a Unix 'stream editor'. Sed's basic substitution mode supports a string or pattern match section (on the left)  and a replace section (on the right), separated by a consistent delimiter (you'll often see '/' used as the delimiter, but you have other options).  You feed it a stream of text data and it replaces what it finds on the left side with what you've specified on the right (see the basic form below).  

Sed supports any valid combination of the Basic Regular Expression rules that you give it.  Sed can work on files or standard input. This is a basic tutorial that covers Basic Regular Expressions and fundamental sed operations.

**note:** The GNU version of sed has an -i flag that allows you to modify a file in place, but this isn't so portable.  POSIX compliant versions of Sed do not support in-place modification of a file.  This means that sed doesn't modify the original file you send through it.  You can always pipe the output to a file.  See the bracketed sections in the example below.

#### Basic form of match and replace with sed

```bash
sed 's/text to match/text to replace it with/' file [ > newfile ]
```

or 

```bash
cat file | sed 's/text to match/text to replace it with/' [ > newfile ]
```

A literal text string is not the only thing you can match with sed.  It supports the Basic Regular Expression pattern language.  This language expresses many of the subsets of all possible combinations of a given character set. 

The point of sed is to use the rules below to cast information additively or subtractively into a form that you specify.  If you want _last name, middle firstname_ to become _firstname, middle, last name_, you could do :


| Basic Regular Expressions (BRE) Chart  | | |
|---------------|-------------------|--------|
|**Matching Symbols** |
| the dot | **.** | match a single character no matter what it is |
| character class | **[abcdefg]** | match one of the characters specified in between the brackets, [].|
|character class range | **[a-z]** |  match any single letter from the lower case 26 alphabetic letters.|
| aggregate character class ranges | **[a-zA-Z0-9] | match any single character from the specified ranges |
| complement of character class| **[^a]**, **[^a-z]**, **[^0-9a-zA-Z]** | match any single characters that are not in the specified class.|
| **Modifying Symbols:** |
| the asterisk/'glob' |  [a-z]\* or .\*  | match zero or more of the preceding character|

The Example File:

```bash

```

#### Simple Match & Replace

**basic usage**

```bash
alex@t$ cat words.txt
california
massachusetts
michigan

alex@t$ sed 's/california/massachusetts/' words.txt
massachusetts
massachusetts
michigan
```

**Result:** replaces lines containing 'california' with the literal text 'california is great'
    
#### Substring Replacement
    
**form**    
    ```bash
    sed 's/\(ignore group #1\)match/\1replacement/' words.txt
    ```
    
**example**: 
    ```bash
    sed 's/califor\(.*a\)/\1gara falls/' words.txt
    niagara falls
    massachusetts
    michigan
    ```
    
**explanation**: 
sed protects text in the match section which is placed in parentheses () alone.
You can refer to it in the replace section, which is useful.
Without escaping the '(' and ')' characters, we would have s/(califor).*a/1replacement/'
I find thinking of it without the escaping at first helps one understand what's actually going on.  Sed is leaving the parenthetical text alone.
However, we can use each parenthetical chunk from the match section in the replace section by refering to its position, starting with 1.  
We have to escape that number, as well, to tell sed that it isn't to be a literal replacement.
    
**result**: don't replace anything in the escaped parentheses, aka the 'nia' ending in california. 
Replace the non-protected text with 'gara falls' and place that after the previously protected text.

```bash
alex@terminal$ cat words.txt
niagara falls
massachusetts
michigan
```    

#### resources

[which characters do I need to escape when using sed?](http://unix.stackexchange.com/questions/32907/what-characters-do-i-need-to-escape-when-using-sed-in-a-sh-script)
