#!/bin/sh

FRAMEWORK=$1

rm -rf "universal"
rm -rf "build"
# set up our build strings
builds=( Debug Release )

# loop to create a universal framework for both debug and release
for i in "${builds[@]}"
do (
echo $i

# set folders
echo "setting folders"
OUTPUT_FOLDER=universal/$i
DEVICE_FOLDER=build/$i-iphoneos/$FRAMEWORK.framework
SIMULATOR_FOLDER=build/$i-iphonesimulator/$FRAMEWORK.framework

# build with xcodebuild
echo "building"
xcodebuild -configuration $i -target "$FRAMEWORK" -sdk iphoneos
xcodebuild -configuration $i -target "$FRAMEWORK" -sdk iphonesimulator

# out with the old
if [ -d "${OUTPUT_FOLDER}" ]
then
rm -rf "${OUTPUT_FOLDER}"
fi

# copy headers and resources files to the final product folder

mkdir -p "${OUTPUT_FOLDER}/$FRAMEWORK.framework"

cp -a "${DEVICE_FOLDER}" "${OUTPUT_FOLDER}"
cp -a "${SIMULATOR_FOLDER}/Modules/$FRAMEWORK.swiftmodule/" "${OUTPUT_FOLDER}/$FRAMEWORK.framework/Modules/$FRAMEWORK.swiftmodule"

echo "merging"
# merge into a universal framework
lipo -create "${DEVICE_FOLDER}/$FRAMEWORK" "${SIMULATOR_FOLDER}/$FRAMEWORK" -output "${OUTPUT_FOLDER}/$FRAMEWORK.framework/$FRAMEWORK"

)
done
echo "done"
