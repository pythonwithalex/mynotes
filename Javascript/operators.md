#### JS Operators

#### Using '&&' and '||'

When you have multiple boolean expressions linked by the '&&', the main expression returns false if any sub-expressions are false.  It returns true otherwise. The evaluation stops at the first false value. This is called 'short-circuiting' because not all of the expressions are evaluated.

    true && true && true
    // true
    
    true && true && false
    // false
    
If you have non-booleans involved in a group of logical expressions, the value returned is the last truthy or true value on the right, unless false is present.


    'cat' && 'dog' && 'bear'
    // returns 'bear'
    true && 'dog' && 'bear'
    // returns 'bear'
    'dog' && 'bear' && true
    // true
    'dog' && false && 'dog'
    // false
