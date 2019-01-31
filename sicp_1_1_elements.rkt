#lang sicp


; ======================================================================
; 1.1 The Elements of Programming
; ======================================================================

; Mechanisms to combine simple ideas to form more complex ideas:
;
; -- primitive expressions
; -- means of combination
; -- means of abstraction


; ----------------------------------------------------------------------
; 1.1.1 Expressions
; ----------------------------------------------------------------------

486                     ; a primitive expression
(+ 2.7 10)              ; a combination of operator and operands
(+ 21 35 12 7)          ; arbitrary number of arguments
(+ (* 3 5) (- 10 6))    ; combinations can be nested

; pretty printing
(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))


; ----------------------------------------------------------------------
; 1.1.2 Naming and the Environment
; ----------------------------------------------------------------------

; Using names to refer to computational objects
; The name identifies a variable whose value is the object

(define size 2)
size
(* 5 size)

(define pi 3.14159)
(define radius 10)
(* pi (* radius radius))
(define circumference (* 2 pi radius))
circumference

; Global environment - memory maintained by the interpreter
;                      to keep track of name-object pairs


; ----------------------------------------------------------------------
; 1.1.3 Evaluating Combinations
; ----------------------------------------------------------------------

; To evaluate a combination:
;
; -- evaluate the subexpressions of the combination
; -- apply the procedure that is the value of the operator to
;    the value of the operands


; ----------------------------------------------------------------------
; 1.1.4 Compound Procedures
; ----------------------------------------------------------------------

; Procedure definitions - abstraction technique by which a compound
;                         expression can be given a name and then
;                         referred to as a unit

; defining a compound procedure
(define (square x) (* x x))

; using the defined procedure
(square 21)
(square (+ 2 5))
(square (square 3))

; use a procedure as a building block in defining other procedures
(define (sum-of-squares x y)
  (+ (square x)
     (square y)))

(sum-of-squares 3 4)


; ----------------------------------------------------------------------
; 1.1.5 The Substitution Model for Procedure Application
; ----------------------------------------------------------------------

(define (f a) (sum-of-squares (+ a 1) (* a 2)))
(f 5)

; ---- Applicative Order ----

; evaluate the body of the procedure with each formal parameter
; replaced by the corresponding argument

; (sum-of-squares (+ a 1) (* a 2))
; (sum-of-squares (+ 5 1) (* 5 2))
; (+ (square 6) (square 10))
; (+ (* 6 6) (* 10 10))
; (+ 36 100)
; 136

; ---- Normal Order ----

; substitute operand expressions for parameters until obtaining
; an expression involving only primitive operators, then
; finally evaluate the operands

; (sum-of-squares (+ 5 1) (* 5 2))
; (+    (square (+ 5 1))      (square (* 5 2))  )
; (+    (* (+ 5 1) (+ 5 1))   (* (* 5 2) (* 5 2)))
; (+         (* 6 6)             (* 10 10))
; (+           36                   100)
; 136


; ----------------------------------------------------------------------
; 1.1.6  Conditional Expressions and Predicates
; ----------------------------------------------------------------------

; the 'cond' conditional - pairs of predicates and consequent expressions
; if none of the predicates are true, value of the cond is undefined

(define (abs-1 x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))

(abs-1 -42)

; the 'cond' conditional using else
; if none of the other predicates are true, else is evaluated

(define (abs-2 x)
  (cond ((< x 0) (- x))
        (else x)))

(abs-2 -42)

; using the if conditional, has only one predicate expression
; evaluates either the consquent or the alternate expression

(define (abs-3 x)
  (if (< x 0)
      (- x)
      x))

(abs-3 -42)


; ----------------------------------------------------------------------
; 1.1.7  Square Roots by Newton's Method
; ----------------------------------------------------------------------

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))


(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
(/ (+ x y) 2))

(define (good-enough? guess x)
(< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
(sqrt-iter 1.0 x))

(sqrt 9)

(sqrt (+ (sqrt 2) (sqrt 3)))

(square (sqrt 1000))


; ----------------------------------------------------------------------
; 1.1.8  Procedures as Black-Box Abstractions
; ----------------------------------------------------------------------



























