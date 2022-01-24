# ¡Ayuda!
Aquí encontrarás alguna información que puede ayudarte con tus scripts.

## Where-Object

Para **comparar** hay que utilizar estos operadores:
- EQ - equal
- NE - not equal
- LT - less than
- LE - less than or equal
- GT  - greater than
- GE - greater than or equal

> **Ejemplo:** Get-ChildItem -File | Where-Object Length -LT 1MB
