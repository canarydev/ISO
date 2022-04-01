#!/bin/bash

#Modo de uso ./nombreScript 2> /dev/null Frase
#Permite introducir una frase que separa en varios arrays como si se tratase de un RAID.
#Además, es capaz de reponerse a la pérdida de alguno de estos arrays gracias a la paridad.
#La paridad siempre estará en el mismo array.


declare -a serv0
declare -a serv1
declare -a serv2
declare -a serv3
declare -a servP

text=$@
length=${#text}
ntexto=""

function toASCII() {
  LC_CTYPE=C printf '%d' "'$1"
  return $LC_CTYPE
}

function toChar() {
  for i in $@
  do
    printf "\\$(printf '%03o' "$i")"
  done
}

function toRaid() {
   for ((i=0; i<=length; i++ )); do
      char=${text:$i:1}
      ascii=$(toASCII $char)
      if [[ $ascii -eq 0 ]]
      then
         ascii=32
      fi
      case $(($i%4)) in
         0) serv0[${#serv0[@]}]+=$ascii
            if [ $i == $length ]
            then
               serv1[${#serv1[@]}]+=0
               serv2[${#serv2[@]}]+=0
               serv3[${#serv3[@]}]+=0
               servP[${#servP[@]}]+=$((serv0[$((${#serv0[@]}-1))] ^ serv1[$((${#serv1[@]}-1))] ^ serv2[$((${#serv2[@]}-1))] ^ serv3[$((${#serv3[@]}-1))]))
            fi ;;
         1) serv1[${#serv1[@]}]+=$ascii
            if [ $i -eq $length ]
            then
               serv2[${#serv2[@]}]+=0
               serv3[${#serv3[@]}]+=0
               servP[${#servP[@]}]+=$((serv0[$((${#serv0[@]}-1))] ^ serv1[$((${#serv1[@]}-1))] ^ serv2[$((${#serv2[@]}-1))] ^ serv3[$((${#serv3[@]}-1))]))
            fi ;;
         2) serv2[${#serv2[@]}]+=$ascii
            if [ $i == $length ]
            then
               serv3[${#serv3[@]}]+=0
               servP[${#servP[@]}]+=$((serv0[$((${#serv0[@]}-1))] ^ serv1[$((${#serv1[@]}-1))] ^ serv2[$((${#serv2[@]}-1))] ^ serv3[$((${#serv3[@]}-1))]))
            fi ;;
         3) serv3[${#serv3[@]}]+=$ascii
            servP[${#servP[@]}]+=$((serv0[$((${#serv0[@]}-1))] ^ serv1[$((${#serv1[@]}-1))] ^ serv2[$((${#serv2[@]}-1))] ^ serv3[$((${#serv3[@]}-1))])) ;;
      esac
  done
}

function toText(){
   for ((i=0; i < ${#servP[@]}; i++ ))
   do
      aux0=${serv0[$i]}
      case $1 in
         0) #Disco0 perdido
            ntexto+=$(toChar $((${serv1[$i]} ^ ${serv2[$i]} ^ ${serv3[$i]} ^ ${servP[$i]})))
            ntexto+=$(toChar ${serv1[$i]}) 
            ntexto+=$(toChar ${serv2[$i]})
            ntexto+=$(toChar ${serv3[$i]});;
         1) #Disco1 perdido
            ntexto+=$(toChar ${serv0[$i]})
            ntexto+=$(toChar $((${serv0[$i]} ^ ${serv2[$i]} ^ ${serv3[$i]} ^ ${servP[$i]})))
            ntexto+=$(toChar ${serv2[$i]})
            ntexto+=$(toChar ${serv3[$i]});;
         2) #Disco2 perdido
            ntexto+=$(toChar ${serv0[$i]})
            ntexto+=$(toChar ${serv1[$i]})
            ntexto+=$(toChar $((${serv0[$i]} ^ ${serv1[$i]} ^ ${serv3[$i]} ^ ${servP[$i]})))
            ntexto+=$(toChar ${serv3[$i]});;
         3) #Disco3 perdido
            ntexto+=$(toChar ${serv0[$i]})
            ntexto+=$(toChar ${serv1[$i]})
            ntexto+=$(toChar ${serv2[$i]})
            ntexto+=$(toChar $((${serv0[$i]} ^ ${serv1[$i]} ^ ${serv2[$i]} ^ ${servP[$i]})));;
         4) #Todos los discos bien
            ntexto+=$(toChar ${serv0[$i]}) 
            ntexto+=$(toChar ${serv1[$i]}) 
            ntexto+=$(toChar ${serv2[$i]})
            ntexto+=$(toChar ${serv3[$i]});;
      esac
   done
}


#Pasamos el parámetro a 'RAID'
echo "Frase original: $@"
toRaid
echo
echo "Contenido disco 0:"
echo ${serv0[@]}
echo $(toChar ${serv0[@]})
echo "Contenido disco 1:"
echo ${serv1[@]}
echo $(toChar ${serv1[@]})
echo "Contenido disco 2:"
echo ${serv2[@]}
echo $(toChar ${serv2[@]})
echo "Contenido disco 3:"
echo ${serv3[@]}
echo $(toChar ${serv3[@]})
echo "contenido disco de paridad:"
echo ${servP[@]}
echo
ntexto=""
toText 0
echo "Recuperado sin disco 0: $ntexto"
ntexto=""
toText 1
echo "Recuperado sin disco 1: $ntexto"
ntexto=""
toText 2
echo "Recuperado sin disco 2: $ntexto"
ntexto=""
toText 3
echo "Recuperado sin disco 3: $ntexto"
ntexto=""
toText 4
echo "Recuperado sin fallos de disco: $ntexto"
echo
