rem %users% es una variable de entorno añadida con el valor C:\"Documents and Settings"

@echo off
if [%1]==[] goto insertUser
set user=%1
goto deleteConfirmation

:insertUser
set /P user="Indique el nombre de usuario que desea eliminar: "

:deleteConfirmation
echo Va a eliminar al usuario %user%. ¨Est  seguro?
set /P confirmation="Pulse S para continuar u otra tecla para cancelar: "
if %confirmation%==s goto deleting
if %confirmation%==S goto deleting

echo Borrado cancelado.
goto end

:deleting
echo.
echo Borrando %users%\%user%.
echo.
del /F/Q/S %users%\%user% > nul
rmdir /Q/S %users%\%user%
net user %user% /delete

:end
