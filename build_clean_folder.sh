#!/bin/bash

#Definition of variables
ReleaseDir=

function RemoveLogDirectory(){
    if [ -d "$ReleaseDir" ]; then
        echo "$ReleaseDir" exists and remove it.
        #sudo rm -rf "$ReleaseDir"
        rm -rf "$ReleaseDir"
    else
        echo "$ReleaseDir" does not exist.
    fi
}

#clear release folder in folder output.
ReleaseDir=$1
RemoveLogDirectory "$1"

