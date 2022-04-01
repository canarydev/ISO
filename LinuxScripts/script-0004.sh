#!/bin/bash

#Script que ofreca en la salida estandar el siguiente menu:

#1] Listar archivos
#2] Ver directorio de trabajo
#3] Crear directorio
#4] Borrar directorio
#5] Crear usuario
#6] Borrar usuario
#7] Salir

MENU=0

while [ $MENU -ne 7 ]
do

  echo "Elija una de las siguientes opciones:"
  echo "1] Listar archivos"
  echo "2] Ver directorio de trabajo"
  echo "3] Crear directorio"
  echo "4] Borrar directorio"
  echo "5] Crear usuario"
  echo "6] Borrar usuario"
  echo "7] Salir"
  read MENU
  echo ""

  case $MENU in
    1)
      ls;;
    2)
      pwd;;
    3)
      read -p "Escriba el nombre del directorio: " DIRECTORIO
      mkdir ./$DIRECTORIO;;
    4)
      read -p "Escriba el nombre del directorio: " DIRECTORIO
      rm -r ./$DIRECTORIO;;
    5)
      if [ $EUID -eq 0 ]  #Si el usuario es root
      then
         read -p "Nombre usuario: " NOMBRE
         useradd -m -s /bin/bash $NOMBRE
      else
         echo "No tienes permisos de administrador"
      fi;;
    6)
      if [ $EUID -eq 0 ]  #Si el usuario es root
      then
        read -p "Nombre usuario: " NOMBRE
        userdel -r $NOMBRE
      fi;;
    7)
      echo "Fin de ejecucion"
      exit 0;;
  esac
  MENU=0
done
