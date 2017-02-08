#!/bin/bash

#Definition of variables
LogFile=build.log

function RemoveLogFile(){
    if [ -f "$LogFile" ]; then
        echo "$LogFile" exists and remove it.
        #sudo rm -f "$LogFile"
        rm -f "$LogFile"
    else
        echo "$LogFile" does not exist.
    fi
}

LogFile=build.log
RemoveLogFile "$LogFile"

LogFile=buildtime.log
RemoveLogFile "$LogFile"

LogFile=pnorversion.txt
RemoveLogFile "$LogFile"

