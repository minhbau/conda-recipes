:: This script adds the appropriate setup lines to startup.m
:: This script will edit files in the user's Documents directory,
:: in direct contravention of the guideline from Conda to not
:: edit any files outside the install prefix. This seems like the
:: easiest way to set these variables though; the alternative is
:: to make people type/add these lines themselves. /shrug
@ECHO off
SET "MATLAB_STARTUP=%USERPROFILE%\Documents\MATLAB\startup.m"

:: If the startup.m file already exists, delete any lines added by this script
IF EXIST "%MATLAB_STARTUP%" COPY "%MATLAB_STARTUP%" "%MATLAB_STARTUP%.cantera.bak"
IF EXIST "%MATLAB_STARTUP%.cantera.bak" FINDSTR /V "%% added by Cantera %PKG_VERSION% Conda Installer" "%MATLAB_STARTUP%.cantera.bak" > "%MATLAB_STARTUP%"

:: Add Cantera lines to the startup.m script
ECHO. >> "%MATLAB_STARTUP%"
ECHO setenv('CANTERA_DATA', '%PREFIX%\Library\cantera\data') %% added by Cantera %PKG_VERSION% Conda Installer>> "%MATLAB_STARTUP%"
ECHO addpath(genpath('%PREFIX%\Library\lib\cantera\matlab')) %% added by Cantera %PKG_VERSION% Conda Installer>> "%MATLAB_STARTUP%"