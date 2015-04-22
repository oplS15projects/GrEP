#lang racket
(require racket/gui/base)

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
