#lang racket

(require racket/gui/base)
(require racket/include)
(require plot)

(include "gui.rkt")
(include "gui_to_lot.rkt")

;----------------------------------------------------------------------------
;Author: Michael Forsyth
;The following code plays with functions and displays them in a new window.
;Working on plotting the input from textbox. My theory is to use a lambda
;that uses get-text and set! to update and then re-output the plots in a
;new window

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
