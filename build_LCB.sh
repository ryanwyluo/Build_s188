#!/bin/bash

PNOR_NAME=firestone.pnor
PNOR_PATH=output/images

#List all sections in PNOR image
output/host/usr/bin/fcp -L -o 0 "$PNOR_PATH"/"$PNOR_NAME"
