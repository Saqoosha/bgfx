#!/bin/bash -xe
rm -rfv .build/projects/gmake-ios-arm64 .build/projects/gmake-ios-simulator64
make -j8 ios-simulator64 ios-arm64
mkdir -p .build/ios-universal64
for r in Release Debug
do
    for m in bgfx bx bimg
    do
        N=lib${m}${r}.a
        lipo -create .build/ios-simulator64/bin/${N} .build/ios-arm64/bin/${N} -output .build/ios-universal64/${N}
    done
done
