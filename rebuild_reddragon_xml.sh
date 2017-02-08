#!/bin/bash

#Definition of variables
MODULE_NAME=reddragon-xml-a66d155f095236e17012ddd99b3ae11234f0bb48
MODULE_NAME_ORG=reddragon-xml-a66d155f095236e17012ddd99b3ae11234f0bb48_org
MODULE_PATH=dl/
COMPRESS_TYPE=tar.gz
BUILD_MODULE_NAME="$MODULE_NAME"
BUILD_MODULE_PATH=output/build/


#[Clear the exist files and output files]
#===================================================
rm -rf "$MODULE_PATH""$BUILD_MODULE_NAME"."$COMPRESS_TYPE"
rm -rf "$BUILD_MODULE_PATH""$BUILD_MODULE_NAME"
#===================================================

#[Compress the source code and replace the current one.]
#===================================================
cd "$MODULE_PATH"

#Tar the new hostboot source code
tar -zcvf "$BUILD_MODULE_NAME"."$COMPRESS_TYPE" "$BUILD_MODULE_NAME"
echo tar -zcvf "$BUILD_MODULE_NAME"."$COMPRESS_TYPE" "$BUILD_MODULE_NAME"

#Tar the org hostboot source code
#tar -zcvf "$BUILD_MODULE_NAME"."$COMPRESS_TYPE" "$MODULE_NAME_ORG"
#echo tar -zcvf "$BUILD_MODULE_NAME"."$COMPRESS_TYPE" "$MODULE_NAME_ORG"

cd ..
#===================================================

