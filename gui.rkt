#lang racket

(require plot)
(require racket/gui/base)
(require web-server/formlets)

;Make a new frame by instantiating the frame% class.
(define frame (new frame%
                   [label "Graphic-al Emulation Program (GrEP)"]
                   [height 205]
                   [width 545]))
                   ;[style 'fullscreen-button]))

;Create a static default message in the frame.
(define msg (new message% [parent frame] [label "STATUS MESSAGE: Testing in progress..."]))

;Define a menu bar (for funsies!):
;(define menu-bar (new menu-bar% [parent frame]))
;(new menu% [label "&File"] [parent menu-bar])
;(new menu% [label "&Edit"] [parent menu-bar])
;(new menu% [label "&Help"] [parent menu-bar])

;Define new horizontal panels.
(define panel (new horizontal-panel% 
                   [parent frame]
                   [alignment '(center center)]))

(define panel-2 (new horizontal-panel%
                     [parent frame]
                     [alignment '(center center)]))

(define panel-3 (new horizontal-panel%
                     [parent frame]
                     [alignment '(center center)]))

(define panel-4 (new horizontal-panel%
                     [parent frame]
                     [alignment '(center center)]))
                   

(define panel-5 (new horizontal-panel%
                     [parent frame]
                     [alignment '(center center)]))

(define panel-6 (new horizontal-panel%
                     [parent frame]
                     [alignment '(center center)]))

(define panel-7 (new horizontal-panel%
                     [parent frame]
                     [alignment '(center center)]))

(define panel-8 (new horizontal-panel%
                     [parent frame]
                     [alignment '(center center)]))
(define panel-9 (new horizontal-panel%
                     [parent frame]
                     [alignment '(center center)]))
                   
                   
              
                   

;Create new dropdown menus:
;(define n-functs (new choice% 
;                        (label "Number of Functions: ")
;                        (parent panel)
;                        (choices (list "1" "2" "3" "4" "5"))))

;(define n-colors (new choice% 
;                        (label "Colors: ")
;                        (parent panel)
;                        (choices (list "Item 0" "Item 1" "Item 2"))))

;Create function input text-fields:
(define i-func1 (new text-field% 
                     [label "Enter 1st function here: "]
                     [parent panel-5]
                     [init-value "(lambda(x) (* x x))"]))
(define i-color1 (new text-field%
                    [label "Color: "]
                    [parent panel-5]
                    [init-value "1"]))
(define func1-cb (new check-box%
                      (parent panel-5)
                      (label "Use")
                      (value #t)))


(define i-func2 (new text-field% 
                     [label "Enter 2nd function here: "]
                     [parent panel-6]
                     [init-value "(lambda(x) x)"]))
(define i-color2 (new text-field%
                    [label "Color: "]
                    [parent panel-6]
                    [init-value "2"]))
(define func2-cb (new check-box%
                      (parent panel-6)
                      (label "Use")
                      (value #t)))

(define i-func4 (new text-field% 
                     [label "Enter 3rd function here: "]
                     [parent panel-7]))
                     ;[init-value "(lambda(x) x)"]))
(define i-color4 (new text-field%
                    [label "Color: "]
                    [parent panel-7]
                    [init-value "2"]))
(define func4-cb (new check-box%
                      (parent panel-7)
                      (label "Use")
                      (value #f)))

(define i-func5 (new text-field% 
                     [label "Enter 4th function here: "]
                     [parent panel-8]))
(define i-color5 (new text-field%
                    [label "Color: "]
                    [parent panel-8]
                    [init-value "2"]))
(define func5-cb (new check-box%
                      (parent panel-8)
                      (label "Use")
                      (value #f)))

(define i-func6 (new text-field% 
                     [label "Enter 5th function here: "]
                     [parent panel-9]))
(define i-color6 (new text-field%
                    [label "Color: "]
                    [parent panel-9]
                    [init-value "2"]))
(define func6-cb (new check-box%
                      (parent panel-9)
                      (label "Use")
                      (value #f)))


;Create min and max text-fields for bounds of Cartesian plane:
(define i-xmin (new text-field%
                    [label "x-min: "]
                    [parent panel-2]
                    [init-value "-10"]))
(define i-xmax (new text-field%
                    [label "x-max: "]
                    [parent panel-2]
                    [init-value "10"]))
(define i-ymin (new text-field%
                    [label "y-min: "]
                    [parent panel-2]
                    [init-value "-10"]))
(define i-ymax (new text-field%
                    [label "y-max: "]
                    [parent panel-2]
                    [init-value "10"]))
;(define i-xcolor (new text-field%
;                    [label "x-color: "]
;                    [parent panel-3]
;                    [init-value "1"]))

;Working on a drop down menu for color selection
;(define i-xcolor (new choice%
;                    [selection 0]
;                      (label "x-color: ")
;                    (parent panel)
;                    (choices (list "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10"))))

;(define i-ycolor (new text-field%
;                    [label "y-color: "]
;                    [parent panel-3]
;                    [init-value "2"]))


;A list of provides:
(provide frame)
(provide msg)
(provide i-func1)
(provide i-func2)
;(provide i-func3)
(provide i-func4)
(provide i-func5)
(provide i-func6)
(provide i-xmin)
(provide i-xmax)
;(provide i-xcolor)
(provide i-ymin)
(provide i-ymax)
;(provide i-ycolor)
(provide func1-cb)
(provide func2-cb)
;(provide func3-cb)
(provide func4-cb)
(provide func5-cb)
(provide func6-cb)
(provide i-color1)
(provide i-color2)
(provide i-color4)
(provide i-color5)
(provide i-color6)
