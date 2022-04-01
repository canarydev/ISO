#!/bin/bash

#Script que admita un parametro correspondiente a un fichero del directorio actual.
#Si existe debe contar el numero de lineas del mismo y mostrar un mensaje indicando el numero.
#Si no existe debe mostrar un mensaje de error y salir.

if [ $# -ne 1 ]
then
  echo "Sintaxis $0 fichero"
  echo "El numero de parametros debe ser 1"
  exit 1
fi

if [ ! -f $1 ]
then
  echo "El archivo $1 no existe"
  exit 2
fi

LINEAS=$(wc -l $1)
echo "El numero de lineas es: $LINEAS"
exit 0
