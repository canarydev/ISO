#!/bin/bash

#Cálculo distancia euclídea, Manhattan y Chebyshev

read -p "Valor X1: " X1
read -p "Valor Y1: " Y1
read -p "Valor X2: " X2
read -p "Valor Y2: " Y2

euc=$(echo "scale=4;sqrt( (($X1-($X2))^2) + (($Y1-($Y2))^2) )" | bc)
man=$(echo "sqrt(($X1-($X2))^2) + sqrt(($Y1-($Y2))^2)" | bc)
chebX=$(echo "sqrt(($X1-($X2))^2)" | bc)
chebY=$(echo "sqrt(($Y1-($Y2))^2)" | bc)
cheb=$((chebX >= chebY ? chebX : chebY ))
echo "La distancia euclídea es: $euc"
echo "La distancia Manhattan es: $man"
echo "La distancia Chebyshev es: $cheb"
