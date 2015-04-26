#lang racket

(require racket/gui/base)
;(require racket/include)
(require plot)
(require web-server/formlets)

;Make a new frame by instantiating the frame% class.
(define frame (new frame%
                   [label "Graphic-al Emulation Program (GrEP)"]
                   [height 150]
                   [width 350]))
                   ;[style 'fullscreen-button]))

;Create a static default message in the frame.
(define msg (new message% [parent frame] [label "STATUS MESSAGE: Testing in progress..."]))

;Define a menu bar (for funsies!):
(define menu-bar (new menu-bar% [parent frame]))
(new menu% [label "&File"] [parent menu-bar])
(new menu% [label "&Edit"] [parent menu-bar])
(new menu% [label "&Help"] [parent menu-bar])

;Define a new horizontal panel.
(define panel (new horizontal-panel% 
                   [parent frame]
                   [alignment '(center center)]))

;Create function input text-fields:
(define i-func1 (new text-field% 
                     [label "Enter function here: "]
                     [parent frame]))
                     ;[init-value "(lambda(x) (* x x))"]))
(define i-func2 (new text-field% 
                     [label "Enter second function here: "]
                     [parent frame]))
                     ;[init-value "(lambda(x) (x))"]))

;Create min and max text-fields for bounds of Cartesian plane:
(define i-xmin (new text-field%
                    [label "x-min: "]
                    [parent panel]))
(define i-xmax (new text-field%
                    [label "x-max: "]
                    [parent panel]))
(define i-ymin (new text-field%
                    [label "y-min: "]
                    [parent panel]))
(define i-ymax (new text-field%
                    [label "y-max: "]
                    [parent panel]))

;func1 is going to be the text in the textbox.
;Adjust func1 using a set! procedure.
(define func1 (λ(x) (* 2 x)))

;func2 is a regular function plot with it.
;This is a case to compare.
(define func2(λ(x) (* -2 x)))
(define n-func (lambda (x) (* 2 x)))

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
                             (function (λ(x) (0)) 
                                       (eval (read (open-input-string (send i-xmin get-value)))) 
                                       (eval (read (open-input-string (send i-xmax get-value))))) 
                             (function n-func
                                       (eval (read (open-input-string (send i-ymin get-value)))) 
                                       (eval (read (open-input-string (send i-ymax get-value))))
                                       #:color 5)
                             (function (eval (read (open-input-string (send i-func1 get-value)))) #:color 0 #:style 'dot)
                             (function (eval (read (open-input-string (send i-func2 get-value)))) #:color 0 #:style 'dot)))
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
