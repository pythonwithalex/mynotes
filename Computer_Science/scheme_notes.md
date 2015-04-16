## Scheme Notes (SICP)

## Evaluation: Normal order vs Applicative Order

+ Normal order doesn't evaluate the arguments until the very end.  
+ Applicative Order evalutes them at each stage

example:

````scheme

(define (square a)
  (* a a))
  
(define (sum-of-squares a b)
  (+ (square a) (square b)))

; calling sum-of-squares here
(sum-of-squares (+ 2 3) (+ 1 1))
````

+ in normal order, the arguments to sum-of-squares are simply passed through into the sum-of-squares routine.  

````scheme
(+ (square (+ 2 3)) (square (+ 1 1)))
`````

+ in applicative order, the arguments to sum-of-squares are evaluted before they are passed to the sum-of-squares routine:

````scheme
(sum-of-squares 5 2)
````

## Special Forms
Not all sub-expressions are evaluated in the standard way.

#### Special form vs standard expression form: 

````scheme
special: (define a 4) ; not all sub-expressions are evaluated (a is not evaluated)
special: (and (< 0 4) (< 3 10)) ; if the first one is false, the second isn't evaluated.
special: (or (< 0 -2) (< 3 10)) ; if the first one is true, the second isn't evaluated.
normal: (not (< 0 -2)) ; all sub-expressions are necessarily evaluted
normal (+ 4 9) ;  all sub-expressions are evaluated
````

A keyword is a special forms. Example of special forms: define

## Compound Expressions as Operators

````scheme
(define (adj a b)
    ((if (< a 0) + -) a b))
````

In line 2, `(if (< a 0) + -)` evaluates to `+` or `-`, which because of its position becomes the operator for `a b` operands.
