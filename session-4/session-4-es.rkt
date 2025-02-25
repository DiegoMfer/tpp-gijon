(require mzlib/compat racket/function)

; -------------------------------------------------------------------------------------
; EJERCICIOS DE REPASO OBTENIDOS DE EXÁMENES ANTERIORES
; -------------------------------------------------------------------------------------

; --- DEFINICIONES NECESARIAS PARA LA REALIZACIÓN DE LOS EJERCICIOS ---
;
; Nota: Puedes saltarte estas definiciones y comenzar directamente con el ejercicio 1.
; Si un ejercicio requiere alguna de estas definiciones, regresa a este bloque.

; Base de datos con las notas obtenidas por estudiantes en CINCO exámenes (notas sobre 10)
; Si el estudiante no se ha presentado a un examen, ese examen no figura en los datos.
(define AlmacenNotas '(
  ( (Menéndez Pérez, Luis) (EXAMEN1 3.3) (EXAMEN2 6.7)  (EXAMEN4 8.0) )
  ( (Idaho, Duncan) (EXAMEN1 5.1) (EXAMEN2 5.5) (EXAMEN3 6.5)  (EXAMEN4 10.0) )
  ( (Riestra García, Verónica) (EXAMEN1 3.5) (EXAMEN2 7.0) (EXAMEN3 4.5)  (EXAMEN4 10.0) (EXAMEN5 10.0) )
  ( (Atreides, Paul) (EXAMEN1 9.1) (EXAMEN2 10.0) (EXAMEN4 9.0) (EXAMEN5 9.0) )
  ( (Pika Pika, Pikachu) (EXAMEN2 6.35) (EXAMEN4 3.7) (EXAMEN5 4.5) )
  ( (Stark, Anthony Edward) (EXAMEN1 10.0) (EXAMEN2 10.0) (EXAMEN3 10.0)  (EXAMEN4 10.0) (EXAMEN5 10.0) )
  ( (Danvers, Carol) (EXAMEN1 9.1) (EXAMEN5 10.0) )
))

; Definición de las ponderaciones de cada examen (en tanto por uno)
(define Ponderaciones '(0.3 0.15 0.2 0.15 0.2))

; Elegimos a una persona para probar los ejercicios
(define unaPersona (cadddr AlmacenNotas))
(displayln "unaPersona es")
(displayln unaPersona)

; Elegimos a otra persona para probar los ejercicios
(define otraPersona (caddr AlmacenNotas))
(displayln "otraPersona es")
(displayln otraPersona)

; Función que, dado un estudiante, retorna la lista de sus notas, añadiendo 0.0 para exámenes no presentados.
; Por ejemplo, para el estudiante Luis, retorna: (3.3 6.7 0.0 8.0 0.0)
; (No es necesario que entiendas el código de esta función para los ejercicios siguientes.)
(define (notasCompletas est)
  (map (lambda (nexam)
         (let ([par (filter (lambda (elem)
                              (eq? (car elem)
                                   (string->symbol (string-append "EXAMEN" (number->string nexam)))))
                            est)])
           (if (null? par)
               0
               (cadar par))))
       '(1 2 3 4 5)))

; -------------------------------------------------------------------------------------
; AHORA TE TOCA TRABAJAR A TI
; -------------------------------------------------------------------------------------

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EJERCICIO 1:
;; ============
;;
;; Definir, UTILIZANDO FOS, una función contarAprobados(vNotas, umbral) que dado un
;; vector (lista) de notas reales (0 a 10) y un valor umbral retorne un entero indicando
;; el número de notas en el vector que son mayores o iguales al umbral.
;;
;; Clues:
;; - Usa 'filter' para seleccionar solo las notas que cumplen (>= umbral).
;; - Usa 'lambda' para definir la condición.
;; - Usa 'length' para contar la cantidad de elementos filtrados.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (contarAprobados vNotas umbral)
  ;; IMPLEMENT HERE
  )

(displayln "\nEjercicio 1): ")
;; PRUEBAS DE FUNCIONAMIENTO
;; (contarAprobados '(2.3 5 2.7 7 3.14) 5.0)  ; => 2
;; (contarAprobados '(9.7 6.3 4.5 7.8 10.0) 4.0)  ; => 5

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EJERCICIO 2:
;; ============
;;
;; A partir de la base de datos de notas (AlmacenNotas), define las siguientes funciones
;; UTILIZANDO FOS. (Las soluciones deben funcionar para cualquier número de exámenes.)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; --- EJERCICIO 2a: notasEstudiante ---
;;
;; Dada la información de un estudiante (una fila de AlmacenNotas), retorna la lista de exámenes
;; presentados junto con la nota obtenida.
;;
;; Clue:
;; - Utiliza 'cdr' para omitir el nombre y obtener el resto de la lista.
(define (notasEstudiante est)
  ;; IMPLEMENT HERE
  )

(displayln "\nEjercicio 2a): ")
;; PRUEBAS DE FUNCIONAMIENTO
;; (notasEstudiante unaPersona)  ; => ((EXAMEN1 9.1) (EXAMEN2 10.0) (EXAMEN4 9.0) (EXAMEN5 9.0))
;; (notasEstudiante otraPersona)  ; => ((EXAMEN1 3.5) (EXAMEN2 7.0) (EXAMEN3 4.5) (EXAMEN4 10.0) (EXAMEN5 10.0))


;; --- EJERCICIO 2b: examenesEstudiante ---
;;
;; Retorna la misma información que en 2a, pero solo con los nombres de los exámenes.
;;
;; Clue:
;; - Usa 'map' junto con 'car' para extraer solo el nombre de cada examen.
(define (examenesEstudiante est)
  ;; IMPLEMENT HERE
  )

(displayln "\nEjercicio 2b): ")
;; PRUEBAS DE FUNCIONAMIENTO
;; (examenesEstudiante unaPersona)  ; => (EXAMEN1 EXAMEN2 EXAMEN4 EXAMEN5)
;; (examenesEstudiante otraPersona)  ; => (EXAMEN1 EXAMEN2 EXAMEN3 EXAMEN4 EXAMEN5)


;; --- EJERCICIO 2c: examenesAprobadosEstudiante ---
;;
;; Dada la información de un estudiante y un umbral de aprobado, retorna la lista de exámenes
;; presentados en los que la nota es mayor o igual al umbral.
;;
;; Clues:
;; - Primero, usa 'filter' con una lambda que compare la nota (extraída con 'cadr') con el umbral.
;; - Luego, usa 'map' para extraer los nombres de los exámenes (usando 'car').
(define (examenesAprobadosEstudiante est umbral)
  ;; IMPLEMENT HERE
  )

(displayln "\nEjercicio 2c): ")
;; PRUEBAS DE FUNCIONAMIENTO
;; (examenesAprobadosEstudiante unaPersona 10.0)  ; => (EXAMEN2)
;; (examenesAprobadosEstudiante otraPersona 4.5)  ; => (EXAMEN2 EXAMEN3 EXAMEN4 EXAMEN5)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EJERCICIO 3:
;; ============
;;
;; Seguimos trabajando con la base de datos de notas (AlmacenNotas). Utiliza obligatoriamente
;; la función FOS 'filter' en cada solución.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; --- EJERCICIO 3a: notasNombreEstudiante ---
;;
;; Dado un almacén de notas y el nombre completo de un estudiante (en forma de lista), retorna la
;; fila completa (registro) del estudiante.
;;
;; Clues:
;; - Usa 'filter' con una lambda que compare el primer elemento del registro (nombre) con el nombre dado.
;; - Usa 'equal?' para comparar listas/estructuras.
;; - Extrae la primera coincidencia con 'car'.
(define (notasNombreEstudiante almacen nombre)
  ;; IMPLEMENT HERE
  )

(displayln "\nEjercicio 3a): ")
;; PRUEBAS DE FUNCIONAMIENTO
;; (notasNombreEstudiante AlmacenNotas '(Menéndez Pérez, Luis))  
;;   => ((Menéndez Pérez, Luis) (EXAMEN1 3.3) (EXAMEN2 6.7) (EXAMEN4 8.0))
;; (notasNombreEstudiante AlmacenNotas '(Stark, Anthony Edward))  
;;   => ((Stark, Anthony Edward) (EXAMEN1 10.0) (EXAMEN2 10.0) (EXAMEN3 10.0) (EXAMEN4 10.0) (EXAMEN5 10.0))


;; --- EJERCICIO 3b: todoAprobado? ---
;;
;; Dado un estudiante (registro completo) y un umbral, retorna #t si el estudiante obtuvo una nota
;; mayor o igual al umbral en TODOS los exámenes.
;;
;; Clues:
;; - Utiliza la función 'notasCompletas' para obtener todas las notas.
;; - Usa 'filter' con una lambda que seleccione las notas por debajo del umbral.
;; - Si la lista resultante está vacía (usa 'null?'), entonces el estudiante aprobó en todos los exámenes.
(define (todoAprobado? est umbral)
  ;; IMPLEMENT HERE
  )

(displayln "\nEjercicio 3b): ")
;; PRUEBAS DE FUNCIONAMIENTO
;; (todoAprobado? unaPersona 3.0)  ; => #f
;; (todoAprobado? otraPersona 3.0)  ; => #t


;; --- EJERCICIO 3c: listaTodoAprobado ---
;;
;; Dado un almacén de notas y un umbral, retorna una lista con los nombres completos de todos los
;; estudiantes que han aprobado todos los exámenes.
;;
;; Clues:
;; - Usa 'filter' para seleccionar los estudiantes que cumplen con la condición (usa tu función de 3b).
;; - Usa 'map' para extraer el nombre (primer elemento) de cada registro.
(define (listaTodoAprobado almacen umbral)
  ;; IMPLEMENT HERE
  )

(displayln "\nEjercicio 3c): ")
;; PRUEBAS DE FUNCIONAMIENTO
;; (listaTodoAprobado AlmacenNotas 3.5)  
;;   => ((Riestra García, Verónica) (Stark, Anthony Edward))

; ---------------------------------------------------------------------------------------------------
; CAMBIAMOS DE TEMA
; ---------------------------------------------------------------------------------------------------

; --- DEFINICIONES NECESARIAS PARA LAS SIGUIENTES EJERCICIOS ---
;
; Base de datos describiendo las fichas de dominó de cada jugador.
; Cada ficha se representa como un par de números. La ficha se ordena de forma que el menor número
; aparece primero. Los "blancos" se representan con el número cero.
(define fichasJugadores '(
  ( (Miller, Joel) () )
  ( (Williams, Ellie) ((4 4) (3 6) (1 4) (2 5)) )
  ( (Stark, Anthony Edward) ((2 4) (3 3) (1 3) (6 6) (4 5) (0 1)) )
  ( (Danvers, Carol) ((0 4) (5 6) (2 6)) )
))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EJERCICIO 4:
;; ============
;;
;; Definir la función fichasJugador(BD, nombre) que, usando FOS, retorne la lista de fichas de dominó
;; de un jugador. La función tiene dos parámetros: la base de datos de jugadores y el nombre completo
;; de un jugador (en forma de lista).
;;
;; Clues:
;; - Usa 'filter' con una lambda para encontrar el registro cuyo nombre (primer elemento) coincide.
;; - Extrae la lista de fichas de ese registro.
(define (fichasJugador BD nombre)
  ;; IMPLEMENT HERE
  )

(displayln "\nEjercicio 4): ")
;; PRUEBAS DE FUNCIONAMIENTO
;; (fichasJugador fichasJugadores '(Williams, Ellie))  ; => ((4 4) (3 6) (1 4) (2 5))
;; (fichasJugador fichasJugadores '(Danvers, Carol))     ; => ((0 4) (5 6) (2 6))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EJERCICIO 5:
;; ============
;;
;; Definir, usando FOS, la función fichasDobles(lFichas) que, dada una lista de fichas de dominó,
;; retorne una lista con las fichas dobles (aquellas en las que ambos números son iguales).
;;
;; Clues:
;; - Usa 'filter' con una lambda que verifique si (car ficha) es igual a (cadr ficha).
(define (fichasDobles lFichas)
  ;; IMPLEMENT HERE
  )

(displayln "\nEjercicio 5): ")
;; PRUEBAS DE FUNCIONAMIENTO
;; (fichasDobles '((2 4) (3 3) (1 3) (6 6) (0 1)))   ; => ((3 3) (6 6))
;; (fichasDobles '((2 4) (0 3) (1 3) (3 6) (0 1)))       ; => ()


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; EJERCICIO 6:
;; ============
;;
;; Definir, usando FOS, la función puntosTotales(lFichas) que, dada una lista de fichas de dominó,
;; retorne la suma total de puntos de todas las fichas.
;;
;; Clues:
;; - Deberás "aplanar" la lista de fichas para tener todos los números en una sola lista.
;;   Puedes usar 'append' o una técnica similar.
;; - Usa 'apply' con '+' para sumar todos los números.
(define (puntosTotales lFichas)
  ;; IMPLEMENT HERE
  )

(displayln "\nEjercicio 6): ")
;; PRUEBAS DE FUNCIONAMIENTO
;; (puntosTotales '((2 4) (3 3) (1 3) (6 6) (0 1))) ; => 29
;; (puntosTotales '((2 4) (0 3) (1 3) (3 6) (0 1))) ; => 23
;; (puntosTotales '(()))                               ; => 0
