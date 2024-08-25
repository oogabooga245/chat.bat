del update.bat
title RGH-Wins ChatRoom
cls
@echo off
chcp 65001 >nul
color 3
cls

:success
curl -o update.txt https://raw.githubusercontent.com/oogabooga245/chat.bat/main/update.txt
curl -o name.txt https://raw.githubusercontent.com/oogabooga245/chat.bat/main/name.txt
cls
echo.
type name.txt
echo    Made by RGH-Wins                       v1.0.1 
timeout 3 >nul
del name.txt
type update.txt
del update.txt
echo.
echo             ----------------------------------------
echo             ^|                                      ^|
echo             ^|        1 - chat room 1               ^|
echo             ^|        2 - chat room 2               ^|
echo             ^|        3 - setup                     ^|
echo             ^|        4 - update                    ^|
echo             ^|                                      ^|
echo             ----------------------------------------
echo.

set /p a=Select an option [%user%]: 
if "%a%"=="1" goto one
if "%a%"=="2" goto two
if "%a%"=="3" goto setup
if "%a%"=="4" goto update

echo [!] Invalid Choice. Please try again... [!]
pause
goto success

:one
curl -o chat2.py https://raw.githubusercontent.com/oogabooga245/chat.bat/main/chat2.py
python3 chat2.py
timeout 2 >nul
del chat2.py
del chat.log
goto success

:two
cls
curl -o chat.py https://raw.githubusercontent.com/oogabooga245/chat.py/main/chat.py
python3 chat.py
timeout 2 >nul
del chat.py
del chat.log
goto success

:setup
cls
echo do you have python installed? yes/no
echo.
set /p a=Select an option: 
if "%a%"=="no" goto python
if "%a%"=="yes" goto urwid


:python
cd %USERPROFILE%\Desktop

:: Python 3.10
:: set https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe

:: Python 3.11
:: set PYTHON_URL=https://www.python.org/ftp/python/3.11.4/python-3.11.4-amd64.exe

:: Python 3.12 
set PYTHON_URL=https://www.python.org/ftp/python/3.12.0/python-3.12.0b4-amd64.exe

powershell -Command "& { iwr '%PYTHON_URL%' -OutFile %USERPROFILE%\Desktop\python-installer.exe }"

python-installer.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

if ERRORLEVEL 1 (
    echo Python installation failed!
    exit /b %ERRORLEVEL%
) else (
    echo Python installation succeeded!
)
goto urwid

:urid
pip install urwid
pip3 install urwid
goto success

:update
curl -o update.bat https://raw.githubusercontent.com/oogabooga245/chat.bat/main/update.bat
start update.bat
exit
