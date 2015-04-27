#lang racket

(require plot)
(require racket/gui/base)
(require web-server/formlets)

(require "gui.rkt")

;func1 is going to be the text in the textbox.
;Adjust func1 using a set! procedure.
(define func1 (λ(x) (* 2 x)))

;func2 is a regular function plot with it.
;This is a case to compare.
(define func2(λ(x) (* -2 x)))
(define n-func (lambda (x) 0))

;Creates a button in the frame.
(new button% [parent frame]
     [label "Update!"]
     ;Creates a callback procedure for a button click:
     [callback (λ(button event)
               (define n-labl
                 (send msg set-label (string-append "func: " (send i-func1 get-value))))
                 (display n-func)
                 ;Capture whatever is in the min and max x,y values:
                 (define xmin (send i-xmin get-value))
                 (define xmax (send i-xmax get-value))
                 (define ymin (send i-ymin get-value))
                 (define ymax (send i-ymax get-value))
                 (send msg set-label "STATUS MESSAGE: Updating the function...")
                ;(let* ([
                 (plot (list (axes)
                             ;(function (lambda (x) (0)) -2 2)
                             (function (eval (read (open-input-string (send i-func1 get-value)))) #:label (send i-func1 get-value) #:color 2)
                             (function (eval (read (open-input-string (send i-func2 get-value)))) #:label (send i-func2 get-value) #:color 5))
                        #:x-min (eval (read (open-input-string xmin)))
                        #:x-max (eval (read (open-input-string xmax)))
                        #:y-min (eval (read (open-input-string ymin))) 
                        #:y-max (eval (read (open-input-string ymax)))
                        )
                 (send frame show #t)
                 (send msg set-label "STATUS MESSAGE: Updated"))])


;this works!!!!!!!!!!!!!!!!!
;(plot (function (eval (read (open-input-string (send n-textf get-value))))) #:x-max 10 #:x-min -10)

;This is the code to get the text from the text box.
;Send get-value returns the text from the textbox
;(send textf get-value)
;When we set! the functions below this is what we can use to get the text
;from the textbox.

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
