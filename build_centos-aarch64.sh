#!/bin/bash

## Import Variables & Functions from external sources
. ./functions/masterVariables.sh
. ./functions/masterFunctions.sh

#########################################################################################
### RUNTIME                                                                           ###
#########################################################################################

# Run functions
functionRootCheck
functionFormatDisk
functionDownloadSources
#test
functionExtractImage
functionCreateFstab
