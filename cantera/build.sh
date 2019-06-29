set +x

echo "****************************"
echo "LIBRARY BUILD STARTED"
echo "****************************"

if [[ "$DIRTY" != "1" ]]; then
    scons clean
fi

rm -f cantera.conf
cp "${RECIPE_DIR}/.ci_support/cantera_base.conf" cantera.conf

if [[ "${OSX_ARCH}" == "" ]]; then
    cat "${RECIPE_DIR}/.ci_support/cantera_linux.conf" >> cantera.conf
    cat "${RECIPE_DIR}/.ci_support/mkl.conf" >> cantera.conf
else
    cat "${RECIPE_DIR}/.ci_support/cantera_osx.conf" >> cantera.conf
fi

set -xe

scons build -j${CPU_COUNT}

set +xe

echo "****************************"
echo "BUILD COMPLETED SUCCESSFULLY"
echo "****************************"
