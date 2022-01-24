# ¡Ayuda!
Aquí encontrarás alguna información que puede ayudarte con tus scripts.

## Where-Object

Para **comparar números** hay que utilizar estos operadores:
- EQ - equal
- NE - not equal
- LT - less than
- LE - less than or equal
- GT  - greater than
- GE - greater than or equal

> **Ejemplo:** Get-ChildItem -File | Where-Object Length -LT 1MB

Para **comparar cadenas de caracteres** hay que utilizar estos operadores:
- Like - Igual
- NotLike - No igual
