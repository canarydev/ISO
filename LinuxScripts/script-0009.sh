#!/bin/bash

#ARG 1; DIRECTORIO. ARG 2; FICHERO.
#Se debe buscar el fichero de forma recursiva a partir del directorio dado como argumento.
#Si se encuentra se debe mostrar el fichero y su ruta.
#Tambien mostrar, permisos, tamanio en bytes y fecha de la ultima modificacion en formato mm/dd/hora

DIR=$1
FILE=$2


if [ $# -ne 2 ]
then
  echo "En la llamada deben incluirse 2 argumentos, RUTA_COMPLETA y FICHERO_A_BUSCAR."
  exit 1
fi


if [ ! -d $DIR ]
then
  echo "No se ha introducido un directorio."
  exit 2
fi



LISTADO=$(ls $DIR)
for i in $LISTADO
do
  if [ -f "${DIR}/$i" ]
  then
    if [ "$FILE" = "$i" ]
    then
      echo "ENCONTRADO: $FILE"
      echo "Directorio: $DIR"
      echo "Mostrando contenido:"
      cat ${DIR}/$i
      echo "Otros datos: $(ls -l ${DIR}/$i)"
      exit 0
    fi
    continue
  fi
  if [ -d $i ]
  then
    echo "entrando"
    $0 $i $FILE
  fi
done

exit 3
