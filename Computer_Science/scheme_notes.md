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

#### Special Forms

special form vs standard expression form: 

````scheme
special: (define a 4) ; not all sub-expressions are evaluated (a is not evaluated)
special: (and (< 0 4) (< 3 10))
normal (+ 4 9) ;  all sub-expressions are evaluated
````

A keyword is a special forms. Example of special forms: define
