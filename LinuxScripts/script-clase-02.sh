#!/bin/bash

menu=0
while [ true ]
do
  echo "Selecciona una opción del menú:"
  echo "1) Opción 1"
  echo "2) Opción 2"
  echo "3) Opción 3"
  echo "4) Salir"
  echo
  read menu

  case $menu in
    1) echo "Has seleccionado la opción 1" && echo ;;
    2) echo "Has seleccionado la opción 2" && echo ;;
    3) echo "Has seleccionado la opción 3" && echo ;;
    4) echo "Saliendo del programa. Buena suerte!" && echo
      exit 0 ;;
    *.txt) echo "Esto es un txt" && echo ;;
    *) echo "Escriba una opción válida" && echo ;;

  esac
done
