(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cdr (cdr s)))
)

(define (sign x)
  (cond
  ((< x 0) -1)
  ((> x 0) 1)
  (else 0))
)

(define (square x) (* x x))

(define (pow b n)
  (cond
  ((= n 1) b)
  ((= n 0) 1)
  ((even? n) (square (pow b (/ n 2))))
  (else (* b (pow b (- n 1)))))
)

(define (ordered? s)
  (cond
  ((null? (cdr s)) True)
  ((> (car s) (cadr s)) False)
  (else (ordered? (cdr s))))
)

(define (nodots s)
  (cond
  ((integer? s) (cons s ()))
  ((null? (cdr s)) (cons (car s) ()))
  ((pair? (car s)) (cons (nodots (car s)) (nodots (cdr s))))
  (else (cons (car s) (nodots (cdr s))))
  )
)

; Sets as sorted lists

(define (empty? s) (null? s))

(define (contains? s v)
    (cond ((empty? s) #f)
          ((= (car s) v) #t)
          (else (contains? (cdr s) v)) ; replace this line
          ))

; Equivalent Python code, for your reference:
;
; def empty(s):
;     return s is Link.empty
;
; def contains(s, v):
;     if empty(s):
;         return False
;     elif s.first > v:
;         return False
;     elif s.first == v:
;         return True
;     else:
;         return contains(s.rest, v)

(define (add s v)
    (cond ((empty? s) (list v))
          ((contains? s v) s)
          ((< v (car s)) (cons v s))
          (else (cons (car s) (add (cdr s) v))) ; replace this line
          ))

(define (intersect s t)
    (cond ((or (empty? s) (empty? t)) nil)
          ((contains? s (car t)) (cons (car t) (intersect s (cdr t))))
          (else (intersect s (cdr t))) ; replace this line
          ))

; Equivalent Python code, for your reference:
;
; def intersect(set1, set2):
;     if empty(set1) or empty(set2):
;         return Link.empty
;     else:
;         e1, e2 = set1.first, set2.first
;         if e1 == e2:
;             return Link(e1, intersect(set1.rest, set2.rest))
;         elif e1 < e2:
;             return intersect(set1.rest, set2)
;         elif e2 < e1:
;             return intersect(set1, set2.rest)

(define (union s t)
    (cond ((empty? s) t)
          ((empty? t) s)
          ((contains? s (car t)) (union s (cdr t)))
          (else (union (add s (car t)) (cdr t))) ; replace this line
          ))
