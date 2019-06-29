echo "****************************"
echo "DEVEL LIBRARY INSTALL STARTED"
echo "****************************"

set -e
rm -f cantera.conf

CI_SUPPORT="${RECIPE_DIR}/../.ci_support"
cp "${CI_SUPPORT}/cantera_base.conf" cantera.conf
if [[ "${OSX_ARCH}" == "" ]]; then
    cat "${CI_SUPPORT}/cantera_linux.conf" >> cantera.conf
    cat "${CI_SUPPORT}/mkl.conf" >> cantera.conf
else
    cat "${CI_SUPPORT}/cantera_osx.conf" >> cantera.conf
fi

scons install
set +e

echo "****************************"
echo "DEVEL LIBRARY INSTALL COMPLETED SUCCESSFULLY"
echo "****************************"
