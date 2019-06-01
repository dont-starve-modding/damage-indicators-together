#/bin/bash
SUFFIX=$(ls *.tex| cut -c1-6)
MODS_PATH="/c/Program Files (x86)/Steam/steamapps/common/Don't Starve Together/mods"

echo "removing..."
rm -r "${MODS_PATH}/build-${SUFFIX}"

echo "copying to ${MODS_PATH}/build-${SUFFIX} ..."
cp -r build "${MODS_PATH}/build-${SUFFIX}"