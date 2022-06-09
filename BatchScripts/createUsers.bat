@echo off

set file=%userprofile%\Scripts\users.csv

for /f "usebackq skip=1 tokens=1-7 delims=*" %%a in ("%file%") do (
	:addNewUser
	if %%c==Random net user %%a /random /add >> tmp.txt
	if not %%c==Random net user %%a %%c /add > nul
	if not "%%b"==" " net user %%a /fullname:"%%b" > nul
	if not [%%d]==[] net user %%a /expires:%%d > nul
	if not [%%e]==[] net user %%a /passwordChg:%%e > nul
	if not [%%f]==[] net user %%a /times:%%f > nul
	if not [%%g]==[] for %%h in (%%g) do (
		net localgroup %%h /add > nul
		net localgroup %%h %%a /add > nul
	)
)

type tmp.txt | findstr /v "Se ha completado" | findstr /v "^$" > passwords.txt
del tmp.txt
