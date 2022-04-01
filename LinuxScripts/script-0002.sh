#!/bin/bash

#Escriba un script de shell que acepte un nombre de archivo o directorio como argumento.
#Haga que el script informe si es un archivo normal, un directorio u otro tipo de archivo.
#Si es un archivo normal, salga con un estado de salida 0.
#Si es un directorio, salga con un estado de salida 1.
#Si se trata de algun otro tipo de archivo, salga con un estado de salida 2.


FILE=$1

if [ -f $FILE ]
then
  echo "$FILE es un archivo regular."
  exit 0
elif [ -d $FILE ]
then
  echo "$FILE es un directorio."
  exit 1
else
  echo "$FILE es otro tipo de archivo regular o directorio."
  exit 2
fi

