
## Exercise 7: Maximum Grade per Student

**Description:**
Define a function `maxNotaEstudiante` that, given the information of a student (a row from `AlmacenNotas`), returns the maximum grade obtained by the student in all attended exams.

**Example Usage:**
```scheme
(maxNotaEstudiante unaPersona)  ; => 10.0
(maxNotaEstudiante otraPersona) ; => 10.0
```

## Exercise 8: Average Grade per Student

**Description:**
Define a function `promedioNotasEstudiante` that, given a student's information, returns the average of their grades in attended exams.

**Example Usage:**
```scheme
(promedioNotasEstudiante unaPersona)  ; => 9.025
(promedioNotasEstudiante otraPersona) ; => 7.2
```

## Exercise 9: Student with the Highest Average Grade

**Description:**
Define a function `mejorEstudiante` that, given `AlmacenNotas`, returns the name of the student with the highest average grade.

**Example Usage:**
```scheme
(mejorEstudiante AlmacenNotas)  ; => '(Stark, Anthony Edward)
```

## Exercise 10: Students Who Failed Any Exam

**Description:**
Define a function `listaConReprobados` that, given `AlmacenNotas` and a threshold, returns a list of names of students who failed at least one exam.

**Example Usage:**
```scheme
(listaConReprobados AlmacenNotas 5.0)  
; => '((Menéndez Pérez, Luis) (Pika Pika, Pikachu))
```

## Exercise 11: Domino Pieces with a Specific Number

**Description:**
Define a function `fichasConNumero` that, given a list of domino pieces and a number `n`, returns a list of pieces that contain that number.

**Example Usage:**
```scheme
(fichasConNumero '((2 4) (3 3) (1 3) (6 6) (0 1)) 3)  
; => '((3 3) (1 3))
```

## Exercise 12: Players with a Double Domino Piece

**Description:**
Define a function `jugadoresConDobles` that, given the domino database `fichasJugadores`, returns a list of player names who have at least one double piece.

**Example Usage:**
```scheme
(jugadoresConDobles fichasJugadores)  
; => '((Stark, Anthony Edward))
```

