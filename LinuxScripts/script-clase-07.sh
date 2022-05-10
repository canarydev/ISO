#!/bin/bash

#Cuenta el número de ocurrencias de cada línea del archivo de entrada y las muestra ordenadas.
#Si se introduce un archivo de salida se escribirá en el mismo, sin mostrar nada por la pantalla.

input=$1
output=$2

if [[ -f "$input" ]]
then
    sorted=$(sort $input | uniq -c)
    if [[ "$output" != "" ]]
    then
        echo $sorted > $output
    else
        echo $sorted
    fi
    exit 0
else
    echo "No has puesto ningún archivo existente."
    exit 1
fi
