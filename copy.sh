#/bin/bash
echo "removing..."
rm -r "/c/Program Files (x86)/Steam/steamapps/common/Don't Starve Together/mods/build"
echo "copying to /c/Program Files (x86)/Steam/steamapps/common/Don't Starve Together/mods ..."
cp -r build "/c/Program Files (x86)/Steam/steamapps/common/Don't Starve Together/mods"