#lang racket
(require 2htdp/universe 2htdp/image)

;; Not using an image here because that changes the source code
;; from text to binary. 
(define LOCOMOTIVE (text "TRAIN" 12 "black"))
(define HEIGHT (+ (image-height LOCOMOTIVE) 100))
(define WIDTH (* (image-width LOCOMOTIVE) 8))

(define (start)
  (big-bang 0
            (on-tick update-position)
            (to-draw draw-plane)))

(define (draw-plane current-state)
  (place-image LOCOMOTIVE current-state (/ HEIGHT 2)
               (empty-scene WIDTH HEIGHT)))

(define (update-position current-state)
  (if (>= current-state (+ (image-width LOCOMOTIVE) WIDTH))
      0
      (+ 2 current-state)))
            
