#!/bin/bash

#Definition of variables
PNOR_ID=O
Model_ID=S188
Chipset_ID=P
Customer_ID=MS
PNOR_Release_version1=1
PNOR_Release_version2=0
PNOR_Beta_version2=1
PNOR_Name="$PNOR_ID""$Model_ID""$Chipset_ID""$Customer_ID"."$PNOR_Release_version1""$PNOR_Release_version2""$PNOR_Beta_version2"
Release_Folder="$PNOR_ID""$Model_ID""$Chipset_ID""$Customer_ID""$PNOR_Release_version1""$PNOR_Release_version2""$PNOR_Beta_version2"

Platform_Name=reddragon
Platform_PNOR_Name="$Platform_Name".pnor
Platform_PNOR_Update_Name="$Platform_Name"_update.pnor

PNOR_OUTPUT_PATH=output/images
PNOR_OUTPUT_NAME="$Platform_PNOR_Name"

Build_Status=0  #0:Success, 1:build fail

#[Function call]
function BuildImageCheck(){
    if [ -f "$PNOR_OUTPUT_PATH"/"$PNOR_OUTPUT_NAME" ]; then
        echo "$PNOR_OUTPUT_NAME" exists.
        Build_Status=0
    else
        echo "$PNOR_OUTPUT_NAME" does not exist.
        Build_Status=1
    fi
}


#[Clear the exist files]
#===================================================
#call "build_clean_log.sh" to clear log before build.
#. build_clean_log.sh output/$Release_Folder
. build_clean_file.sh build.log
. build_clean_file.sh buildtime.log
. build_clean_file.sh pnorversion.txt
. build_clean_folder.sh output/$Release_Folder
#===================================================


#[Build Process]
#===================================================
#log system time 
echo Build Start > buildtime.log
#hwclock >> buildtime.log
date >> buildtime.log

#build the compile environment.
. op-build-env

#clear up the output files.
op-build clean

#build the source code. need to connect to internet.
#Ref. Doc : 
#  buildroot\docs\manual\rebuilding-packages.txt
#  buildroot\docs\manual\package-make-target.txt

op-build "$Platform_Name"_defconfig && op-build 2>&1 | tee build.log

#log system time 
echo Build Stop >> buildtime.log
#hwclock >> buildtime.log
date >> buildtime.log
#===================================================

#Check the output image status.
BuildImageCheck
if [ "$Build_Status" == "0" ]; then
    echo =============================
    echo = Build SUCCESSFULLY.
    echo =============================
else
    echo =============================
    echo = Build FAIL!!
    echo =============================
fi

if [ "$Build_Status" == "0" ]; then
#[Create version]
#===================================================
#create the version list of PNOR modules.
echo Creating the PNOR version...
op-build openpower-pnor-version > pnorversion.txt
#===================================================


#[Create release ]
#===================================================
echo Creating release folder...
mkdir output/$Release_Folder
cp "$PNOR_OUTPUT_PATH"/$Platform_PNOR_Name output/$Release_Folder/$PNOR_Name
cp pnorversion.txt output/$Release_Folder/
#===================================================

#[Create PNOR Section Info]
#===================================================
#List all sections in PNOR image
output/host/usr/bin/fcp -L -o 0 "$PNOR_OUTPUT_PATH"/$Platform_PNOR_Name
#===================================================
fi  #if [ "$Build_Status" == "0" ]; then


echo [ Build finish ]
#Show the build time stamp
cat buildtime.log

