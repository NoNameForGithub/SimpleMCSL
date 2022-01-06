@echo off
:: Minecraft Server Launcher - The Server Toolkit rewrite
:: Author [nonameforgithub 2019-2021]
echo Starting up...

:: Check for temporary files if they weren't deleted in the last session
echo Checking temp files...
if exist temp.bat del /q temp.bat

:: Variable setting time
echo Setting/checking variables..
set fileshat=http://intelcoreocta.7m.pl/php/mcslfiles.php?dir=%tempdironl1%
set version=1.0.0
set dev=1
set stage=alpha
set devn=1.2.1paper
set datec=06/01/2021
set at=16:59 CEST
set currentmcver=1.18.1
set tempddir=%appdata%/.MinecraftServerLauncher
set devmenu=0
set arguments=

:: Variable checking time
if %dev%==1 title MCSL-TST v%version%-%stage% %devn% [rewrite]
if %dev%==0 title MCSL-TST v%version% [rewrite]
if %devmenu%==0 goto menu
if %devmenu%==1 goto devmenu


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
call powershell Invoke-WebRequest https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/136/downloads/paper-1.18.1-136.jar -o paper.jar
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

::Devmenu (feel free to activate)
echo DEVM3NU/Menu Desarrollador
execute update 1
set /p devmo=select=
if %devmo%==1 goto autoupdate

