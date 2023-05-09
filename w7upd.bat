@echo off
MODE con:cols=140 lines=30
color A
:menu
cls
type logo.txt
echo Welcome! What action do you want to peform
echo ============================================
echo [1] Run Script
echo [2] Credits
echo [3] Exit
set /p M=Type 1-3 Then press enter 
if %M%==1 goto script
if %M%==2 goto credits
if %M%==3 goto quit
if %M%==7002 goto eggcrash
:crash
cls
sounder.exe error.wav
type err.txt
echo Crashtype: Script Error
pause
exit /b
:eggcrash
cls
sounder.exe error.wav
type err.txt
echo Crashtype: Hidden Easter egg hahahaahah
pause
goto menu
:credits
cls
type crds.txt
echo Installation script developed by 7002_
echo Update files sourced by LennyB576
echo Update files developed by Microsoft
pause
cls
goto menu
:quit
exit /b
:restart
shutdown /r
goto menu
:script
echo Installing windowsupdateagent..
start /w windowsupdateagent-7.6-x64.exe /WuForce /Quiet /NoRestart 
echo Done installing windowsupdateagent!
echo Installing Windows Update Packages..
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
FOR /R "%~dp0" %%A IN (*.MSU) DO (
        ECHO= Installing %%~nA
        >NUL TIMEOUT /t 3
        WUSA "%%A" /quiet /norestart)
echo Done installing Updates!
sounder.exe complete.wav
cls
type succ.txt 
echo The script completed successfully! However to apply the updates you must restart your computer, what would you like to do
echo =========================================================================================================================   
echo [1] Restart
echo [2] Restart later
set /p M=Type 1-2 Then press enter 
if %M%==1 goto restart
if %M%==2 goto menu