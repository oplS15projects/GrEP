#lang racket
(require racket/gui/base)
(require racket/include)
(require plot)
(require web-server/formlets)

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

;----------------------------------------------------------------------------
;Author:Nicholas Forsyth, nicholas_forsyth@student.uml.edu
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
(define func2(λ(x) (* -2 x)))
(define n-func (lambda (x) (* 2 x)))

;(define textf (new text-field% [parent panel] [label "Put function here:  "]))
;Creates a button in the frame.
(new button% [parent panel]
     [label "Update!"]
     ;Creates a callback procedure for a button click:
     [callback (λ(button event)
               ;(set! n-func (eval (read (open-input-string "(lambda (x) (send n-textf get-value))"))))
                               ; (eval (read (open-input-string (send n-textf get-value)))))
               (define n-labl
                 (send msg set-label (string-append "func: " (send n-textf get-value))))
             ;λ(x) (set! func1 (λ(z) (cadr n-textf))))
             ;(let* ([funcn (car (string->number (send n-textf get-value)))])
                 (display n-func)
             (send msg set-label "Updating the function...")
                 (plot (list (axes)
              (function (lambda (x) (0)) -2 2)
              ;(function n-func -2 2 #:color 5)
              (function (eval (read (open-input-string (send n-textf get-value)))) #:color 0 #:style 'dot)
              ))
                 (send frame show #t)
                 (send msg set-label "Updated"))])


;this works!!!!!!!!!!!!!!!!!
;(plot (function (eval (read (open-input-string (send n-textf get-value))))) #:x-max 10 #:x-min -10)





;This is the code to get the text from the text box.
;Send get-value returns the text from the textbox
;(send textf get-value)
;When we set! the functions below this is what we can use to get the text
;from the textbox.

;func1 is going to be the text in the text box.
;Adjust func1 using a set! procedure.
;(define func1(λ (x) (* 2 x)))

;func2 is regular function to plot with it.
;This is a case to compare.
;(define func2 (λ (x) (* x x)))


;Probably going to use set! to change the functions when a button is hit.
;I am thinking of making an update button.
;When the button is hit procedure goes off and functions are re-set! with
;updated text from text box.

;plots the two functions
;outputs to a window
(plot-new-window? #t)

;title of the window
(plot-title "Test Functions")

;plots list of functions along the axis.
(plot (list (axes)
                  (function func1 -10 10 #:label "y = Test x" #:color 100)
                  (function func2 -10 10 #:label "y = x^2" #:color 1)))
                  
;Looking at this to see if we can have an cond with true when "Enter" is pressed.
;(send a-top-level-window on-traverse-char event)

;Also looking at gui events to see if we can use a button press to trigger re-set!
;functions
;(struct gui-event (start end name) #:prefab)

(send frame show #t)





