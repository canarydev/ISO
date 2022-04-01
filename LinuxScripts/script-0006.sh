#!/bin/bash

#Cree una funcion que cuente el numero de archivos presentes en el directorio actual.
#Llame a la funcion file_count y llamela en su script.
#Si usa alguna variable dentro de la funcion conviertala en local.

function file_count () {
  ls -1 | wc -l
}

file_count
