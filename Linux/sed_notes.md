Sed Notes
=========

sed is short for 'stream editor'. It modifies a stream based on the regular expression rules that you give it.  Sed can work on files or standard input.

BRE (Basic Regular Expression) Symbol Chart

Matching Symbols:

the dot . match a single character no matter what it is
character class [abcdefg] match one of the characters specified in between the brackets, [].
character class range [a-z]  match any single letter from the lower case 26 alphabetic letters.
complement of the character class [^a-z] match any single letter that is in the class of characters which is not in a,b,c,d,e ... z.


The Example File:

    alex@terminal$ cat words.txt
    california
    massachusetts
    michigan

Simple Match & Replace

    sed 's/match/replace/' words.txt

    example:  's/california/massachusetts/' words.txt

    result: replaces all literal matches of california with massachusetts

Add to a Matched String

    sed 's/match/&match/' words.txt

    example: 's/california/& is great/' words.txt

    result: replaces lines containing 'california' with the literal text 'california is great'
    
Substring Replacement

    sed 's/\(ignore group #1\)match/\1replacement/' words.txt
    
    **example**: sed 's/califor\(.*a\)/\1gara falls/' words.txt
    
    **explanation**: sed protects text in the match section which is placed in parentheses () alone.
    You can refer to it in the replace section, which is useful.
    Without escaping the '(' and ')' characters, we would have s/(califor).*a/1replacement/'
    I find thinking of it without the escaping at first helps one understand what's actually going on.  Sed is LEAVING the parenthetical text alone.
    However, we can use each parenthetical chunk from the match section in the replace section by refering to its position, starting with 1.  
    We have to escape that number, as well, to tell sed that it isn't to be a literal replacement.
    
    **result**: don't replace anything in the escaped parentheses, aka the 'nia' ending in california. 
    Replace the non-protected text with 'gara falls' and place that after the previously protected text.
    
