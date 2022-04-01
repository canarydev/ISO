#!/bin/bash

for file in ./*
do
  case $file in
    $0) sudo chmod 777 $0 && echo "Cambiando permisos de $0" ||
	echo "No se ha podido cambiar los permisos de $0" ;;
    *.txt) sudo chmod 640 $file && echo "Cambiando permisos de $file" ||
	   echo "No se ha podido cambiar los permisos de $file" ;;
    *.sh) sudo chmod 750 $file && echo "Cambiando permisos de $file" ||
	  echo "No se ha podido cambiar los permisos de $file" ;;
  esac
done
