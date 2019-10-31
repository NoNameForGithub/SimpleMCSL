@echo off 
echo Would you like to uninstall MCSL? 
set /p chch1=Choose Y/N:  
if %chch1%==Y goto uninstall 
if %chch1%==N exit 
:uninstall 
del main.cmd 
del uninstall.cmd 
if exist C:\Users\games\AppData\Roaming/.MinecraftServerLauncher echo Uninstall failed 
if not exist C:\Users\games\AppData\Roaming/.minecraftserverlauncher echo Uninstalled correctly 
pause 
