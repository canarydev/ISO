# ¡Ayuda!
Aquí encontrarás alguna información que puede ayudarte con tus scripts.

## Archivos
Para **comprobar si existe un archivo** y si no, **crearlo**:
```
if not exist "prueba.txt" type nul > "prueba.txt"
```
Para **recorrer un archivo**
```
for /f %%i in ("file.txt") do (
)
```
Para **comprobar si un archivo está vacío**:
```
for /f %%i in ("file.txt") do set size=%%~zi
if %size% gtr 0 echo Not empty
```

Para recorrer un archivo **tipo csv**:
```
for /f "usebackq skip=1 tokens=1-7 delims=|" %%a in ("file.csv") do (
)
```
> En este ejemplo, al poner 'for /f' estamos indicando que vamos a recorrer un archivo. 'skip=1' nos permite saltar una línea, por lo que no leeremos la primera línea. Con 'delimns=|' decimos que el delimitador es **|** y con 'tokens=1-7' que son en total 7 tokens y van desde **%%a** hasta **%%g**


## FOR
```
FOR %%i IN (%*) DO (
   echo %%i
)
```
Es un bloque que permite realizar acciones repetitivas. Para ejecutar un FOR necesitamos un **iterador**. El iterador es una variable que sólo existirá dentro del FOR y que irá tomando los valores de la lista que le pasemos al FOR:
> Imaginemos que hemos ejecutado un script llamado **printer.bat** que lo que hará es imprimir todos los parámetros que hallamos pasado. Imaginemos que hemos escrito en CMD `printer 1 a 2 manzanas`. Si el contenido de printer.bat es el código que tenemos arriba, la consola de comandos nos devolverá 1, a, 2 y manzanas, cada una de ellas en una línea diferente.

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
