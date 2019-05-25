echo "removing artifacts..."
rm -r build/

mkdir -p build/scripts

echo "copying..."
cp -r scripts/* build/scripts/
cp CONTRIBUTORS build/
cp damageindicators.* build/
cp LICENSE build/
cp *.lua build/
cp README* build/

echo "Finished."