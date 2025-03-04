(require mzlib/compat racket/function)

(define ll-numeros '((1 3 -10) (5 -8 0 17 21) (8 3)))

; Given the list ll-numeros, where elements are sublists of integers,
; obtain a new list of lists containing only the even values from the original sublists.

(display "Filtered evens: ")
(map (lambda (l)
       (filter even? l)) ll-numeros)

; Using currying to filter the values

(display "Filtered evens (curry): ")
(map (curry filter even?) ll-numeros)

; curry returns a lambda function
; (curry filter even?) <=> (lambda(l) (filter even? l))

; Observations on lambda functions with one argument:
; ----------------------------------------------------
; (lambda(x) (f x)) <=> (f x);  lambda definition is redundant here
;
; Example:
;(define f (lambda(l) (length l))) ; the lambda definition is unnecessary
;
; If we wanted to use f as an alias for the length function, it would be simpler (and better) to do:
;
; (define f length)
; (f '(1 2 3 4)) ;=> 4
;
; This also works for functions with two or more arguments
; (lambda(x y) (f x y)) <=> (f x y)

; Currying:
; ----------
; Currying is useful for functions with 2 or more arguments.
;
; For a function with 2 arguments, f(x, y), once the first argument (x = a) is known,
; the function of one argument evaluating to f(a, y) is the lambda function returned by curry(f, a).
; That is,
; curry(f, a) = y -> f(a, y)
;
; curry(filter, even?) =>  y -> filter(even?, y)

(define div-5/x (curry / 5))

; Returns the lambda function: x -> 5 / x. Note that the order is important.
; In general, curry(f, a) = x -> f(a, x), which is not the same as x -> f(x, a), unless f is associative (e.g., addition +).

(display "div-5/x(3): ")
(div-5/x 3)
(display "div-5/x(2.0): ")
(div-5/x 2.0)

; The lambda function x -> f(x, a) is curryr(f, a). For example, if the divisor is known rather than the dividend
; (as in the div-5/x function)

(define div-x/5 (curryr / 5))

(display "div-x/5(3): ")
(div-x/5 3)
(display "div-x/5(2.0): ")
(div-x/5 2.0)

; In Racket, the following definition of the function 5/x would be equivalent
; to the function div-5/x (ignoring that div-5/x accepts a variable number of arguments via the / function):

(define 5/x
  (lambda(x)
    (/ 5 x)))

(display "5/x(3): ")
(5/x 3)
(display "5/x(2.0): ")
(5/x 2.0)

; To make div-5/x and 5/x fully equivalent, the lambda function should also accept a variable number of arguments
; (all divisors of 5):

(define 5/x
  (lambda x
    (/  5 (apply * x))))

(display "div-5/x(2, -1, 3.0): ")
(div-5/x 2 -1 3.0)
(display "5/x(2, -1, 3.0): ")
(div-5/x 2 -1 3.0)

; Lambda functions of the form x -> f(a, g(x)) are not directly related to currying of f, but can be obtained
; using it in the predefined function compose:
; compose(curry(f, a), g)
;
; Examples:
(define datos '((a (16 -3 4 0)) (b (5 8 0 11 2)) (c (8 19 9 -15))))

; Obtain the sums of the numeric lists from datos
(display "Sums: ")
(map (lambda(x)
       (apply + (cadr x))) datos)

; (map (curry apply +) datos) does not work

(display "Sums (compose): ")
(map (compose (curry apply +) cadr) datos)

; Obtain the list of numbers corresponding to a given symbol

(display "Numbers of n2: ")
(cadar (filter (compose (curry eq? 'a) car) datos))

; In this case, we can curry member directly
(display "Numbers of n2: ")
(cadar (filter (curry member 'a) datos))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use FOS to define the function binary-and(n1, n2) which
;; returns the AND of two binary numbers represented by
;; lists of zeros and ones.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (binary-and n1 n2)
 ; (map [lambda(x y) (* x y)] n1 n2)) ;; penalizes
  (map * n1 n2))

(display "binary-and: ")
(binary-and '(1 1 0 0 1 0 1 0) '(0 1 0 1 1 0 1 1))  ; => (0 1 0 0 1 0 1 0)

;;-------------------------------------------------------------------------
;; Use FOS to define the function maxLength(l1, l2, l3, ...) which
;; returns the greatest length of the lists provided as arguments. 
;;-------------------------------------------------------------------------

;(display "maxLength: ")
;(maxLength '(a (b c)) '(1 2 3 4) '((a b) (c d) e (f) g)) ;=> 5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Define the FOS function with variable parameters
;; filtrar-for(f, l1, l2, ...)
;; which returns the list: (filter(f, l1) filter(f, l2) ...)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(displayln "filter:")
;(filter-for atom? '(1 (2) 3) '(9 (2 3)) '(0 1 6))      ; => ((1 3) (9) (0 1 6))
;(filter-for number? '(a (b) 3) '(d (2 e)) '(a 1 (b)))  ; => ((3) () (1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Next we define the symbol Datos whose evaluation provides
;; information organized by key fields (name, studies, etc.)
;; of several people.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define
 Datos
 '(((nombre LUIS) (sexo V) (apellidos GARCIA PEREZ) (estudios (INFORMATICA MEDICINA)) (edad 26) (en_activo #t))
  ((en_activo #t) (sexo M) (nombre MARIA) (apellidos LUZ DIVINA) (edad 23) (estudios (INFORMATICA)))
  ((nombre ADOLFO) (sexo V) (estudios (INFORMATICA)) (apellidos MONTES PELADOS) (edad 24) (en_activo #f))
  ((nombre ANA) (apellidos GARCIA GONZALEZ) (edad 22) (sexo M) (estudios ()) (en_activo #t))
  ((sexo V) (estudios ()) (nombre JOSE) (en_activo #f) (apellidos PEREZ MONTES) (edad 36) )
  ((edad 12) (nombre JOSHUA) (apellidos IGLESIAS GARCIA) (sexo V) (estudios ()) (en_activo #t))
  ((nombre MARUJA) (edad 9) (sexo M) (estudios ()) (apellidos FERNANDEZ GARCIA) (en_activo #f))
  ((apellidos PUERTAS VENTANAS) (nombre GUILLERMO) (en_activo #f) (edad 2) (sexo V) (estudios (ECONOMIA)))))

;; Define the function info(key, p) which returns a list with the value
;; associated with the key for a given person p.

;(display "info: ")
;(info 'apellidos (cadr Datos))  ; => (LUZ DIVINA)

;; Define the function buscar(key, datos) which returns the list with the given key information
;; for all people in datos.

;(display "buscar: ")
;(buscar 'nombre Datos)  ; => ((LUIS) (MARIA) (ADOLFO) (ANA) (JOSE LUIS) (JOSHUA) (MARUJA) (GUILLERMO))

;; Define the function buscar+(l-keys, datos) which returns the list with the corresponding information
;; for the given keys in l-keys for all people in datos
;;
;; Suggestion: Define a function that performs the task for a given person first, then apply it to all people in datos.

;(displayln "buscar+:")
;(buscar+ '(nombre apellidos) Datos) ;=> ((LUIS GARCIA PEREZ) (MARIA LUZ DIVINA) (ADOLFO MONTES PELADOS)...)
;(buscar+ '(nombre sexo edad) Datos) ;=> ((LUIS V 26) (MARIA M 23) (ADOLFO V 24) (ANA M 22) (JOSE V 36)...)

;;;------------------------------------------------------------------------
;;; ADDITIONAL EXERCISES
;;;------------------------------------------------------------------------

;; Define the function presentar(datos, orden_claves), this, when evaluated, will receive
;; the Datos information as the first argument and a second argument which contains
;; all the keys to the information, specifying the order in which they should be displayed.
;;
;; To sort the keys, use the predefined sort(l, f) function, which sorts
;; the elements of the list l according to the sorting function f.

;(displayln "presentar:")
;(presentar Datos '(apellidos nombre edad sexo estudios en_activo))

;; Use FOS and the presentar function to obtain the information of
;; the people in the specified order, ignoring the key but
;; showing each field in the same position of the information list:

; ((LUIS GARCIA PEREZ 26 V (INFORMATICA MEDICINA) #t)
;  (MARIA LUZ DIVINA 23 M (INFORMATICA) #t)
;  (ADOLFO MONTES PELADOS 24 V (INFORMATICA) #f)
;  (ANA GARCIA GONZALEZ 22 M () #t)
;  (JOSE PEREZ MONTES 36 V () #f)
;  (JOSHUA IGLESIAS GARCIA 12 V () #t)
;  (MARUJA FERNANDEZ GARCIA 9 M () #f)
;  (GUILLERMO PUERTAS VENTANAS 2 V (ECONOMÍA) #f))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Define with FOS the function change-all(l, u, v) which returns
;; the resulting list of changing each element u of l to v.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(display "change-all: ")
;(change-all '((a) b 2 (a 3) (a) a) '(a) 0)  ; => (0 b 2 (a 3) 0 a)

;;
;; Currified version
;; -------------------
;; Define the function choose(u, v, z) which returns v if u is equal to z and
;; z otherwise. Use this function to provide a currified version of the function change-all

;(display "change-all: ")
;(change-all '((a) b 2 (a 3) (a) a) '(a) 0)  ; => (0 b 2 (a 3) 0 a)

;;-------------------------------------------------------------------------
;; Define the recursive function fill(x, l). Given a list l, this
;; function returns a list of all the possible sublists that can
;; be obtained by inserting x at each distinct position in l
;;
;; fill(x, ()) = ( (x) )
;; fill(x, (a b)) = ( (x a b) (a x b) (a b x) )
;;-------------------------------------------------------------------------

;(display "fill: ")
;(fill 'x '(a (b c) d)) ; => ((x a (b c) d) (a x (b c) d) (a (b c) x d) (a (b c) d x))

;; Provide a currified version of the fill function

;(display "fill (curry): ")
;(fill 'x '(a (b c) d)) ; => ((x a (b c) d) (a x (b c) d) (a (b c) x d) (a (b c) d x))

;;-------------------------------------------------------------------------
;; Define the symbol my-curry as a lambda function to behave
;; the same way as the currying of a function f(x, y) with two
;; arguments.
;;
;; If the previous definition is too complex, you can try the
;; alternative of defining two functions g(f) and h(f, x) that return
;; the equivalent lambda functions for curry(f) and curry(f, x), respectively.
;;-------------------------------------------------------------------------

