#!/bin/bash

#Cree una funcion que cuente el numero de archivos presentes en el directorio pasado como argumento..
#Llame a la funcion file_count y llamela en su script.
#La funcion debe aceptar un directorio como argumento.
#El directorio a consultar debe mostrarse, seguido de : y en la linea siguiente, el numero de archivos presentes en el.

NARGS=$#
DIR=$1

function file_count () {
  if [ $NARGS -eq 1 ]
  then
    local NFILES=$(ls $DIR | wc -l)
    echo "${DIR}:"
    echo "$NFILES"
  else
    echo "The number of arguments != 1"
  fi
}

file_count
