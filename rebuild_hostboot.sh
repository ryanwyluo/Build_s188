#!/bin/bash

#Definition of variables
MODULE_NAME=hostboot-5a94e290bf5ff80147b818e131b52964bb099efe
MODULE_NAME_ORG=hostboot-5a94e290bf5ff80147b818e131b52964bb099efe_org
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

