@echo off

rem Este programa permite crear un archivo con los usuarios que queremos crear.

set file=%userprofile%\Scripts\users.csv
if not exist "%file%" type nul > "%file%"
for %%i in ("%file%") do (
	if %%~zi==0 echo alias*full_name*password*expires*passwordChg*times*groups > "%file%"
)

:addUser
set /p alias="Introduzca alias: "
if [%alias%]==[] goto addUser
set /p name="Introduzca nombre completo: "
if "%name%"=="" set name= 
rem En la línea anterior se ha puesto un espacio tras el igual, para que en el archivo escriba un espacio en caso de no indicar un nombre.
set /p password="Introduzca password (Random por defecto): "
if [%password%]==[] set password=Random
set /p expires="Introduzca fecha de expiración de la cuenta (Never por defecto): "
if [%expires%]==[] set expires=Never
set /p passwordChg="¿El usuario puede cambiar su contraseña? (Yes por defecto) :"
if [%passwordChg%]==[] set passwordChg=Yes
set /p times="Introduzca restricciones horarias (All por defecto): "
if [%times%]==[] set times=All
set /p groups="Introduzca los grupos a los que pertenecerá el usuario separados por comas: "

echo %alias%*%name%*%password%*%expires%*%passwordChg%*%times%*%groups% >> "%file%"

:clrVariables
set alias=
set name=
set password=
set passwordChg=
set expires=
set times=
set groups=
set newUser=


set /p newUser="Si desea añadir otro usuario pulse S: "
if %newUser%==S goto addUser
if %newUser%==s goto addUser
