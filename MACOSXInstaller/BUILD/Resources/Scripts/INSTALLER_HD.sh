#!/bin/bash
# script for Installer macOS High Sierra HD
# Copyright chris1111 http://hackintosh-montreal.com
echo $'
Make sure you have Install MacOS High Sierra Beta.app
In your Applications: '
echo " 
#####################################################################"

### Check if a directory exist ###
if [ ! -d "/Applications/Install macOS High Sierra Beta.app" ] 
then
    echo "Directory /Applications/Install macOS High Sierra Beta.app is not in your Applications!
Set your MacOS High Sierra Beta.app and try again." 
    exit 12345
fi


Sleep 3

osascript -e 'tell app "System Events" to display dialog "
Starting startosinstall
Disable Gatekeeper first!" with icon file "System:Library:CoreServices:CoreTypes.bundle:Contents:Resources:FileVaultIcon.icns" buttons {"Disable Gatekeeper"} default button 1 with title "startosinstall"'

osascript -e 'do shell script "sudo spctl --master-disable" with administrator privileges'


"/Applications/Install macOS High Sierra Beta.app/Contents/Resources/startosinstall" --applicationpath "/Applications/Install macOS High Sierra Beta.app" --rebootdelay 30 --nointeraction





