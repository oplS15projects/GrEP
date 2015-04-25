#lang racket
(require racket/gui/base)
(require plot)

;----------------------------------------------------------------------------
;Author: Nicholas Forsyth, nicholas_forsyth@student.uml.edu
;This program was made by using Racket document tutorials.
;Comments from the tutorial are kept for clarity.

; Make a frame by instantiating the frame% class
(define frame (new frame%
                   [label "Graph-ical Emulation Program (GrEP)"]
                   [width 405]
                   [height 200]))
                   ;[style'fullscreen-button ]))

(new canvas% [parent frame]
             [paint-callback
              (lambda (canvas dc)
                (send dc set-scale 2 2)
                (send dc set-text-foreground "blue")
                (send dc draw-text "GrEP" 75 0))])


; Make a static text message in the frame
(define msg (new message% [parent frame]
                          [label "Testing in progress..."]))

; Derive a new canvas (a drawing window) class to handle events
(define my-canvas%
  (class canvas% ; The base class is canvas%
    ; Define overriding method to handle keyboard events
    (define/override (on-char event)
      (send msg set-label "Canvas keyboard"))
    ; Call the superclass init, passing on all init args
    (super-new)))

(define panel (new horizontal-panel% [parent frame] ))

; Add a text field to the dialog
;(define textf (new text-field% [parent panel] [label "Put function here:  "]))

; Add a horizontal panel to the dialog, with centering for buttons
(define panel2 (new horizontal-panel% [parent panel]
                                     [alignment '(center center)]))

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
;(define func1
;  (λ(x) (* 2 x)))
;;When func1 is defined with (λ(x) x)), it doesn't plot.

;func2 is a regular function plot with it.
;This is a case to compare.
;(define func2(λ(x) (* x x)))

