@echo off
:start
color 0a
setlocal enabledelayedexpansion

set curent_path=%~dp0
set dump_data_path=!curent_path!assets\data_grabed
set programm_path=!curent_path!assets\programms
set sd=%temp%\self_destruct
set costom_run=!curent_path!assets\config\costom_run
set current_drive=%CD:~0,2%

%current_drive%
md !dump_data_curent_path!

cd %curent_path%\assets\config
call default_settings.bat
call settings.bat

if not !startup_config_run!==disabled (
set data=%startup_config_run%
goto exicute_config
exit
)

:menu
rd /s /q %temp%\self_destruct
cls
echo Info: You can take out the usb if you want
echo Run programm (1)
echo Run config (2)
echo Documentation (3)
set ask=joe
set /p ask=
md !sd!
if !ask!==1 (
goto run_programm
)
if !ask!==2 (
goto run_config
)
if !ask!==3 (
echo Maybe next time du hurensohn
)
goto menu

:run_config
echo loading configs...
dir /A:D /B !costom_run!>!sd!\configs.txt
set save_read=0
cls
echo:

for /F "tokens=*" %%s in  ( %sd%\configs.txt) do  (
set data=%%s
call :update_var_print
)
echo:
echo --------------------------------------
echo Enter the number of the config
echo Enter sth invalid to go back to main menu
echo --------------------------------------
set ask=joe
set /p ask=
echo verifieing config...

set save_read=0
for /F "tokens=*" %%s in  ( %sd%\configs.txt) do  (
set data=%%s
call :update_var_check_config
)
goto menu


:exicute_config
echo exicuting config
set i=1
for /F "tokens=*" %%s in  ( !costom_run!\%data%\config) do  (
if !i!==1 (
set data0=%%s
set i=2
) else (
set data1=%%s
set i=1
call :exicute_config_data
)

)

::I use these because batch is weird and doesnt update a varialbe inside a for loop

:exicute_config_data
echo %i%
echo %data0%
echo %data1%
cd %HOMEDRIVE%\Windows\System32
set cur_prg_path=!programm_path!\%data0%
call !programm_path!\!data0!\prg.bat !data1!
exit /b

:update_var_print
set /a save_read=%save_read%+1
echo %save_read%	l %data%
exit /b

:update_var_check
set /a save_read=%save_read%+1
if !ask!==!save_read! (
set cur_prg_path=!programm_path!\%data%
call !programm_path!\%data%\prg.bat
goto run_programm
)
exit /b

:update_var_check_config
set /a save_read=%save_read%+1
if !ask!==!save_read! (
call :exicute_config
goto run_config
)
exit /b

:run_programm
echo loading programms...
dir /A:D /B !programm_path!>!sd!\programms.txt
set save_read=0
cls
echo:

for /F "tokens=*" %%s in  ( %sd%\programms.txt) do  (
set data=%%s
call :update_var_print
)

echo:
echo --------------------------------------
echo Enter the number of the programm
echo Enter sth invalid to go back to main menu
echo --------------------------------------
set ask=joe
set /p ask=

echo verifieing programm...

set save_read=0
for /F "tokens=*" %%s in  ( !sd!\programms.txt) do  (
set data=%%s
call :update_var_check
)
goto menu