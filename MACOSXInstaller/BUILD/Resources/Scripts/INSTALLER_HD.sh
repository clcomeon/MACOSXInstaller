#!/bin/bash
# script MACOSXInstaller
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


   #####################################################################
#get OSX Installer path
if [ "$2" == "" ]; then

echo -n "Please Move to the window\"your SSD or HD\"
Follow by ENTER: "
while [ -z "$OSX" ]; do
read OSX
done
if [ ! -d "$OSX" ]; then echo "$OSX not found"; exit; fi 
else
OSX="$2"
fi
 


osascript -e 'tell app "System Events" to display dialog "
Open startosinstall!" with icon file "System:Library:CoreServices:CoreTypes.bundle:Contents:Resources:FileVaultIcon.icns" buttons {"Start"} default button 1 with title "startosinstall"'



"/Applications/Install macOS High Sierra Beta.app/Contents/Resources/startosinstall" --applicationpath "/Applications/Install macOS High Sierra Beta.app" --converttoapfs YES --volume /"$OSX" --rebootdelay 30 --nointeraction

exit


