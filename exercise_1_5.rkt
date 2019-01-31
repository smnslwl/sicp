#lang sicp

; Exercise 1.5

; Ben Bitdiddle has invented a test to determine whether the
; interpreter he is faced with is using applicative-order
; evaluation or normal-order evaluation. He defines the following
; two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

; Then he evaluates the expression

(test 0 (p))

; What behavior will Ben observe with an interpreter that uses
; applicative-order evaluation? What behavior will he observe with
; an interpreter that uses normal-order evaluation? Explain your
; answer. (Assume that the evaluation rule for the special form
; if is the same whether the interpreter is using normal or
; applicative order: The predicate expression is evaluated first,
; and the result determines whether to evaluate the consequent or
; the alternative expression.)

; Applicative-order evaluation:
; Since each formal parameter has to be replaced by the corresponding
; argument, the y parameter in the test procedure is replaced with (p),
; and this causes an infinite loop.

(test 0 (p))

; Normal-order evaluation:
; Before evaluating the operands 0 and (p), test is first converted
; into the if form. Thus (p) will never have to be evaluated.

(if (= x 0)
    0
    (p))
