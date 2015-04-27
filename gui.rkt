#lang racket

(require plot)
(require racket/gui/base)
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
                     [parent frame]
                     [init-value "(lambda(x) (* x x))"]))
(define i-func2 (new text-field% 
                     [label "Enter second function here: "]
                     [parent frame]
                     [init-value "(lambda(x) x)"]))

;Create min and max text-fields for bounds of Cartesian plane:
(define i-xmin (new text-field%
                    [label "x-min: "]
                    [parent panel]
                    [init-value "-10"]))
(define i-xmax (new text-field%
                    [label "x-max: "]
                    [parent panel]
                    [init-value "10"]))
(define i-ymin (new text-field%
                    [label "y-min: "]
                    [parent panel]
                    [init-value "-10"]))
(define i-ymax (new text-field%
                    [label "y-max: "]
                    [parent panel]
                    [init-value "10"]))
(define i-xcolor (new text-field%
                    [label "x-color: "]
                    [parent panel]
                    [init-value "1"]))

;Working on a drop down menu for color selection
;(define i-xcolor (new choice%
;                    [selection 0]
;                      (label "x-color: ")
;                    (parent panel)
;                    (choices (list "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10"))))

(define i-ycolor (new text-field%
                    [label "y-color: "]
                    [parent panel]
                    [init-value "2"]))



;A list of provides:
(provide frame)
(provide msg)
(provide i-func1)
(provide i-func2)
(provide i-xmin)
(provide i-xmax)
(provide i-xcolor)
(provide i-ymin)
(provide i-ymax)
(provide i-ycolor)
