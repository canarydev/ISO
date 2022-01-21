@echo off
rem Archivo por lotes que permite realizar una sumatoria pasandole los numeros como argumentos.
set total=0
for %%i in (%*) do (
	set /a total=total+%%i
)
echo El total es: %total%
