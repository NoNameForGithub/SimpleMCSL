@echo off
title LaunchSrv [OSS/DOFT]
goto menu
::Again
set cmv=%cmv%
:menu 
echo MCSL LTS 0.5.3
echo [L]atest
echo [C]hangelog
echo [I]nstall or Update to the latest version
SET /P s=Select-[
IF %s%==L GOTO SMCSN
IF %s%==C GOTO changelog
IF %s%==I GOTO inst
IF %s%==l GOTO SMCSN
IF %s%==c GOTO changelog
IF %s%==i GOTO inst
:inst
cls
del BuildTools.jar
set currentdir=.
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
set bashdir="C:\Program Files (x86)\Git\bin\bash.exe"
set bashdir64="C:\Program Files\Git\bin\bash.exe"
%bashdir% --login -i -c "java -jar ""%currentdir%\BuildTools.jar"" --rev %cmv%
%bashdir64% --login -i -c "java -jar ""%currentdir%\BuildTools.jar"" --rev %cmv%
cd %currentdir%
java -jar Spigot-%cmv%.jar
if exist Spigot-%cmv%.jar goto menu else wget https://cdn.getbukkit.org/spigot/spigot-%cmv%.jar
java -jar Spigot-%cmv%.jar
del BuildTools.jar
cls
goto menu
:SMCSN
cls
title Server console
java -jar Spigot_%cmv%.jar
cls
java -jar Spigot-%cmv%.jar
cls
goto menu
pause
cls
goto menu