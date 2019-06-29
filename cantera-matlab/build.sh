set +x

echo "****************************"
echo "MATLAB BUILD STARTED"
echo "****************************"

if [[ "$DIRTY" != "1" ]]; then
    scons clean
fi

rm -f cantera.conf
cp "${RECIPE_DIR}/.ci_support/cantera_base.conf" cantera.conf

if [[ "${OSX_ARCH}" == "" ]]; then
    cat "${RECIPE_DIR}/.ci_support/cantera_linux.conf" >> cantera.conf
else
    cat "${RECIPE_DIR}/.ci_support/cantera_osx.conf" >> cantera.conf
fi

echo "matlab_toolbox = 'y'" >> cantera.conf
echo "matlab_path = '${MW_HEADERS_DIR}'" >> cantera.conf

set -xe

scons build -j${CPU_COUNT}
scons install

set +xe
