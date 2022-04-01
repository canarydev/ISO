#!/bin/bash

#Prueba ping

HOST=$1
ping -c 1 $HOST > /dev/null && echo "$HOST encontrado"
