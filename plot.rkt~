#lang racket

(require racket/gui/base)
(require racket/include)
(require plot)
(require web-server/formlets)

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
(define func1(λ (x) (* 2 x)))

;func2 is regular function to plot with it.
;This is a case to compare.
(define func2 (λ (x) (* x x)))


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





