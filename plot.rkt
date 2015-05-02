#lang racket

(require plot)
(require racket/gui/base)
(require web-server/formlets)

(require "gui.rkt")

(define nil '())

;func1 is going to be the text in the textbox.
;Adjust func1 using a set! procedure.
(define func1 (λ(x) (* 2 x)))

;func2 is a regular function plot with it.
;This is a case to compare.
(define func2(λ(x) (* -2 x)))
(define n-func (lambda (x) 0))

;Default values for min and max of x and y
(define minx -10)
(define miny -10)
(define maxx 10)
(define maxy 10)

;Added this for the 3D.
(define i-func3 (new text-field% 
                     [label "Enter 3D function here: "]
                     [parent frame]
                     [init-value "(lambda(x y) (+ x y))"]))

;Creates a button in the frame.
(new button% [parent frame]
     [label "Update!"]
     ;Creates a callback procedure for a button click:
     [callback (λ(button event)
                 (define n-labl (send msg set-label (string-append "func: " (send i-func1 get-value))))
                 (display n-func)
                 ;Capture whatever is in the min and max x,y values:
                 (define xmin (send i-xmin get-value))
                 (define xmax (send i-xmax get-value))
                 (define ymin (send i-ymin get-value))
                 (define ymax (send i-ymax get-value))
                 ;Capures state of checkboxes.
                 (define (fun1?) (send func1-cb get-value))
                 (define (fun2?) (send func2-cb get-value))
                 (define (fun4?) (send func4-cb get-value))
                 (define (fun5?) (send func5-cb get-value))
                 (define (fun6?) (send func6-cb get-value))
                 (send msg set-label "STATUS MESSAGE: Updating the function...")
                 (let ([functions (filter (λ(x) (not (null? x))) 
                                          (list
                                           (if (fun1?)
                                               (function (eval (read (open-input-string (send i-func1 get-value)))) #:label (send i-func1 get-value) 
                                                         #:color (read (open-input-string (send i-color1 get-value)))) nil)
                                           (if (fun2?)
                                               (function (eval (read (open-input-string (send i-func2 get-value)))) #:label (send i-func2 get-value) 
                                                         #:color (read (open-input-string (send i-color2 get-value)))) nil)
                                           (if (fun4?)
                                               (function (eval (read (open-input-string (send i-func4 get-value)))) #:label (send i-func4 get-value) 
                                                         #:color (read (open-input-string (send i-color4 get-value)))) nil)
                                           (if (fun5?)
                                               (function (eval (read (open-input-string (send i-func5 get-value)))) #:label (send i-func5 get-value) 
                                                         #:color (read (open-input-string (send i-color5 get-value)))) nil)
                                           (if (fun6?)
                                               (function (eval (read (open-input-string (send i-func6 get-value)))) #:label (send i-func6 get-value) 
                                                         #:color (read (open-input-string (send i-color6 get-value)))) nil)))])
                 (plot (append (list (axes)) functions)
                        #:x-min (eval (read (open-input-string xmin)))
                        #:x-max (eval (read (open-input-string xmax)))
                        #:y-min (eval (read (open-input-string ymin))) 
                        #:y-max (eval (read (open-input-string ymax))))
                 ; For 3D graphing:
                 (parameterize ([plot-title  "Testing 3D plotting..."]
                                [plot-x-label "x"]
                                [plot-y-label "y"]
                                [plot-z-label "cos(x) sin(y)"])
                   (plot3d (contour-intervals3d (eval (read (open-input-string (send i-func3 get-value))))
                                                (- pi) pi (- pi) pi)))
                 ;(send frame show #t)
                 (send msg set-label "STATUS MESSAGE: Updated")))])


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
