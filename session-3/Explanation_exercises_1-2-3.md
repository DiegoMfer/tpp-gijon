# Explanation of the Scheme Code

Below is a breakdown of the given code and how it works.

## Function Definition: `Extrae`

```scheme
(define (Extrae datos Filtro Formato)
  (map Formato (filter Filtro datos)))
```

- **`Extrae`** is a function that takes three arguments:
  1. **`datos`**: A list of data elements.
  2. **`Filtro`**: A predicate function used to filter elements in `datos`.
  3. **`Formato`**: A function that formats or extracts a part of each element.
  
- **Filtering Step:**
  - The expression `(filter Filtro datos)` applies the `Filtro` function to each element in `datos` and **keeps only** those elements for which `Filtro` returns `true`.

- **Mapping Step:**
  - The expression `(map Formato ...)` then applies the `Formato` function to each of the filtered elements, transforming them as specified.

**Summary:**  
The `Extrae` function first **filters** the data using the predicate `Filtro` and then **maps** the formatting function `Formato` over the filtered list.

---

## Data Example: `numeros`

```scheme
(define numeros
  '((n1 (3 7 3)) (n2 (3 4 9 0 1)) (n3 (3 0 3 4)) (n4 (7))))
```

- **`numeros`** is a list of pairs.
  - Each pair consists of a **name** (e.g., `n1`, `n2`, etc.) and a **list of digits**.
  
For example:
- `(n2 (3 4 9 0 1))` represents the number named `n2` with the digits `3 4 9 0 1`.

---

## Exercise 2: Extracting Names with More Than 3 Digits

```scheme
(displayln "\nExercise 2) Names with more than 3 digits: ")
(Extrae numeros (lambda (x) (> (length (cadr x)) 3)) car)
```

- **Filtering Condition:**
  ```scheme
  (lambda (x) (> (length (cadr x)) 3))
  ```
  - For each element `x` in `numeros`, `(cadr x)` retrieves the second element (the list of digits).
  - `(length (cadr x))` computes the number of digits.
  - The lambda function returns `true` if the number of digits is greater than 3.

- **Formatting Function:**
  - The function `car` is used to extract the first element (the name) of each pair.

**Process:**
1. **Filter**: Only pairs where the digit list has **more than 3 elements** are retained.
2. **Map**: The `car` function extracts the **name** from each filtered pair.

---

## Exercise 3: Displaying Full Information for Numbers with More Than 3 Digits

```scheme
(displayln "\nEjercicio 3) Números con más de 3 dígitos (toda la información): ")
(filter (lambda(x) (> (length (cadr x)) 3)) numeros)
```

- **Objective:**
  - Retrieve and display all the information for numbers that have **more than 3 digits**, without using the `Extrae` function.

- **Filtering Condition:**
  ```scheme
  (lambda(x) (> (length (cadr x)) 3))
  ```
  - For each element `x` in `numeros`, `(cadr x)` retrieves the list of digits.
  - `(length (cadr x))` calculates the number of digits.
  - The lambda returns `true` if the number has more than 3 digits.

- **Using `filter`:**
  - The `filter` function applies the lambda to each element in `numeros`.
  - Only the elements (which include both the name and the list of digits) that satisfy the condition are kept.
  
**Outcome:**  
The `filter` function returns a list of all numbers from `numeros` that have more than 3 digits, including their complete information.

---

## Final Summary

- **`Extrae` Function:**  
  A higher-order function that:
  - **Filters** the input data (`datos`) using the predicate (`Filtro`).
  - **Transforms** the filtered data using a formatting function (`Formato`).

- **Usage in Exercise 2:**  
  Extracts the **names** of numbers from `numeros` where the list of digits contains **more than 3 elements**.

- **Usage in Exercise 3:**  
  Directly applies `filter` to retrieve the **entire information** (name and digits) for numbers in `numeros` that have **more than 3 digits**.

This modular approach allows you to easily adjust the filtering condition and formatting function for various tasks, making your code more reusable and flexible.
