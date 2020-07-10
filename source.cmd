@echo off
:: Minecraft Server Launcher - The Server Toolkit rewrite
:: Author [nonameforgithub 2019-2020]
echo Starting up...

:: Check for temporary files if they weren't deleted in the last session
echo Checking temp files...
if exist temp.bat del /q temp.bat

:: Variable setting time
echo Setting/checking variables..
set fileshat=http://intelcoreocta.7m.pl/php/mcslfiles.php?dir=%tempdironl1%
set version=1.0.0
set dev=1
set stage=prealpha
set devn=1.2paper
set datec=10/07/2020
set at=12:12 CEST
set currentmcver=1.16.1
set tempddir=%appdata%/.MinecraftServerLauncher
set devmenu=0
set arguments=

:: Variable checking time
if %dev%==1 title MCSL-TST v%version%-%stage% %devn% [rewrite]
if %dev%==0 title MCSL-TST v%version% [rewrite]
if %devmenu%==0 goto menu
if %devmenu%==1 goto devmenu

::Isolated, untested code

:autoupdate
echo Checking for updates...
if exist "%tempddir%\version.txt" del "%tempddir%\version.txt" /q
set tempdironl1=version-%stage%.txt
call powershell Invoke-WebRequest %fileshat% -o %tempddir%/version.txt
if exist "%tempddir%\version.txt" set /p updateversion=<"%tempddir%\version.txt"
if %updateversion%==%version% goto utd
set tempdironl1=../source.txt
call powershell %fileshat% -o %tempddir%/tmpupd/1.bat
if not exist %tempddir%/updst1.cmd goto stage2-creation
if exist %tempddir%/updst1.cmd goto stage2ac

::End 
cls
goto menu
:menu 
cls
echo The server toolkit (Compiled on %datec% at %at%)
echo According to the inside of the file, the current version of Minecraft is %currentmcver%, if that's not correct change it
echo [L]atest
echo [S]elect Minecraft version
echo [I]nstall or Update to the latest version
SET /P s=Select-[
IF %s%==L GOTO SMCSN
IF %s%==I GOTO inst
IF %s%==l GOTO SMCSN
IF %s%==i GOTO inst
if %s%==S goto msgn1
if %s%==s goto msgn1
:inst
cls
call powershell Invoke-WebRequest https://papermc.io/api/v1/paper/%currentmcver%/latest/download -o paper.jar
java -jar paper.jar %arguments%
cls
goto menu

::Server console itself
:SMCSN
cls
title Server console
java -jar paper.jar %arguments%
goto menu

:: Placeholder message, nothing special
:msgn1
cls
echo Coming soon!
pause
goto menu

::If the stage 2 cmd file doesn't exist, create it
:stage2-creation
echo @echo off > %tempddir%/updst1.cmd
echo set mcdir= >> %tempddir%/updst1.cmd
echo ren update.bat main.cmd >> %tempddir%/updst1.cmd
echo mklink MCSL C:\test.lnk
echo start main.cmd >> %tempddir%/updst1.cmd
goto autoupdate

:stage2ac
start %tempddir%/updst1.cmd
exit

::Devmenu (feel free to activate)
echo DEVM3NU/Menu Desarrollador
execute update 1
set /p devmo=select=
if %devmo%==1 goto autoupdate

:uto
echo Up to date!
goto menu
