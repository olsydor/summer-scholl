#!/bin/bash
#Helper functions
function printError() {
    printf "[${BIRed}ERROR${NC}] $1\n"
    exit -1
}
#only ROOT can run the script
if [ $UID -eq 0 ]
then
echo "You are alowed to run this scenario"
else
    printError "You must to be ROOT to run this script"
fi