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
Para **recorrer todos los archivos del directorio actual**
```
for %%i in (*) do (
)
```
Para **comprobar si un archivo está vacío**:
```
for /f %%i in ("file.txt") do set size=%%~zi
if %size% gtr 0 echo Not empty
```
Para recorrer un archivo **tipo csv**:
```
for /f "usebackq skip=1 tokens=1-7 delims=," %%a in ("file.csv") do (
)
```
> En este ejemplo, al poner `for /f` estamos indicando que vamos a recorrer un archivo. `skip=1` nos permite saltar una línea, por lo que no leeremos la primera línea. Con `delimns=,` decimos que el delimitador es `,` y con `tokens=1-7` que son en total 7 tokens y van desde `%%a` hasta `%%g`.

Para **buscar coincidencias dentro de un archivo**:
```
findstr /i /c:"PalabraABuscar" archivos
```
> /i nos permite buscar sin importar las mayúsculas minúsculas. /c permite buscar esa palabra en el/los archivos que se indiquen.
## Usuarios
Para **crear un usuario** la forma más básica es escribiendo:
```
net user alias /add
```

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

Para **comparar strings**:
- `if [%variable%]==[]` - Comprueba si `%variable%` está vacía. **No permite varias palabras o espacios en blanco.**
- `if "%variable%"==""` - Comprueba si `%variable%` está vacía. Esto es **sólo** indicado **si vas a permitir** que la String **tenga varias palabras o espacios en blanco**.
- `if %variable%==Hola` - Comprueba si `%variable%` tiene el valor `Hola`.


## Parámetros
Los parámetros de una función pueden ser observados con **%1, %2, ..., %9**.
> **Nota:** Puedes obtener la lista de parámetros utilizando %*


## &&
En ocasiones queremos que cuando se haya realizado una acción de forma satisfactoria, se ejecute algo de código. Eso lo podemos lograr con **&&**:
> **Ejemplo:** `findstr /i /c:hola hola.txt > Nul && echo He encontrado lo que buscabas!`


## Añadir un nuevo comando a CMD
Para añadir un nuevo comando (a partir de otros existentes) hay múltiples formas de hacerlo, pero vamos a ver dos de ellas.
- Crear un nuevo `.bat` en system32 (o cualquier carpeta incluída dentro del PATH).
- Crear un nuevo `.bat` en cualquier lugar y añadir esa carpeta (o el archivo) al PATH.


> Veamos un ejemplo sencillo; programar un apagado.
> La orden para programar un apagado del equipo es `shutdown -s -t TIEMPO` donde el tiempo se escribe en segundos.
>
> Por ejemplo, `shutdown -s -t 1800` apagará el ordenador dentro de media hora.
>
> Si deseo crear un comando llamado `apagar` al que yo pueda pasarle un determinado número de segundos y, una vez transcurrido ese tiempo apague el ordenador, bastará con crear el archivo `apagar.bat` dentro de system32 e introducir el script que me permitiese apagar el equipo al yo hacer la llamada `apagar 1800` en CMD.


