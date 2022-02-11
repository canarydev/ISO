# ¡Ayuda!
Aquí encontrarás alguna información que puede ayudarte con tus scripts.

##FOR
Es un bloque que permite realizar acciones repetitivas. Para ejecutar un FOR necesitamos un **iterador**. El iterador es una variable que sólo existirá dentro del FOR y que irá tomando los valores de la lista que le pasemos al FOR:
> Imaginemos que hemos ejecutado un script llamado `printer.bat` que lo que hará es imprimir todos los parámetros que hallamos pasado. Imaginemos que hemos escrito en CMD `printer 1 a 2 manzanas`. Si el contenido de printer.bat es ```
@echo off
FOR %%i IN (%*) DO (
   echo %%i
)
```
  


## IF
Para **comparar números** hay que utilizar estos operadores:
- EQU - equal
- NEQ - not equal
- LSS - less than
- LEQ - less than or equal
- GTR - greater than
- GEQ - greater than or equal

> **Ejemplo:** if %1 gtr 5 echo Soy mayor que 5

## Parámetros
Los parámetros de una función pueden ser observados con **%1, %2, ..., %9**.
> **Nota:** Puedes obtener la lista de parámetros utilizando %*
