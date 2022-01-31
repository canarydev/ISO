# ¡Ayuda!
Aquí encontrarás alguna información que puede ayudarte con tus scripts.

## Argumentos
Cuando lanzamos un script podemos hacerlo pasándole **argumentos**.
> **Ejemplo:** sum.ps1 1 2 3 4

En este ejemplo, 1, 2, 3 y 4 son argumentos que le pasamos al script.

Para acceder a la lista de argumentos en el script basta con poner **$args**. Esta variable contrendrá la lista de todos los argumentos pasados al script.

**Si queremos acceder**, por ejemplo, **al primer argumento** dentro del script hay que hacer algo un poco más laborioso...
> **Ejemplo:** echo "El primer argumento es: $($args[0])"

El **$()** evaluará lo que esté en el interior y **$args[0]** es el primer elemento de la lista de argumentos. Si no pusésemos $(), se nos imprimiría toda la lista de argumentos y, al finalizar ésta, [0].

> **Ejemplo de salida con $args[0]:** Pedro Andrés Juan[0]"
> **Ejemplo de salida con $($args[0]):** Pedro"

## Where-Object

Para **comparar números** hay que utilizar estos **operadores** de comparación:
- EQ - equal
- NE - not equal
- LT - less than
- LE - less than or equal
- GT  - greater than
- GE - greater than or equal

> **Ejemplo:** Get-ChildItem -File | Where-Object Length -LT 1MB

Para **comparar cadenas de caracteres** hay que utilizar estos otros operadores:
- Like - Igual
- NotLike - No igual
 
> **Ejemplo:** Get-ChildItem -File | Where-Object Name -NotLike p*
