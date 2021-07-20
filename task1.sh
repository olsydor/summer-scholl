#!/bin/bash

#Title: Create scenario to change the owner of files and folders
#Parameters: 
#$1 <username>
#$2 <directory>

BIRed='\033[1;91m'
Purple='\033[0;35m'
NC='\033[0m' # No Color

#Helper functions
function printError() {
    printf "[${BIRed}ERROR${NC}] $1\n"
    exit -1
}

function userExists() {
    id "$1" &>/dev/null
}

#check user
if [ $UID -ne 0 ]; then
	printError "You must be root"
	exit -1
fi

#check write info
if [ $# -ne 2 ]; then
	printError "Please write <user> and <dir>"
	exit -1
fi

#check user using function
if ! userExists "$1" ; then
	printError "User $1 does not exist"
	exit -1
fi

#check dir available
if [ ! -d "$2" ]; then
    	printError "Directory $2 DOES NOT exists." 
    	exit -1
fi

#chown
res=$(chown -R $1:$1 $2)
printf "[${Purple}SUCCES${NC}] Owner is $1 for $2 directory."
exit -1