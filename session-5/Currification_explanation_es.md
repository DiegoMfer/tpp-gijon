# Currificación en Programación Funcional

La currificación es una técnica de programación funcional en la que una función que toma varios argumentos se descompone en una serie de funciones que toman un solo argumento. 

Es decir, una función f(a, b) se transforma en una serie de funciones f(a)(b), donde el primer valor a se pasa en una llamada inicial, y el segundo valor b se pasa en una llamada posterior.


Básicamente, se trata de hacer que una función devuelva otra función.

## Ejemplo en Python

En lugar de definir una función que toma dos argumentos:

```python
def suma_normal(a, b):
    return a + b
```

Podemos definir una función que devuelve otra función:

```python
def suma_currificada(a):
    def inner(b):
        return a + b
    return inner
```

### Uso de las funciones

#### Con la función normal

```python
suma_normal(3, 2)  # Devuelve 5
```

#### Con la función currificada

Primero, obtenemos la función interna con el primer argumento:

```python
inner = suma_currificada(3)  # `inner` es la función dentro de suma_currificada, que tiene `a` fijado en 3
```

Luego, llamamos a la función interna con el segundo argumento:

```python
inner(2)  # Devuelve 5
```

También podemos llamar a la función currificada de una sola vez:

```python
suma_currificada(3)(2)  # Devuelve 5
```


