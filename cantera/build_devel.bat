ECHO ************************
ECHO DEVEL BUILD STARTED
ECHO ************************

DEL /F cantera.conf
SET CI_SUPPORT="%RECIPE_DIR%\..\.ci_support"
COPY "%CI_SUPPORT%\cantera_base.conf"
TYPE "%CI_SUPPORT%\cantera_win.conf" >> cantera.conf
CALL scons install

ECHO ************************
ECHO DEVEL BUILD COMPLETED SUCCESSFULLY
ECHO ************************
