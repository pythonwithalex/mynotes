#### JS Operators

#### Using '&&'

When you have multiple boolean expressions linked by the '&&', the main expression returns false if any sub expressions false.  It returns true otherwise.

    true && true && true
    // true
    
    true && true && false
    // false
    
When your expressions involve one ore more non-booleans, the value returned is the last truthy or true value on the right if any truthy values are present.  
Otherwise the expression evaluates to false.

    'cat' && 'dog' && 'bear'
    // returns 'bear'
    true && 'dog' && 'bear'
    // returns 'bear'
    'dog' && 'bear' && true
    // true
    'dog' && false && 'dog'
    // false
