echo "****************************"
echo "DEVEL LIBRARY INSTALL STARTED"
echo "****************************"

set -e
rm -f cantera.conf
cp "${RECIPE_DIR}/.ci_support/cantera_base.conf" cantera.conf
if [[ "${OSX_ARCH}" == "" ]]; then
    cat "${RECIPE_DIR}/.ci_support/cantera_linux.conf" >> cantera.conf
else
    cat "${RECIPE_DIR}/.ci_support/cantera_osx.conf" >> cantera.conf
fi

scons install
set +e

echo "****************************"
echo "DEVEL LIBRARY INSTALL COMPLETED SUCCESSFULLY"
echo "****************************"
