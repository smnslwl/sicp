#lang sicp

; Exercise 1.4

; Observe that our model of evaluation allows for combinations
; whose operators are compound expressions. Use this observation
; to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; Instead of doing (+ a (abs b)) where the absolute value of b is
; added with a, the operator to operate on a and b is selected
; based on whether b is positive or negative. If the value of b
; is positive, the + operator is applied to a and b, (+ a b).
; However, if the value of b is negative, the - operator is
; applied between a and b, (- a b). Since subtracting a negative
; number is the same as adding its absolute value, the procedure
; gives the correct result.

(a-plus-abs-b 10 -5)
