#lang racket

(require racket/gui/base)
(require racket/include)
(require plot)

(include "gui.rkt")

;----------------------------------------------------------------------------
;Author: Emily Seto, Email: emily_seto@student.uml.edu

;Took inspiration from ps5b, exercise 2.57 from SICP:
;Define checks for variables, same variables, and numbers.
(define (var? x) (symbol? x))
(define (same-var? v1 v2)
  (and (var? v1)
       (var? v2)
       (eq? v1 v2)))
(define (=number? exp num)
  (and (number? exp) (= exp num)))

;----------------------------- IN-FIX NOTATION ------------------------------
;For input values given in in-fix notation:
;Define checks for various arithmetic operations:
(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define (difference? x) (and (pair? x) (eq? (car x) '-)))
(define (product? x) (and (pair? x) (eq? (car x) '*)))
(define (quotient? x) (and (pair? x) (eq? (car x) '/)))
(define (exponentiation? x) (and (pair? x) (eq? (car x) '**)))
(define (modulus? x) (and (pair? x) (eq? (car x) '%)))

;Define operations:
(define (make-sum a1 . augend) 
  (cond ((= (length augend) 0) a1)
        ((= (length augend) 1)
         (let* ([a2 (car augend)])
           (cond ((=number? a1 0) a2)
                 ((=number? a2 0) a1)
                 ((and (number? a1) (number? a2))
                  (+ a1 a2))
                 (else (list '+ a1 a2)))))
        (else (append (list '+ a1) (make-sum augend)))))

(define (make-difference m1 . minuend)
  (cond ((= (length minuend) 0) m1)
        ((= (length minuend) 1)
         (let* ([m2 (car minuend)])
           (cond ((=number? m1 0) m2)
                 ((=number? m2 0) m1)
                 ((and (number? m1) (number? m2))
                  (- m1 m2))
                 (else (list '- m1 m2)))))
         (else (append (list '- m1) (make-difference minuend)))))
             
(define (make-product m1 . multiplicand)
  (cond ((= (length multiplicand) 0) m1)
        ((= (length multiplicand) 1)
         (let* ([m2 (car multiplicand)])
           (cond ((=number? m1 0) m2)
                 ((=number? m2 0) m1)
                 ((and (number? m1) (number? m2))
                  (* m1 m2))
                 (else (list '* m1 m2)))))
         (else (append (list '* m1) (make-product multiplicand)))))
                 
                 
(define (make-quotient d1 . dividend)
  (cond ((= (length dividend) 0) d1)
        ((= (length dividend) 1)
         (let* ([d2 (car dividend)])
           (cond ((=number? d1 0) d2)
                 ((=number? d2 0) d1)
                 ((and (number? d1) (number? d2))
                  (/ d1 d2))
                 (else (list '/ d1 d2)))))
        (else (append (list '/ d1) (make-quotient dividend)))))

(define (make-exponentiation x y)
  (cond ((= y 0) 1)
        ((= y 1) x)
        (else (list '** x y))))

(define (make-modulus d1 . dividend) 'z)

;Defines a menu bar (for funsies!):
(define menu-bar (new menu-bar% [parent frame]))
(new menu% [label "&File"] [parent menu-bar])
(new menu% [label "&Edit"] [parent menu-bar])
(new menu% [label "&Help"] [parent menu-bar])

;Creates a new text field:
(define n-textf (new text-field%
                     [label "Enter function here: "]
                     [parent panel2]))
                     ;[init-value "i.e. x ** 2"]))
;Creates a new object that takes in a function.
;(define (make-new-function func0)
;  (λ(x)
;    (cond ((eq? 
;The following code retrives the text from a textbox.
;Send get-value returns the text from the textbox.
;set! the functions below in order to get the text from the textbox.
;(define input (send n-textf get-value))

;func1 is going to be the text in the textbox.
;Adjust func1 using a set! procedure.
(define func1
  (λ(x) (* 2 x)))
;;When func1 is defined with (λ(x) x)), it doesn't plot.

;func2 is a regular function plot with it.
;This is a case to compare.
(define func2(λ(x) (* x x)))


;(define textf (new text-field% [parent panel] [label "Put function here:  "]))
;Creates a button in the frame.
(new button% [parent panel]
     [label "Update!"]
     ;Creates a callback procedure for a button click:
     [callback (λ(button event)
               (define n-func (λ(x) (eval (read (send n-textf get-value)))))
                               ; (eval (read (open-input-string (send n-textf get-value)))))
               (define n-labl
                 (send msg set-label (string-append "func: " (send n-textf get-value))))
             ;λ(x) (set! func1 (λ(z) (cadr n-textf))))
             ;(let* ([funcn (car (string->number (send n-textf get-value)))])
             (plot (list (axes)
                         (function n-func -10 10 #:label "new test x" #:color 100)
                         (function func2 -10 10 #:label "y = x^2" #:color 1)))
                 (display n-func)
             (send msg set-label "Updating the function..."))])
