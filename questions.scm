; Some utility functions that you may find useful.
(define (cons-all first rests)
  (define (helper first rests new)
    (if ((null? rests) new)
    (helper first (cdr rests) (append new (append (list first) (car rests))))
    )
  )

(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cddr x) (cdr (cdr x)))
(define (cadar x) (car (cdr (car x))))

;; Returns a list of two-element lists
(define (enumerate lst)
  (define (helper new old index)
    (if (null? old) new
        (helper (append new (list (list index (car old)))) (cdr old) (+ index 1)))
  )
  (helper '() lst 0)
)

(enumerate '(5 6 7 8))
; expect ((0 5) (1 6) (2 7) (3 8))

; Make sure the lists are in descending order
(list-change 10 '(25 10 5 1))
; expect ((10) (5 5) (5 1 1 1 1 1) (1 1 1 1 1 1 1 1 1 1))
(list-change 5 '(4 3 2 1))
; expect ((4 1) (3 2) (3 1 1) (2 2 1) (2 1 1 1) (1 1 1 1 1))


;; Returns a function that takes in an expression and checks if it is the special
;; form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

