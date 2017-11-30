(define (find s predicate)
  (cond
  ((null? s) False)
  ((predicate (car s)) (car s))
  (else (find (cdr-stream s) predicate))
  )
)

(define (scale-stream s k)
  (cond
      ((null? s) ())
      (else (cons-stream (* (car s) k) (scale-stream (cdr-stream s) k)))
      )
)


(define (has-cycle s)
  (define (helper s value)
    (cond
    ((null? s) False)
    ((find value (lambda (x) (eq? x s))) True)
    (else (helper (cdr-stream s) (cons-stream s value)))
    )
  )
  (helper s nil)
)



(define (has-cycle-constant s)
  'YOUR-CODE-HERE
)
