# THIS IS FOR YOU TO PRACTICE

## Exercise: Higher–Order Functions & Currying Challenge (Total: 2.5 Points)

### (1 point) Implement a Function Using HOF

**Task:**
Write a function named `filter-map` that accepts three arguments:
- A predicate function `pred`
- A mapping function `f`
- A list `lst`

The function should first filter the list using `pred` (i.e., keep only the elements for which `pred` returns true) and then apply the mapping function `f` to each of the filtered elements. Use Racket’s built-in higher–order functions such as `filter` and `map` in your solution.

**Example:**
```racket
(filter-map even? (lambda (x) (* x x)) '(1 2 3 4 5 6))
; should return '(4 16 36)
```

### (0.5 points) Currify the Function

**Task:**
Create a curried version of the `filter-map` function named `filter-map-curried` so that you can partially apply its arguments.

**Example:**
```racket
((filter-map-curried even?) (lambda (x) (* x x)) '(1 2 3 4 5 6))
; should return '(4 16 36)
```

### (1 point) Use the Curried Function for a More Complex Task

**Task:**
Using `filter-map-curried`, define a new function called `even-squares` that accepts a list of numbers and returns a list containing the squares of the even numbers.

**Example:**
```racket
(even-squares '(10 15 20 25 30))
; should return '(100 400 900)
```

## Exercise: Filtering Employee Data with HOF and Currying (Total: 2.5 Points)

### Part 1 (1 point): Implement a Function Using Higher–Order Functions

**Task:**
Implement a function named `filter-names` that takes two arguments:
- A predicate function `pred` that receives an employee record (a list) and returns a boolean.
- A list of employee records.

The function should first filter the employees based on `pred` and then return a list of names (the first element of each record) for the employees that satisfy the predicate. Use Racket’s built-in `filter` and `map`.

**Example Usage:**
```racket
(filter-names (lambda (emp) (>= (caddr emp) 4500)) employees)
; should return '(Charlie Diana Eve)
```

### Part 2 (0.5 points): Currify the Function

**Task:**
Create a curried version of the `filter-names` function named `filter-names-curried` so that the predicate can be provided first. In the curried version, the function returns another function that takes the employee list.

**Example Usage:**
```racket
(((filter-names-curried (lambda (emp) (>= (caddr emp) 4500))) employees))
; should return '(Charlie Diana Eve)
```

### Part 3 (1 point): Use the Curried Function for a More Complex Task

**Task:**
Using `filter-names-curried`, define a new function called `high-earners` that takes a list of employees and returns the names of those whose salary is at least 4500. Then, apply `high-earners` to the employees mock data.

**Example Usage:**
```racket
(high-earners employees)
; should return '(Charlie Diana Eve)
```