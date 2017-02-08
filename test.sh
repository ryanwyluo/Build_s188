#!/bin/bash

#[Variables]
#===================================================
#PNOR_NAME=firestone.pnor
PNOR_NAME=reddragon.pnor
PNOR_PATH=output/images

PNOR_OUTPUT_PATH=output/images
PNOR_OUTPUT_NAME="$PNOR_NAME"

Platform_Name=reddragon
Platform_PNOR_Name="$Platform_Name".pnor
#===================================================

echo test123
echo "$PNOR_OUTPUT_NAME"
echo "$Platform_PNOR_Name"

Build_Status=0
function BuildImageCheck(){
    if [ -f "$PNOR_OUTPUT_PATH"/"$PNOR_OUTPUT_NAME" ]; then
        echo "$PNOR_OUTPUT_NAME" exists.
        Build_Status=1
    else
        echo "$PNOR_OUTPUT_NAME" does not exist.
        Build_Status=0
    fi
}

BuildImageCheck
if [ "$Build_Status" == "1" ]; then
    echo Build status  1
else
    echo build status 0
fi

#[Clear the exist files]
#===================================================
#call "build_clean_log.sh" to clear log before build.
#~if [ -f "$PNOR_PATH"/"$PNOR_NAME" ];
#~then
#~	echo image exists, remove it.
#~	rm -f "$PNOR_PATH"/"$PNOR_NAME"
#~fi
#~
#~if [ ! -f "$PNOR_PATH"/"$PNOR_NAME" ];
#~then
#~	echo Output image DOES NOT exists.
#~fi
#===================================================

#if $HOSTBOOT_DEBUG exist.
#if [ ! -z $HOSTBOOT_DEBUG ];  
#then
#	echo Variable HOSTBOOT_DEBUG exist, remove it.
#    unset HOSTBOOT_DEBUG
#fi


#if [ -n $HOSTBOOT_DEBUG ];  #if $HOSTBOOT_DEBUG does not exist.
#then
#	echo Varaible HOSTBOOT_DEBUG does not exist.
#    unset $HOSTBOOT_DEBUG
#fi
#export HOSTBOOT_DEBUG=1

