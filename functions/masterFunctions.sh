#!/bin/bash

## Master function script
## this script will call all functions in this directory
## Network functions will be loaded in "../functions/functionsNetworkProfileSelection"

## This is just a master test script it wont be used for something :-)
. ./functions/masterVariables.sh

# Import other functions
. ./functions/functionFormatDisk.sh
. ./functions/functionRootCheck.sh
. ./functions/functionDownloadSources.sh
. ./functions/test.sh
