(define (A x y)
 (cond ((= y 0) 0)
       ((= x 0) (* 2 y))
       ((= y 1) 2)
       (else (A (- x 1)
                (A x (- y 1))))))

;; multiplication, (A 0 n) => 2n
;; exponentiation, (A 1 n) => 2^{n}
;; tetration, (A 2 n) => ^{n}2
