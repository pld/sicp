(define (carmichael? n)
  (define (carmichael-iter n a)
    (cond ((= a 0) #f)
          ((congruent? (expt a n) a n) #t)
          (else
            (carmichael-iter n (- a 1)))))
  (define (congruent? a b n)
    (= (remainder a n)
       (remainder b n)))
  (carmichael-iter n (- n 1)))

(define (expmod base exp m)
  (define (non-trivial-sqrt n)
    (cond ((< n 2) n)
          ((= n (- m 1)) n)
          ((= (remainder m n) 1) 0)
          (else n)))
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (non-trivial-sqrt (square (expmod base (/ exp 2) m)))
                   m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (miller-rabin-test n)
  (define (try-it n a)
    (cond ((= (expmod a (- n 1) n) 0) #f)
          ((< a (/ n 2)) #t)
          (else
            (try-it n (- a 1)))))
  (try-it n (- n 1)))

(define (prime? n)
  (cond ((< n 3) #t)
        ((even? n) #f)
        (else
         (miller-rabin-test n))))
