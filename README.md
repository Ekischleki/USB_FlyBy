# USB_FlyBy
Littly programm that can do stuff like steal wifi passwords using just a USB


## Creating Programms
Locate the programms folder at \assets\programms and create a new folder called *Name of your Programm* (Should only have letters in the alphabet and maybe _)
Create a file in your programm called prg.bat
If your programm is chosen, the launcher will start prg.bat, after that, you can do anything you want with the file.

## Settings

Locate the settings at \assets\config\settings.bat
There should also be a file called default_settings.bat, but that should stay untuched.

Right click on settings.bat file and scelect edit

-All settings

__startup_config_run:__

The default state of this setting is:
`disabled`

Usage:
If this setting is at anything other than disabled, the run file will not take you to the main menu but will exicute the name of the costom_run file and than exit.

EG:

`set startup_config_run=grabData`

If you start the launcher now it will run the config grabData and exit
