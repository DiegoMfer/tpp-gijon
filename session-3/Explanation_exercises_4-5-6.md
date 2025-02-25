# Exercises 4, 5, and 6: Set Operations

This document includes the definitions and tests for the following functions:
- **Exercise 4**: `union(A, B)` using FOS with argument validation.
- **Exercise 5**: `subset?(A, B)` using FOS and specifically `filter`.
- **Exercise 6**: `subset2?(A, B)` combining `map` and `apply`.

---

## Exercise 4: `union(A, B)`

**Objective:**  
Define the function `union(A, B)` which returns the union of two sets, validating its arguments.

```scheme
(displayln "\nEjercicio 4) union: ")
; PRUEBAS DE FUNCIONAMIENTO
;(union '(c a x) 3)       ;=> error
;(union '(c a x))         ;=> error
(union '(c a x) '(a (a))) ;=> (c x a (a))
```

**Explanation:**  
- The function `union` is intended to compute the union of two sets `A` and `B`.
- It should validate that both arguments are proper sets (i.e., lists). If an argument is not a list (or is missing), the function should signal an error.
- In the test examples:
  - `(union '(c a x) 3)` and `(union '(c a x))` should produce an error due to invalid arguments.
  - `(union '(c a x) '(a (a)))` returns the union of the two sets, here shown as `(c x a (a))`.  
- **Note:** The actual implementation of `union` is not shown here, but it must include both the logic for set union and argument validation using FOS (Funciones de Orden Superior).

Result: 
```scheme
(displayln "\nEjercicio 4) union: ")

;; Función auxiliar: diferencia de conjuntos
(define (set-difference A B)
  (filter (lambda (elem) (not (member elem B))) A))

;; Función union: A U B = (A - B) ∪ B
(define (union A B)
  ;; Validación de argumentos: ambos deben ser listas (conjuntos)
  (if (and (list? A) (list? B))
      (append (set-difference A B) B)
      (error "Error: Ambos argumentos deben ser conjuntos (listas).")))

;; PRUEBAS DE FUNCIONAMIENTO:
;; (union '(c a x) 3)       ;=> error
;; (union '(c a x))         ;=> error
(displayln (union '(c a x) '(a (a)))) ;=> (c x a (a))

```

---

## Exercise 5: `subset?(A, B)`

**Objective:**  
Define the function `subset?(A, B)` using FOS (specifically `filter`), which checks if set `A` is a subset of set `B`.

```scheme
(define (subset? A B)
  (null? (filter (lambda(x) (not (member x B))) A)))

(displayln "\nEjercicio 5) subset:")
(subset? '(c b) '(a x b d c y))    ;=> #t
(subset? '(c b) '(a x b d (c) y))  ;=> #f
```

**Explanation:**  
- The function verifies whether every element in set `A` is present in set `B`.
- The lambda function `(lambda(x) (not (member x B)))` returns true for any element in `A` that is **not** found in `B`.
- `filter` gathers all such elements. If the resulting list is empty (i.e., `(null? ...)` returns `#t`), then every element of `A` is in `B` and `A` is a subset of `B`.
- The tests show that `'(c b)` is a subset of `'(a x b d c y)` (resulting in `#t`), but not a subset of `'(a x b d (c) y)` (resulting in `#f`).

---

## Exercise 6: `subset2?(A, B)`

**Objective:**  
Redefine the subset check by combining `map` and `apply`. The function `subset2?` returns `#t` if set `A` is a subset of set `B`, and `#f` otherwise.

```scheme
(define (subset2? A B)
   (if (apply _and (map (lambda(x) (member x B)) A)) #t #f))

(displayln "\nEjercicio 6) subset2?:")
(subset2? '(c b) '(a x b d c y))    ;=> #t
(subset2? '(c b) '(a x b d (c) y))  ;=> #f
```

**Explanation:**  
- This function uses `map` to check for each element in `A` whether it is a member of `B` by applying `(member x B)`.
- The results of these checks (which are truthy or false values) are then combined using `apply` with the helper function `_and`. This function `_and` should logically 'AND' all the values together.
- If every element in `A` is found in `B`, the combined result will be truthy (thus `#t`); otherwise, it will be false (thus `#f`).
- The tests verify that `'(c b)` is a subset of `'(a x b d c y)` (resulting in `#t`), but not a subset of `'(a x b d (c) y)` (resulting in `#f`).

> **Note:**  
> The helper `_and` function must be defined in your environment for this approach to work. If `_and` is not available, you may need to implement it or use an alternative logical method to combine the results.

---

This document summarizes the code and explanations for Exercises 4, 5, and 6.
