echo ****************************
echo PYTHON BUILD STARTED
echo ****************************
SET "ESC_PYTHON=%PYTHON:\=/%"
ECHO python_package='full' >> cantera.conf
ECHO python_cmd="%ESC_PYTHON%" >> cantera.conf
CALL scons build
IF ERRORLEVEL 1 EXIT 1
cd interfaces/cython
"%PYTHON%" setup.py build --build-lib=../../build/python install
IF ERRORLEVEL 1 EXIT 1
