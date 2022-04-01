#!/bin/bash

#Escribe un script que ejecute el comando   cat /etc/shadow.
#Si el comando devuelve 0, devuelva   El comando se realizo correctamente   con estado de salida 0.
#Si el comando devuelve un estado de salida distinto de 0, informe   El comando ha fallado   y salga con estado de salida 1.

cat /etc/shadow
if [ $? -eq 0 ]
then
  echo "El comando se realizo correctamente"
  exit 0
else
  echo "El comando ha fallado"
  exit 1
fi

