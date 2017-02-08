#!/bin/bash

#Definition of variables
LogFile=

function RemoveLogFile(){
    if [ -f "$LogFile" ]; then
        echo "$LogFile" exists and remove it.
        #sudo rm -f "$LogFile"
        rm -f "$LogFile"
    else
        echo "$LogFile" does not exist.
    fi
}

LogFile=$1
RemoveLogFile $1

