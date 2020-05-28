@echo off
:: Minecraft Server Launcher - The Server Toolkit rewrite
:: Author [nonameforgithub 2019]
echo Starting up...

setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set winver=%%i.%%j
endlocal
:continue
:: Check for temporary files if they weren't deleted in the last session
echo Checking temp files...
if exist temp.bat del /q temp.bat

:: Variable setting time
echo Setting/checking variables..
set fileshat=http://intelcoreocta.7m.pl/php/mcslfiles.php?dir=%tempdironl1%
set version=1.0.0
set dev=1
set stage=beta
set devn=1
set datec=27/10/2019
set at=9:34 AM CEST
set currentmcver=[Search for the value currentmcver in settings!]
set tempddir=%appdata%/.MinecraftServerLauncher
set devmenu=0
set canunzip7810=0
set switch=paper
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

:windows-check
if %winver%==6.3 goto zipd
if %winver%==6.3 goto zipd
if %winver%==6.2 goto zipd
if %winver%==6.1 goto zipd
if %winver%==6.0 goto legdown
if %winver%==5.1 goto legdown
if %winver%==5.0

::end 
cls
goto menu
:menu 
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
set cud=.
call powershell Invoke-WebRequest https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar -o %tempddir%/BuildTools.jar
set bd="C:\Program Files (x86)\Git\bin\bash.exe"
set bd64="C:\Program Files\Git\bin\bash.exe"
%bd% --login -i -c "java -jar ""%tempddir%\BuildTools.jar"" --rev %currentmcver%
%bd64% --login -i -c "java -jar ""%tempddir%\BuildTools.jar"" --rev %currentmcver%
cd %cud%
del BuildTools.jar
if exist Spigot-%currentmcver%.jar goto menu else call powershell Invoke-WebRequest https://cdn.getbukkit.org/spigot/spigot-%currentmcver%.jar
cls
goto menu

::Server console itself
:SMCSN
cls
title Server console
java -jar Spigot_%currentmcver%.jar
cls
java -jar Spigot-%currentmcver%.jar
cls
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

echo The server toolkit (Compiled on %date% at %at%)
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
set cud=.
call powershell -command (new-object System.Net.WebClient).DownloadFile('"https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"', '"%temp%/BuildTools.jar"') 
set bd="C:\Program Files (x86)\Git\bin\bash.exe"
set bd64="C:\Program Files\Git\bin\bash.exe"
%bd% --login -i -c "java -jar ""%temp%\BuildTools.jar"" --rev %currentmcver%
%bd64% --login -i -c "java -jar ""%temp%\BuildTools.jar"" --rev %currentmcver%
cd %cud%
java -jar Spigot-%currentmcver%.jar
if exist Spigot-%currentmcver%.jar (goto menu) else (wget https://cdn.getbukkit.org/spigot/spigot-%currentmcver%.jar)
java -jar Spigot-%currentmcver%.jar
del BuildTools.jar
cls
goto menu

::Server console itself
:SMCSN
cls
title Server console
java -jar Spigot_%currentmcver%.jar
cls
java -jar Spigot-%currentmcver%.jar
cls
goto menu

:: Placeholder message, nothing special
:msgn1
cls
echo Coming soon!
pause
goto menu

::If the stage 2 cmd file doesn't exist, create it
:stage2-creation
echo @echo off > %temp%/updst1.cmd
echo set mcdir= >> %temp%/updst1.cmd
echo ren update.bat main.cmd >> %temp%/updst1.cmd
echo mklink MCSL C:\test.lnk
echo start main.cmd >> %temp%/updst1.cmd
goto autoupdate

:stage2ac
start %temp%/updst1.cmd
exit

::Devmenu (feel free to activate)
echo DEVM3NU/Menu Desarrollador
execute update 1
set /p devmo=select=
if %devmo%==1 goto autoupdate

:uto
echo Up to date!
goto menu
