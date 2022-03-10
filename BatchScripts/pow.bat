@echo off
set n=%1
if [%1]==[] set /p n="Escribe el numero: "	
set p=%2
if [%2]==[] set /p p="Escribe la potencia: "

set total=1
for /L %%i in (1,1,%p%) do (
	set /a total=total*%n%
)
echo %total%
