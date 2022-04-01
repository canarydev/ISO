#!/bin/bash

#Script que modifica los permisos de todos
#los scripts de la carpeta menos este.

for file in ./*.sh
do
  if [ "$file"  != "$0" ]
  then
    chmod 750 $file
  fi
done
