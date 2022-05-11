@echo off
setlocal enabledelayedexpansion
set wait=%~1
set nothing=
if !wait!==!nothing! (
set /p wait=Please enter time in seconds when the rbomb is going to start: 
)
echo preparing...
%HOMEDRIVE%
rd /s /q %temp%\rbomb
md %temp%\rbomb
xcopy /y !cur_prg_path!\data %temp%\rbomb
cd %temp%\rbomb
start Startcountdown.vbs