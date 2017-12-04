;; Scheme ;;
(define (compose-all funcs)
  (cond
  ((null? funcs) (lambda (x) x))
  ((null? (cdr funcs)) (car funcs))
  (else (lambda (x) ((compose-all (cdr funcs)) ((car funcs) x)))))
)

(define (deep-map fn s)
  (cond
  ((null? s) ())
  ((list? (car s)) (cons (deep-map fn (car s)) (deep-map fn (cdr s))))
  (else (cons (fn (car s)) (deep-map fn (cdr s))))
  )
)

#test for github
