ECHO ************************
ECHO DEVEL BUILD STARTED
ECHO ************************

DEL /F cantera.conf
COPY "%RECIPE_DIR%\.ci_support\cantera_base.conf"
COPY "%RECIPE_DIR%\.ci_support\cantera_win.conf"
CALL scons install

ECHO ************************
ECHO DEVEL BUILD COMPLETED SUCCESSFULLY
ECHO ************************
