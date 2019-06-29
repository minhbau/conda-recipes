set +x

echo "****************************"
echo "LIBRARY BUILD STARTED"
echo "****************************"

if [[ "$DIRTY" != "1" ]]; then
    scons clean
fi

rm -f cantera.conf

CI_SUPPORT="${RECIPE_DIR}/../.ci_support"
cp "${CI_SUPPORT}/cantera_base.conf" cantera.conf

if [[ "${OSX_ARCH}" == "" ]]; then
    cat "${CI_SUPPORT}/cantera_linux.conf" >> cantera.conf
    cat "${CI_SUPPORT}/mkl.conf" >> cantera.conf
else
    cat "${CI_SUPPORT}/cantera_osx.conf" >> cantera.conf
fi

set -xe

scons build -j${CPU_COUNT}

set +xe

echo "****************************"
echo "BUILD COMPLETED SUCCESSFULLY"
echo "****************************"
