#!/bin/bash

#This path is depended on the path of the patch folder.
PATCH_DIR=/home/ryan/S0701ShareUbuntu/op-build_s188patch/
#REDDRAGON_NAME=reddragon-xml-201610211023aaaa8ef279aef2d0a0fed3ded8dd
REDDRAGON_NAME=reddragon-xml-20161216ffeeaaaa8ef279aef2d0a0fed3ded8dd
SKIBOOT_NAME=skiboot-skiboot-5.3.7

#copy s188 related files to current build folder.
cp -r "$PATCH_DIR"/build* /home/op-build/
cp -r "$PATCH_DIR"/openpower* /home/op-build/
cp -r "$PATCH_DIR"/dl/"$REDDRAGON_NAME".tar.gz /home/op-build/dl
cp -r "$PATCH_DIR"/dl/"$SKIBOOT_NAME".tar.gz /home/op-build/dl


