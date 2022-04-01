#!/bin/bash

#Pasar como parametros un numero indeterminado de ficheros y como ultimo parametro un directorio con su ruta completa.
#Determinar cuales de los ficheros se encuentran en el directorio y contarlos.

COUNT=0

for i in $@
do
  DIR=$i
done

if [ ! -d $DIR ]
then
  echo "$DIR no se trata de un directorio"
  exit 1
else
  for i in $@
  do
    if [ -f ${DIR}/$i ]
    then
      COUNT=$(($COUNT + 1))
    fi
  done
fi
echo $COUNT
exit 0
