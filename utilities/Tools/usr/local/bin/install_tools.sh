#!/bin/bash

# Code is poetry

# Script to install gen_debug in order to generate proper problem reporting files.
# Created by black.dragon74 <www.osxlatitude.com>

# Declare runtime vars
testURL="google.com"

# Declare functions required in runtime
function checkConnection(){
	echo "Checking your internet connection...."

	if ping -c 1 $testURL &>/dev/null;
		then
		echo "Internet connectivity is all good to go."
	else
		echo "Unable to connect to the internet. Aborted."
		exit
	fi
}

# Let's start
echo -e "Installing debug report generator...."
checkConnection

# Download the latest version from github
cd /tmp
# Remove old copy, if exists, in temp dir
if [ -e ./gen_debug ];
	then
	rm gen_debug
fi
# Init download
echo "Downloading the latest version from GitHub..."
curl -o gen_debug https://raw.githubusercontent.com/black-dragon74/OSX-Debug/master/gen_debug.sh &>/dev/null

# Install the tool
sudo cp gen_debug /usr/bin
sudo chmod a+x /usr/bin/gen_debug
echo "Tool installed successfully."

# Clean the mess, quietly
rm gen_debug &>/dev/null

# Prompt user for report generation now
read -p "Would you like to generate a report now?[y/n]: " userReply
case $userReply in
	[yY]* )
		echo "Thank You! Generating report in T-2 seconds..."
		sleep 2
		clear
		gen_debug
		;;
	[nN]* )
		echo "Thank You! You can now run the tool anytime from terminal by typing: gen_debug"
		exit
		;;	
	* )
		echo "Invalid option."
		echo "You can generate a report anytime from terminal by typing: gen_debug"
		exit
		;;	
esac
# EOF