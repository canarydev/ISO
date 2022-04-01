#!/bin/bash

#Crear un script que construya un menu con 4 opciones. El menu opera sobre un fichero llamado datos.
#Cada linea del fichero contiene 2 cadenas: Nombre y numero de telefono. El fichero esta ordenado alfabeticamente.
#Las opciones del menu son:
#1) Busqueda de un telefono dado el nombre.
#2) Alta, dado el nombre
#3) Baja, dado el nombre
#4) Listado por pantalla del fichero completo.


#COMPROBAR EXISTENCIA DEL ARCHIVO Y DIRECTORIO, SI NO, CREARLOS
FICHERO=$1
DIRECTORIO="/home/myScripts/archivos"


if [ ! -f $FICHERO ]
then
   if [ ! -d $DIRECTORIO ]
   then
      mkdir $DIRECTORIO
   fi
   touch ${DIRECTORIO}/${FICHERO}
fi


#MENU

while true
do
  clear
  echo "AGENDA TELEFONICA"
  echo "1) Busqueda de un telefono, dado el nombre"
  echo "2) Alta, dado el nombre"
  echo "3) Baja, dado el nombre"
  echo "4) Listado por pantalla del fichero completo"
  echo "5) Salir"
  echo
  read -p "Elija una de las opciones: " MENU

  case $MENU in
    1)
      echo "Busqueda de telefono. "
      read -p "Introduzca el nombre del usuario: " NOMBRE
      if [ -z $NOMBRE ]
      then
        echo "Nombre vacio."
      else
        grep -i $NOMBRE ${DIRECTORIO}/${FICHERO}
        if [ $? -ne 0 ]
        then
          echo "El usuario ${NOMBRE} no existe"
        fi
      fi
      read -p "Pulse ENTER para continuar. ";;
    2)
      echo "Alta telefono."
      read -p "Introduzca el nombre del usuario: " NOMBRE
      if [ -z $NOMBRE ]
      then
        echo "Nombre vacio."
      else
        grep -i $NOMBRE ${DIRECTORIO}/${FICHERO}
        if [ $? -eq 0 ]
        then
          echo "El usuario ya existe."
        else
          read -p "Introduzca el telefono: " TELEFONO
          if [ -z $TELEFONO ]
          then
            echo "Telefono vacio."
          else
            echo "$NOMBRE $TELEFONO" >> ${DIRECTORIO}/$FICHERO
            sort -d ${DIRECTORIO}/$FICHERO > temp
            mv temp ${DIRECTORIO}/$FICHERO
          fi
        fi
      fi
      read -p "Pulse ENTER para continuar. ";;
    3)
      clear
      echo "Baja telefono."
      read -p "Introduzca el nombre del usuario: " NOMBRE
      if [ -z $NOMBRE ]
      then
        echo "Nombre vacio."
      else
        grep -v ${NOMBRE} ${DIRECTORIO}/$FICHERO > temp
        mv temp ${DIRECTORIO}/$FICHERO
      fi
      read -p "Pulse ENTER para continuar. ";;
    4)
      clear
      echo "Listin telefonico."
      echo
      cat ${DIRECTORIO}/$FICHERO
      echo
      read -p "Pulse ENTER para continuar. ";;
    5)
      clear
      exit 0;;
  esac
done
