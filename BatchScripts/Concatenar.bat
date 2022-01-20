@echo off
setlocal enabledelayedexpansion
set lista=
set total=0

for %%i in (*) do (
	set lista=!lista! "%~dp0%%i"
	set /a total=total+1
)

echo Total=%total%
echo LISTA=%lista%
pause
