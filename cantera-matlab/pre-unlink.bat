@ECHO off
SET "MATLAB_STARTUP=%USERPROFILE%\Documents\MATLAB\startup.m"

:: If the startup.m file already exists, delete any lines added by this script
IF EXIST "%MATLAB_STARTUP%" COPY "%MATLAB_STARTUP%" "%MATLAB_STARTUP%.cantera.bak"
IF EXIST "%MATLAB_STARTUP%.cantera.bak" FINDSTR /V "%% added by Cantera %PKG_VERSION% Conda Installer" "%MATLAB_STARTUP%.cantera.bak" > "%MATLAB_STARTUP%"
