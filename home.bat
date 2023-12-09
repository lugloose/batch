@echo off
:homepage
title homepage
color a
echo date -- [ %date% ]
echo hello -- [ %username% ] 
echo --------------------------
echo Press 1 for tree
echo Press 1.5 for tree looped
echo Press 2 for ssid
echo Press 3 for calc
echo Press 4 for ps
echo Press 5 for matrix
echo Press 6 for text-to-speach
echo Press 7 for users
echo Press 8 for cmd
echo --------------------------

set /p input=Number: 
if %input% == 1 goto treeV1
if %input% == 1.5 goto treeV2
if %input% == 2 goto ssid
if %input% == 3 goto calc
if %input% == 4 goto ps
if %input% == 5 goto matrix
if %input% == 6 goto text-to-speach
if %input% == 7 goto users
if %input% == 8 goto cmd
if %input% == else goto explain

:explain
cls 
echo invalid input
pause
cls
goto homepage

rem ---------
rem tree normal
rem lists all files & folders on C: drve
rem ---------

:treeV1
cls
title treeV1
color a
cd C:\ 
tree /f /a
pause
cls
goto homepage

rem ---------
rem tree looped
rem lists all files & folders on C: drive looped
rem ---------

:treeV2
cls
:tree-start
title treeV2
color a
cd C:\
tree /f /a
cls
goto tree-start

rem ---------
rem ssid
rem lists all wifi network ssid's you've been connected to
rem ---------

:ssid
cls	
title ssid
color a
netsh wlan show profile key=clear > WIFI.xml 
echo refresh desktop 
pause
cls
goto homepage

rem ---------
rem calculator
rem fully functioning calculator
rem ---------

:calc
cls
:calculator-start
title calculator
color a
Echo Press 1 for Addition
echo Press 2 for Subtraction
echo Press 3 for Multiplication
echo Press 4 for Division
echo Press 5 to Quit

set /p type=
if %type% == 1 goto a
if %type% == 2 goto b
if %type% == 3 goto c
if %type% == 4 goto d
if %type% == 5 goto e
if %type% == else goto x

:a
cls
echo Addition
echo Please choose the 2 numbers you wish to add
set /p num1=
set /p num2=
echo %num1%+%num2%?
cls
pause
set /a Answer=%num1%+%num2%
echo %Answer%
pause
cls
goto calculator-start

:b
cls
echo Subtraction
echo Please choose the 2 numbers you wish to subtract
set /p num1=
set /p num2=
echo %num1%-%num2%?
cls
pause
set /a Answer=%num1%-%num2%
echo %Answer%
pause
cls
goto calculator-start

:c
cls
echo Multiplication
echo Please choose the 2 numbers you wish to multiply
set /p num1=
set /p num2=
echo %num1%*%num2%?
cls
pause
set /a Answer=%num1%*%num2%
echo %Answer%
pause
cls
goto calculator-start

:d
cls
echo Division
echo Please choose the 2 numbers you wish to divide
set /p num1=
set /p num2=
echo %num1%/%num2%?
cls
pause
set /a Answer=%num1%/%num2%
echo %Answer%
pause
cls
goto calculator-start

:e
cls
pause
cls
goto homepage

:x
cls
echo invalid number
pause
cls
goto calculator-start

rem ---------
rem PowerShell
rem opens PowerShell with normal privilages
rem ---------

:ps
cd C:\Windows\System32\
Powershell.exe -Command "& {Start-Process Powershell.exe -Verb RunAs}"
cls
goto homepage

rem ---------
rem matrix
rem randomly generated numbers looped
rem ---------

:matrix
cls
title wall of code
color a
:matrix-start
echo %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random% %random%
goto matrix-start

rem ---------
rem bat text to speach
rem the bat file makes a vbs script which speaks, then deletes
rem ---------

:text-to-speach
cls
color a
title text to speach
set /p input= to be spoken: 
call:speak "%input%"
:start-of-speaking
set /p "spk=Speak: "
call:speak "%spk%"
goto start-of-speaking
:Speak
(
echo/Dim Speak, Voice
echo/Set Speak = WScript.CreateObject^("SAPI.spVoice"^)
echo/Speak.Speak "%~1"
) > Speak.vbs
echo/%~1
cscript //nologo Speak.vbs&del Speak.vbs
pause
cls
goto homepage

rem ---------
rem users
rem lists users on current system
rem ---------

:users
cls
color a
title check connected users
net users
pause
cls
goto homepage

rem ---------
rem just regular command prompt
rem opens command prompt
rem ---------

:cmd
cls
color a
title cmd
cd C:\
cmd.exe
