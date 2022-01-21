rem Archivo por lotes que permite realizar una sumatoria pasándole los números como argumentos.
@echo off
set total=0
for %%i in (%*) do (
	set /a total=total+%%i
)
echo El total es: %total%
