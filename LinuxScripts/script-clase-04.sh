#!/bin/bash

#Prueba del uso de ||

sudo chmod 555 prueba.txt ||
chmod 444 prueba.txt ||
sudo chmod 333 prueba.txt ||
chmod 222 prueba.txt
