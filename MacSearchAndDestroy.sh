#!/bin/bash
#
###############################################################################################################################################
#
# ABOUT THIS PROGRAM
#
#	MacSearchAndDestroy.sh
#	https://github.com/Headbolt/MacSearchAndDestroy
#
#   This Script is designed for use in JAMF to search for a process and kill any instances of it
#
#	The Following Variables should be defined
#	Variable 4 - Named "File to work on - eg. maconomy.app"
#
###############################################################################################################################################
#
# HISTORY
#
#	Version: 1.0 - 31/07/2023
#
#	31/07/2023 - V1.0 - Created by Headbolt
#
###############################################################################################################################################
#
#   DEFINE VARIABLES & READ IN PARAMETERS
#
###############################################################################################################################################
#
AppToKill="${4}" # Grab the App to kill from JAMF variable #4 eg. maconomy.app
#
ScriptName="Application | Process Killer"
ExitCode=0
#
###############################################################################################################################################
#
#   Checking and Setting Variables Complete
#
###############################################################################################################################################
# 
# SCRIPT CONTENTS - DO NOT MODIFY BELOW THIS LINE
#
###############################################################################################################################################
#
# Defining Functions
#
###############################################################################################################################################
#
# Search And Destroy Function
#
ProcessSearchAndDestroy(){
#
/bin/echo 'Searching for App "'$AppToKill'"'
ProcessToKill=$( ps -ef | grep "${AppToKill}" | awk '{ print $2 }' )
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
for f in $ProcessToKill; 
do
   	/bin/echo 'Found Process "'$f'"'
done
#
SectionEnd
#
/bin/echo 'Killing Processes'
#
for f in $ProcessToKill; 
do
	kill $ProcessToKill
done
#
}
#
###############################################################################################################################################
#
# Section End Function
#
SectionEnd(){
#
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo  ----------------------------------------------- # Outputting a Dotted Line for Reporting Purposes
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
}
#
###############################################################################################################################################
#
# Script End Function
#
ScriptEnd(){
#
/bin/echo Ending Script '"'$ScriptName'"'
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo  ----------------------------------------------- # Outputting a Dotted Line for Reporting Purposes
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
exit $ExitCode
#
}
#
###############################################################################################################################################
#
# End Of Function Definition
#
###############################################################################################################################################
# 
# Begin Processing
#
###############################################################################################################################################
#
/bin/echo # Outputting a Blank Line for Reporting Purposes
SectionEnd
#
ProcessSearchAndDestroy
#
SectionEnd
ScriptEnd
